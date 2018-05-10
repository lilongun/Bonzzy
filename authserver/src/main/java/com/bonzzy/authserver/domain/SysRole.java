package com.bonzzy.authserver.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by lilongyun on 2017/4/30.
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class SysRole extends AbstractAuditingEntity{
    private static final long serialVersionUID = 1L;

    private Integer id;
    private String name;
    private String value;

    private Set<SysAuthority> authorities = new HashSet<>();
}
