package com.bonzzy.webproject.service.impl;

import com.bonzzy.webproject.dao.OrderDao;
import com.bonzzy.webproject.domain.OrderInfo;
import com.bonzzy.webproject.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by lilongyun on 2018/5/15.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public List<OrderInfo> queryOrderInfomationByOrderNumber(String orderNumber) {
        return orderDao.queryOrderInfomationByOrderNumber(orderNumber);
    }

    @Override
    public String queryOrderQualityCheckByOrderNumber(String orderNumber) {
        return orderDao.queryOrderQualityCheckByOrderNumber(orderNumber);
    }
}
