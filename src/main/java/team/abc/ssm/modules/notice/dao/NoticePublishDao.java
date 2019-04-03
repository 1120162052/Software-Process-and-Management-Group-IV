package team.abc.ssm.modules.notice.dao;

import team.abc.ssm.modules.notice.entity.NoticePublish;

import java.util.List;

public interface NoticePublishDao {

    List<NoticePublish> selectListByPage(NoticePublish noticePublish);

    int selectSearchCount(NoticePublish noticePublish);

    int deleteListByIds(List<NoticePublish> list);

    int insertOrUpdate(NoticePublish noticePublish);
}
