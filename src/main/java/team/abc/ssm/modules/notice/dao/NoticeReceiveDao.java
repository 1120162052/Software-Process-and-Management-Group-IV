package team.abc.ssm.modules.notice.dao;

import team.abc.ssm.modules.notice.entity.NoticeReceive;

import java.util.List;

public interface NoticeReceiveDao {

    int insertList(List<NoticeReceive> list);

    // order by publishDate
    List<NoticeReceive> selectListByPage(NoticeReceive noticeReceive);

    int selectSearchCount(NoticeReceive noticeReceive);

    // update status = "1" (has been read) where id in ...
    int updateStatusTo1(List<NoticeReceive> noticeReceiveList);
}
