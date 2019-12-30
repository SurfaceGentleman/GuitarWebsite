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


    public PageInfo showPageAdmin(int pageSize, int pageNumber) {
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

    public PageInfo showPageSearch(String name, int pageSize, int pageNumber) {
        PageInfo pi = new PageInfo();
        int total = songsMapper.selPageCount(name);
        List<Songs> list = songsMapper.selByPageSong(name, pageSize * (pageNumber - 1), pageSize);
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setList(list);
        pi.setTotal(total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
        System.out.println(pi);
        return pi;
    }

    //以下均为敏感操作，需要日志记录
    public int delSong(int id) {
        return songsMapper.delById(id);
    }


    public int insSong(String name, int sid) {
        return songsMapper.insSong(name, sid);
    }

    public int updGuitar(int number, String format, int id) {
        return songsMapper.updGuitar(number, format, id);
    }

    public int updSong(String name, int sid, int id) {
        return songsMapper.updSong(name, sid, id);
    }
}
