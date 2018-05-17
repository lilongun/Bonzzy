package com.bonzzy.orderserver.service.impl;

import com.bonzzy.orderserver.dao.OrderDao;
import com.bonzzy.orderserver.domain.OrderInfo;
import com.bonzzy.orderserver.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Override
    public List<OrderInfo> queryOrderInfomations(OrderInfo orderInfo) {
        return orderDao.queryOrderInfomations(orderInfo);
    }

    @Override
    @Transactional
    public int saveOrderInformation(OrderInfo orderInfo) {
        return orderDao.saveOrderInformation(orderInfo);
    }

    @Override
    @Transactional
    public int updateOrderInformation(OrderInfo orderInfo) {
        return orderDao.updateOrderInformation(orderInfo);
    }
}
