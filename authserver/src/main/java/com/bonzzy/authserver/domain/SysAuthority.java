package com.bonzzy.authserver.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Created by lilongyun on 2018/4/30.
 */

@Data
@EqualsAndHashCode(callSuper = false)
public  class SysAuthority extends AbstractAuditingEntity {
    private Long id;
    private String name;
    private String value;
}
