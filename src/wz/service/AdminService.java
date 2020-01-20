package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.AdminMapper;
import wz.pojo.Admin;

import javax.annotation.Resource;

@Service
public class AdminService {

    @Resource
    private AdminMapper adminMapper;

    public Admin login(Admin admin) {
        return adminMapper.selById(admin);
    }

}
