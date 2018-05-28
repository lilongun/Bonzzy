package com.bonzzy.orderserver.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.bonzzy.orderserver.dao.OrderDao;
import com.bonzzy.orderserver.domain.OrderInfo;
import com.bonzzy.orderserver.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Map<String, Object> queryOrderInfomations(OrderInfo orderInfo) {
        Integer count = orderDao.queryOrderCount(orderInfo);
        List<OrderInfo> list =  orderDao.queryOrderInfomations(orderInfo);
        for( OrderInfo order : list ){
            JSONArray array = JSONArray.parseArray(order.getProduct());
            order.setProduct(array.toJSONString());
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("totalPage", count%orderInfo.getPageSize()>0 ? count/orderInfo.getPageSize()+1 : count/orderInfo.getPageSize());
        map.put("list", list);
        return map;
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
