package com.bonzzy.orderserver.service;

import com.bonzzy.orderserver.domain.OrderInfo;

import java.util.List;
import java.util.Map;

/**
 * Created by lilongyun on 2018/5/15.
 */
public interface OrderService {
    public List<OrderInfo> queryOrderInfomationByOrderNumber(String orderNumber);

    public String queryOrderQualityCheckByOrderNumber(String orderNumber);

    public Map<String, Object> queryOrderInfomations(OrderInfo orderInfo);

    public int saveOrderInformation(OrderInfo orderInfo);

    public int updateOrderInformation(OrderInfo orderInfo);
}
