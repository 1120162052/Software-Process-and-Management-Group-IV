package team.abc.ssm.modules.notice.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.abc.ssm.common.persistence.Page;
import team.abc.ssm.common.utils.UserUtils;
import team.abc.ssm.common.web.BaseApi;
import team.abc.ssm.common.web.MsgType;
import team.abc.ssm.modules.notice.entity.NoticeReceive;
import team.abc.ssm.modules.notice.service.NoticeReceiveService;

import java.util.List;

@Controller
@RequestMapping("api/notice/noticeReceive")
public class NoticeReceiveApi extends BaseApi {

    @Autowired
    private NoticeReceiveService noticeReceiveService;

    @RequestMapping(value = "selectListByPage", method = RequestMethod.POST)
    @ResponseBody
    public Object selectListByPage(@RequestBody NoticeReceive noticeReceive) {
        Page<NoticeReceive> page = new Page<>();
        noticeReceive.setReceiverId(UserUtils.getCurrentUser().getId());
        page.setResultList(noticeReceiveService.selectListByPage(noticeReceive));
        page.setTotal(noticeReceiveService.selectSearchCount(noticeReceive));
        return retMsg.Set(MsgType.SUCCESS, page);
    }

    // set status = "1" (has been read)
    @RequestMapping(value = "deleteListByIds", method = RequestMethod.POST)
    @ResponseBody
    public Object deleteListByIds(@RequestBody List<NoticeReceive> list) {
        noticeReceiveService.updateStatusTo1(list);
        return retMsg.Set(MsgType.SUCCESS);
    }
}
