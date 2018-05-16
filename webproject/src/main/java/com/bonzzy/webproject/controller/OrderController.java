package com.bonzzy.webproject.controller;

import com.bonzzy.webproject.domain.OrderInfo;
import com.bonzzy.webproject.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by lilongyun on 2018/5/10.
 */
@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;

    @RequestMapping("/toQuery/{orderNumber}")
    public void handleRequest(HttpServletRequest req, HttpServletResponse resp, @PathVariable("orderNumber") String orderNumber) throws Exception {
        List<OrderInfo> list = orderService.queryOrderInfomationByOrderNumber(orderNumber);
        if(list.size() > 0){
            req.setAttribute("orderNumber", list.get(0).getOrderNumber());
            req.setAttribute("productModel", list.get(0).getProductModel());
            req.setAttribute("quantity", list.get(0).getQuantity());
            req.setAttribute("status", list.get(0).getStatus());
            req.setAttribute("shipping", list.get(0).getShipping());
            req.getRequestDispatcher("order.jsp").forward(req,resp);
        }
    }
}
