package com.bonzzy.authserver.controller;

import com.bonzzy.authserver.domain.SysUser;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * Created by lilongyun on 2018/5/10.
 */
@RestController
public class UserController {
    @GetMapping("/user")
    public Principal user(Principal user){
        return user;
    }

    @GetMapping("/getBCryptPassword")
    public String getBCryptPassword(@RequestParam String password) {
        String hashed = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println(hashed);
        String hashed2 = BCrypt.hashpw(password, BCrypt.gensalt(12));
        String candidate = password;
        if (BCrypt.checkpw(candidate, hashed)) {
            System.out.println("It matches");
            return hashed;
        }else {
            System.out.println("It does not match");
        }
        return "";
    }
}
