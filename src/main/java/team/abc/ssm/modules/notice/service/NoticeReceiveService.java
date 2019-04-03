package team.abc.ssm.modules.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.notice.dao.NoticeReceiveDao;
import team.abc.ssm.modules.notice.entity.NoticePublish;
import team.abc.ssm.modules.notice.entity.NoticeReceive;
import team.abc.ssm.modules.sys.entity.User;

import java.util.ArrayList;
import java.util.List;

@Service
public class NoticeReceiveService {

    @Autowired
    private NoticeReceiveDao noticeReceiveDao;

    public boolean insertList(NoticePublish noticePublish) {
        List<NoticeReceive> noticeReceiveList = new ArrayList<>();
        for (User user : noticePublish.getUserList()) {
            NoticeReceive noticeReceive = new NoticeReceive();
            noticeReceive.preInsert();
            noticeReceive.setNoticeId(noticePublish.getId());
            noticeReceive.setStatus("0");
            noticeReceive.setReceiverId(user.getId());
            noticeReceiveList.add(noticeReceive);
        }
        if (noticeReceiveList.size() < 1) return true;
        noticeReceiveDao.insertList(noticeReceiveList);
        return true;
    }
}
