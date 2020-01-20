package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.UsersMapper;
import wz.pojo.Users;

import javax.annotation.Resource;

@Service
public class UsersService {
    @Resource
    private UsersMapper usersMapper;

    public int insUsers(String name, String password, String ip) {
        return usersMapper.insUser(name, password, ip);
    }

    public Users UserLogin(String name, String password) {
        return usersMapper.selUsers(name, password);
    }

    public Users selByName(String name) {
        return usersMapper.selByName(name);
    }

    public int updUser(int id, String name, String password_new, String photo, String about) {
        return usersMapper.updUser(id, name, password_new, photo, about);
    }

}
