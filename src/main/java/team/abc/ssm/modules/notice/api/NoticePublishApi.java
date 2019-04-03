package team.abc.ssm.modules.notice.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.utils.UserUtils;
import team.abc.ssm.common.web.BaseApi;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.notice.entity.NoticePublish;
import team.abc.ssm.modules.notice.service.NoticePublishService;
import team.abc.ssm.modules.notice.service.NoticeReceiveService;

import java.util.List;

@Controller
@RequestMapping("api/notice/noticePublish")
public class NoticePublishApi extends BaseApi {

    @Autowired
    private NoticePublishService noticePublishService;

    @Autowired
    private NoticeReceiveService noticeReceiveService;

    @RequestMapping(value = "selectListByPage", method = RequestMethod.POST)
    @ResponseBody
    public Object selectListByPage(@RequestBody NoticePublish noticePublish) {
        noticePublish.setPublisherId(UserUtils.getCurrentUser().getId());
        Page<NoticePublish> page = new Page<>();
        page.setResultList(noticePublishService.selectListByPage(noticePublish));
        page.setTotal(noticePublishService.selectSearchCount(noticePublish));
        return retMsg.Set(MsgType.SUCCESS, page);
    }

    @RequestMapping(value = "deleteListByIds", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteListByIds(@RequestBody List<NoticePublish> list) {
        noticePublishService.deleteListByIds(list);
        return retMsg.Set(MsgType.SUCCESS);
    }

    @RequestMapping(value = "insertOrUpdate", method = RequestMethod.POST)
    @ResponseBody
    public Object insertOrUpdate(@RequestBody NoticePublish noticePublish) {
        noticePublishService.insertOrUpdate(noticePublish);
        noticeReceiveService.insertList(noticePublish);
        return retMsg.Set(MsgType.SUCCESS);
    }

}
