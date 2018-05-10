package com.bonzzy.authserver.dao;

import com.bonzzy.authserver.domain.SysUser;
import org.apache.ibatis.annotations.Mapper;

/**
 * Created by lilongyun on 2018/4/30.
 */
@Mapper
public interface SysUserDao{
    SysUser findOneWithRolesByUsername(String username);
}
