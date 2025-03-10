package models

type GoodsTypeAttribute struct { //配置这个json和获取前端返回数据
	Id        int    `json:"id"`
	CateId    int    `json:"cate_id"`
	Title     string `json:"title"`
	AttrType  int    `json:"attr_type"`
	AttrValue string `json:"attr_value"`
	Status    int    `json:"status"`
	Sort      int    `json:"sort"`
	AddTime   int    `json:"add_time"`
}

func (GoodsTypeAttribute) TableName() string {
	return "goods_type_attribute"
}
