package wz.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import wz.mapper.SingersMapper;
import wz.pojo.PageInfo;
import wz.pojo.Singers;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SingersService {

    @Resource
    private SingersMapper singersMapper;

    public PageInfo showPage(int pageSize, int pageNumber) {
        PageInfo pi = new PageInfo();
        int total = singersMapper.selCount();
        List<Singers> list = singersMapper.selByPage(pageSize * (pageNumber - 1), pageSize);
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setList(list);
        pi.setTotal(total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
        System.out.println(pi);
        return pi;
    }

    public int delSinger(int id) {
        return singersMapper.delById(id);
    }

    public int insSinger(String name, String introduce, String fileName) {
        return singersMapper.insSinger(name, introduce, fileName);
    }

    public int updSinger(int id, String name, String introduce, String photo) {
        return singersMapper.updSinger(name, introduce, photo, id);
    }
}
