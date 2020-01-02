package com.qdu.controller;

import com.qdu.bean.*;
import com.qdu.service.GoodsService;
import com.qdu.service.OrderService;
import com.qdu.service.ShopCarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@RequestMapping("shopcar")
@Controller
public class ShopCarController {

    @Autowired
    ShopCarService shopCarService;

    @Autowired
    GoodsService goodsService;

    @Autowired
    OrderService orderService;


    @RequestMapping("to_list")
    public String to_list(){
        return "shopcar/list";
    }

    @RequestMapping("add")
    @ResponseBody
    public Result add(@RequestParam int gid,@RequestParam int uid,@RequestParam int count){
        Result result = new Result();
        int res = shopCarService.add(gid,uid,count);
        if (res>0){
            result.setCode(200);
            result.setMsg("yes");
        }else {
            result.setCode(500);
            result.setMsg("wrong");
        }
        return result;
    }

    @RequestMapping("queryList")
    @ResponseBody
    public Page<ShopCarVo> queryList(@RequestParam(required = false,defaultValue = "1") int pageNum,
                                     @RequestParam(required = false,defaultValue = "3") int pageSize,@RequestParam int uid){
        return shopCarService.queryList(pageNum,pageSize,uid);
    }
    @RequestMapping("buy")
    @ResponseBody
    @Transactional
    public Result buy(@RequestParam int gid,@RequestParam int num,@RequestParam int uid,@RequestParam int carId){
        Result result = new Result();
        Goods goods = goodsService.queryGoodsById(gid);
        if (goods.getStock()-num>=0){
            goods.setStock(goods.getStock()-num);
            int i = goodsService.updateGoods(goods);
            if (i>0){
                Orders order = new Orders();
                order.setGid(goods.getId());
                order.setUid(uid);
                order.setCount(num);
                order.setStatus(0);

                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String format = simpleDateFormat.format(new Date());
                order.setCreatetime(format);
                order.setUpdatetime(format);
                int re = orderService.addOrder(order);
                if (re>0){

                    //删除购物车的东西根据id
                    int res = shopCarService.delById(carId);
                    if (res>0){
                        result.setCode(200);
                        result.setMsg("yes");
                    }

                }else {
                    result.setCode(500);
                    result.setMsg("wrong");
                }

            }else {
                result.setCode(500);
                result.setMsg("wrong");
            }
        }else {
            result.setCode(500);
            result.setMsg("notEnough");
            //删除购物车的东西根据id
            int res = shopCarService.delById(carId);
        }
        return result;
    }

    @RequestMapping("del")
    @ResponseBody
    public Result del(@RequestParam int carId){
        int i = shopCarService.delById(carId);
        Result result = new Result();
        if (i>0){
            result.setCode(200);
            result.setMsg("yes");
        }else {
            result.setCode(500);
            result.setMsg("no");
        }
        return result;
    }

}
