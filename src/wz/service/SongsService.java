package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.SongsMapper;
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

}
