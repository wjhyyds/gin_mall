package itying

import (
	"ginshop54/models"

	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

type BuyController struct {
	BaseController
}

func (con BuyController) Checkout(c *gin.Context) {
	//1、获取购物车中选择的商品

	cartList := []models.Cart{}
	models.Cookie.Get(c, "cartList", &cartList) //获取cookie中保存的商品信息

	orderList := []models.Cart{}
	var allPrice float64
	var allNum int

	for i := 0; i < len(cartList); i++ {
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
			orderList = append(orderList, cartList[i])
			allNum += cartList[i].Num
		}
	}

	//2、获取当前用户的收货地址

	user := models.User{}
	models.Cookie.Get(c, "userinfo", &user)
	addressList := []models.Address{}
	models.DB.Where("uid = ?", user.Id).Order("id desc").Find(&addressList)

	//3、生成签名
	orderSign := models.Md5(models.GetRandomNum())
	session := sessions.Default(c)
	session.Set("orderSign", orderSign) //相当于一个tokens
	session.Save()

	//4、判断orderList数据是否存在
	if len(orderList) == 0 { //刷新导致重新生成Checkout方法，签名重新生成了但是购物车没有数据
		c.Redirect(302, "/")
		return
	}

	con.Render(c, "itying/buy/checkout.html", gin.H{
		"orderList":   orderList,
		"allPrice":    allPrice,
		"allNum":      allNum,
		"addressList": addressList,
		"orderSign":   orderSign,
	})

}

/*
提交订单执行结算
   1、获取用户信息 获取用户的收货地址信息
   2、获取购买商品的信息
   3、把订单信息放在订单表，把商品信息放在商品表
   4、删除购物车里面的选中数据
   5、跳转到支付页面
*/
func (con BuyController) DoCheckout(c *gin.Context) {
	//0、防止重复提交订单
	orderSignClient := c.PostForm("orderSign") //获取表单数据里面的这个数据
	session := sessions.Default(c)
	orderSignSession := session.Get("orderSign") //空接口类型
	orderSignServer, ok := orderSignSession.(string) //判断服务端和客户端的唯一标识一不一样
	if !ok {
		c.Redirect(302, "/")
		return
	}

	if orderSignClient != orderSignServer {
		c.Redirect(302, "/")//重复创建，返回首页
		return
	}
	session.Delete("orderSign") //这里删掉了，再次点击去结算按钮就会302重定向
	session.Save()

	// 1、获取用户信息 获取用户的收货地址信息
	user := models.User{}
	models.Cookie.Get(c, "userinfo", &user)

	addressResult := []models.Address{}
	models.DB.Where("uid = ? AND default_address=1", user.Id).Find(&addressResult)
	if len(addressResult) == 0 {
		c.Redirect(302, "/buy/checkout")
		return
	}

	// 2、获取购买商品的信息
	cartList := []models.Cart{}
	models.Cookie.Get(c, "cartList", &cartList)
	orderList := []models.Cart{}
	var allPrice float64
	for i := 0; i < len(cartList); i++ {
		if cartList[i].Checked {
			allPrice += cartList[i].Price * float64(cartList[i].Num)
			orderList = append(orderList, cartList[i])
		}
	}
	// 3、把订单信息放在订单表，把商品信息放在商品表
	order := models.Order{
		OrderId:     models.GetOrderId(),
		Uid:         user.Id,
		AllPrice:    allPrice,
		Phone:       addressResult[0].Phone,
		Name:        addressResult[0].Name,
		Address:     addressResult[0].Address,
		PayStatus:   0,
		PayType:     0,
		OrderStatus: 0,
		AddTime:     int(models.GetUnix()),
	}

	err := models.DB.Create(&order).Error
	//增加数据成功以后可以通过  order.Id
	if err == nil {
		// 把商品信息放在商品对应的订单表
		for i := 0; i < len(orderList); i++ { // TODO: 优化这里如果增加失败的话 增加事务用来回滚操作
			orderItem := models.OrderItem{
				OrderId:      order.Id,
				Uid:          user.Id,
				ProductTitle: orderList[i].Title,
				ProductId:    orderList[i].Id,
				ProductImg:   orderList[i].GoodsImg,
				ProductPrice: orderList[i].Price,
				ProductNum:   orderList[i].Num,
				GoodsVersion: orderList[i].GoodsVersion,
				GoodsColor:   orderList[i].GoodsColor,
			}
			models.DB.Create(&orderItem)
		}
	}

	// 4、删除购物车里面的选中数据
	noSelectCartList := []models.Cart{}
	for i := 0; i < len(cartList); i++ {
		if !cartList[i].Checked {
			noSelectCartList = append(noSelectCartList, cartList[i])//保留没被选中的
		}
	}
	models.Cookie.Set(c, "cartList", noSelectCartList) //更新购物车数据

	c.Redirect(302, "/buy/pay?orderId="+models.String(order.Id))
}

//支付
func (con BuyController) Pay(c *gin.Context) {

	orderId, err := models.Int(c.Query("orderId"))
	if err != nil {
		c.Redirect(302, "/")
	}
	//获取用户信息
	user := models.User{}
	models.Cookie.Get(c, "userinfo", &user)
	//获取订单信息
	order := models.Order{}
	models.DB.Where("id = ?", orderId).Find(&order)
	if order.Uid != user.Id {
		c.Redirect(302, "/")
		return
	}
	//获取订单对应的商品

	orderItems := []models.OrderItem{}
	models.DB.Where("order_id = ?", orderId).Find(&orderItems)

	con.Render(c, "itying/buy/pay.html", gin.H{
		"order":      order,
		"orderItems": orderItems,
	})
}
