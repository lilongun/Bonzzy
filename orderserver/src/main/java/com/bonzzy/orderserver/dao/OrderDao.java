package com.bonzzy.orderserver.dao;

import com.bonzzy.orderserver.domain.OrderInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * Created by lilongyun on 2018/5/15.
 */
@Mapper
public interface OrderDao {
    public List<OrderInfo> queryOrderInfomationByOrderNumber(String orderNumber);

    public String queryOrderQualityCheckByOrderNumber(String orderNumber);
}
