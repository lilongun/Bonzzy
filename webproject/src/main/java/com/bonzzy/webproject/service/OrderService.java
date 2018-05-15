package com.bonzzy.webproject.service;

import com.bonzzy.webproject.domain.OrderInfo;

import java.util.List;

/**
 * Created by lilongyun on 2018/5/15.
 */
public interface OrderService {
    public List<OrderInfo> queryOrderInfomationByOrderNumber(String orderNumber);

    public String queryOrderQualityCheckByOrderNumber(String orderNumber);
}
