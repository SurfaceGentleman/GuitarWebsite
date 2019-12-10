package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.SongsMapper;
import wz.pojo.PageInfo;
import wz.pojo.Songs;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SongsService {
    @Resource
    private SongsMapper songsMapper;

    List<Songs> selByName(String name) {
        return songsMapper.selByName(name);
    }

    List<Songs> selHot() {
        return songsMapper.selHot();
    }

    List<Songs> selById(int id) {
        return songsMapper.selBySid(id);
    }

    public PageInfo showPage(int pageSize, int pageNumber) {
        PageInfo pi = new PageInfo();
        int total = songsMapper.selCount();
        List<Songs> list = songsMapper.selByPage(pageSize * (pageNumber - 1), pageSize);
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setList(list);
        pi.setTotal(total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
        System.out.println(pi);
        return pi;

    }

    public int delSong(int id) {
        return songsMapper.delById(id);
    }
}
