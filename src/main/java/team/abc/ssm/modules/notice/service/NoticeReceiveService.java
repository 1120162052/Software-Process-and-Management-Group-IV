package team.abc.ssm.modules.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.abc.ssm.modules.notice.dao.NoticeReceiveDao;

@Service
public class NoticeReceiveService {

    @Autowired
    private NoticeReceiveDao noticeReceiveDao;
}
