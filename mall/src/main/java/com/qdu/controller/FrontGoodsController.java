package com.qdu.controller;

import com.qdu.bean.Goods;
import com.qdu.bean.Orders;
import com.qdu.bean.Page;
import com.qdu.bean.Result;
import com.qdu.service.GoodsService;
import com.qdu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("frontgoods")
public class FrontGoodsController {

    @Autowired
    GoodsService goodsService;

    @Autowired
    OrderService orderService;

    @RequestMapping("/to_list")
    public String to_list(){
        return "frontgoods/list";
    }

    @RequestMapping("queryList")
    @ResponseBody
    public Page<Goods> queryList(@RequestParam(required = false,defaultValue = "1") int pageNum,
                                 @RequestParam(required = false,defaultValue = "5")int pageSize,
                                 @RequestParam("category") String category,
                                 @RequestParam("name") String name,
                                 @RequestParam("status") int status){

        Page<Goods> goodsPage = goodsService.queryListByTag(pageNum, pageSize, category, name, status);

        return goodsPage;
    }

    @RequestMapping("toInfo")
    public ModelAndView toInfo(@RequestParam int id){
        ModelAndView modelAndView = new ModelAndView();
        Goods goods = goodsService.queryGoodsById(id);
        modelAndView.addObject("goods",goods);
        modelAndView.setViewName("frontgoods/info");
        return modelAndView;
    }

    @RequestMapping("buy")
    @ResponseBody
    @Transactional
    public Result buy(@RequestParam int gid,@RequestParam int num,@RequestParam int uid){
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
                    result.setCode(200);
                    result.setMsg("yes");
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
            result.setMsg("库存不足");
        }
        return result;
    }

}
