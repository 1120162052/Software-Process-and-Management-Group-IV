package team.abc.ssm.modules.notice.dao;

import team.abc.ssm.modules.notice.entity.NoticeReceive;

import java.util.List;

public interface NoticeReceiveDao {

    int insertList(List<NoticeReceive> list);
}
