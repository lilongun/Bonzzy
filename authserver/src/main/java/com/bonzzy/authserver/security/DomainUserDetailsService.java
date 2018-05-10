package com.bonzzy.authserver.security;

import com.bonzzy.authserver.dao.SysUserDao;
import com.bonzzy.authserver.domain.SysUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.Set;

/**
 * Created by lilongyun on 2018/5/10.
 */
@Service("userDetailsService")
@Slf4j
public class DomainUserDetailsService implements UserDetailsService {
    @Autowired
    private SysUserDao sysUserDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        String lowcaseUsername = username.toLowerCase();
        SysUser sysUser = sysUserDao.findOneWithRolesByUsername(lowcaseUsername);
        Optional<SysUser> realUser = Optional.of(sysUser);
        return realUser.map(user -> {
            Set<GrantedAuthority> grantedAuthorities = user.getAuthorities();
            return new User(user.getUsername(),user.getPassword(),grantedAuthorities);
        }).orElseThrow(() -> new UsernameNotFoundException("用户" + lowcaseUsername + "不存在!"));

    }
}
