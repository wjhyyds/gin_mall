package itying

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

type UserController struct{}

func (con UserController) Index(c *gin.Context) {
	c.String(http.StatusOK, "首页")
}

func (con UserController) OrderList(c *gin.Context) {
	c.String(http.StatusOK, "订单页面")
}
func (con UserController) OrderInfo(c *gin.Context) {
	c.String(http.StatusOK, "订单详情页面")
}
