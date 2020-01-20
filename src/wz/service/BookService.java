package wz.service;

import org.springframework.stereotype.Service;
import wz.mapper.BookMapper;
import wz.pojo.Bookmark;
import wz.pojo.PageInfo;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class BookService {

    @Resource
    private BookMapper bookMapper;

    public PageInfo selByUid(int uid, int pageSize, int pageNumber) {
        PageInfo pi = new PageInfo();
        int total = bookMapper.selCountByUid(uid);
        List<Bookmark> list = bookMapper.selBookmarkByUserIdPage(uid, pageSize * (pageNumber - 1), pageSize);
        pi.setPageNumber(pageNumber);
        pi.setPageSize(pageSize);
        pi.setList(list);
        pi.setTotal(total % pageSize == 0 ? total / pageSize : total / pageSize + 1);
        return pi;
    }

    public int delBookMark(int id) {
        return bookMapper.delBookmark(id);
    }

    public int selByUnameAndSid(int uid, int sid) {
        return bookMapper.selByUidAndSid(uid, sid);
    }

    public int insBookmark(int sid, Date date, int uid) {
        return bookMapper.insBookmark(sid, date, uid);
    }

}
