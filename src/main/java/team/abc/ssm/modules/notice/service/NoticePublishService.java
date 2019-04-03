package team.abc.ssm.modules.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.notice.dao.NoticePublishDao;
import team.abc.ssm.modules.notice.entity.NoticePublish;

import java.util.List;

@Service
public class NoticePublishService {

    @Autowired
    private NoticePublishDao noticePublishDao;

    public List<NoticePublish> selectListByPage(NoticePublish noticePublish) {
        return noticePublishDao.selectListByPage(noticePublish);
    }

    public int selectSearchCount(NoticePublish noticePublish) {
        return noticePublishDao.selectSearchCount(noticePublish);
    }

    public boolean deleteListByIds(List<NoticePublish> list) {
        if (list.size() == 0) return true;
        int count = noticePublishDao.deleteListByIds(list);
        return count == list.size();
    }

    public boolean insertOrUpdate(NoticePublish noticePublish) {
        return noticePublishDao.insertOrUpdate(noticePublish) == 1;
    }
}
