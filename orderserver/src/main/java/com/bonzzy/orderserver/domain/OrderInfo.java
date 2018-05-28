package com.bonzzy.orderserver.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

/**
 * Created by lilongyun on 2018/4/30.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class OrderInfo{
    private Integer id;

    private String orderNumber;

    private String product;

    private String productModel;

    private Integer quantity;

    private String status;

    private String qualityCheck;

    private String shipping;

    private Date createdDate;

    private String createdBy;

    private Date lastModifiedDate;

    private String lastModifiedBy;

    private Boolean isDeleted;

    private int beginPos = 0;

    private int pageSize = 10;
}
