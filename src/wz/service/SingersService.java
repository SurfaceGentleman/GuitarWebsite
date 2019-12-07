package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.SingersMapper;
import wz.pojo.Singers;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SingersService {

    @Resource
    private SingersMapper singersMapper;

}
