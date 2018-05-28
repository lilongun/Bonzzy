package com.bonzzy.orderserver.controller;

import com.bonzzy.orderserver.domain.OrderInfo;
import com.bonzzy.orderserver.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

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

    @RequestMapping(value="/queryList", method=RequestMethod.GET)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public Map<String, Object> queryList(@RequestParam(required = false) String orderNumber,
                                         @RequestParam(required = false) Integer id,
                                         @RequestParam(required = false) Integer pageNum){
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setOrderNumber(orderNumber);
        orderInfo.setId(id);
        int pageSize = 10;
        if(pageNum == null){
            pageNum = 1;
        }
        orderInfo.setBeginPos((pageNum - 1) * pageSize);
        orderInfo.setPageSize(pageSize);
        return orderService.queryOrderInfomations(orderInfo);
    }

    @RequestMapping(value="/saveOrder", method=RequestMethod.PUT)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public String saveOrder(@RequestBody OrderInfo orderInfo){
        System.out.println(orderInfo.getProductArray());
        //int result = orderService.saveOrderInformation(orderInfo);
        //if(result == 1) {
            return "success";
        //}
        //return "fail";
    }

    @RequestMapping(value="/updateOrder", method=RequestMethod.POST)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public String updateOrder(@RequestBody OrderInfo orderInfo){
        int result = orderService.updateOrderInformation(orderInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

    @RequestMapping(value="/deleteOrder/{id}", method=RequestMethod.DELETE)
    @ResponseBody
    @PreAuthorize("hasAuthority('admin')")
    public String deleteOrder(@PathVariable("id") Integer id){
        OrderInfo orderInfo = new OrderInfo();
        orderInfo.setId(id);
        orderInfo.setIsDeleted(true);
        int result = orderService.updateOrderInformation(orderInfo);
        if(result == 1) {
            return "success";
        }
        return "fail";
    }

}
