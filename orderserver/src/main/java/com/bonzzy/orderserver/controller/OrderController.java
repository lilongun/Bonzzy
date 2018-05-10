package com.bonzzy.orderserver.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
public class OrderController {
    @RequestMapping(value="/hello", method= RequestMethod.GET)
    @PreAuthorize("hasAuthority('query-order')")
    public String hello(){
        return "hello!";
    }
}
