package main

import (
	"fmt"

	ypclnt "github.com/yunpian/yunpian-go-sdk/sdk"
)

func main() {
	// 发送短信

	// clnt := ypclnt.New("62c24eee15fxxxxxxxxxxxxxxxe0beca9e0a") //apikey https://www.yunpian.com/官网获取
	// param := ypclnt.NewParam(2061690)                      //模板id
	// param[ypclnt.MOBILE] = "15029745801"
	// param[ypclnt.TEXT] = "【IT营】您的验证码是888897"
	// r := clnt.Sms().SingleSend(param)
	// fmt.Println(r)

	//发送语音
	clnt := ypclnt.New("62c24eee15fxxxxxxxxxxxxxxxe0beca9e0a") //apikey
	param := ypclnt.NewParam(2061690)                          //模板id
	param[ypclnt.MOBILE] = "15029745801"
	param[ypclnt.CODE] = "888897"
	r := clnt.Voice().Send(param)
	fmt.Println(r)
}
