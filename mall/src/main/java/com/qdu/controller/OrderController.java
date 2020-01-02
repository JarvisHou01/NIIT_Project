package com.qdu.controller;

import com.qdu.bean.OrderVo;
import com.qdu.bean.Page;
import com.qdu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

@RequestMapping("order")
public class OrderController {

    @Autowired
    OrderService orderService;

    @RequestMapping("to_list")
    public String to_list(){
        return "order/list";
    }

    @RequestMapping("list")
    @ResponseBody
    public Page<OrderVo> list(@RequestParam(required = false,defaultValue = "1") int pageNum,
                              @RequestParam(required = false,defaultValue = "3") int pageSize){
        return orderService.queryList(pageNum,pageSize);
    }

    @RequestMapping("update")
    public String updateOrder(@RequestParam int status,@RequestParam int id){
        int res = orderService.updateOrderStatus(status,id);
        return "order/list";
    }

}