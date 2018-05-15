package com.bonzzy.orderserver.controller;

import com.bonzzy.orderserver.domain.OrderInfo;
import com.bonzzy.orderserver.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping(value="/hello", method= RequestMethod.GET)
    @PreAuthorize("hasAuthority('query-order')")
    public String hello(){
        return "hello!";
    }

    @RequestMapping(value="/query/{orderNumber}", method=RequestMethod.GET)
    @ResponseBody
    public OrderInfo query(@PathVariable("orderNumber") String orderNumber){
       List<OrderInfo> list = orderService.queryOrderInfomationByOrderNumber(orderNumber);
       if(list.size() > 0){
           return list.get(0);
       }
       return null;
    }

    @RequestMapping(value="/queryQualityCheck/{orderNumber}", method=RequestMethod.GET)
    @ResponseBody
    public String queryQualityCheck(@PathVariable("orderNumber") String orderNumber){
        return orderService.queryOrderQualityCheckByOrderNumber(orderNumber);
    }

}
