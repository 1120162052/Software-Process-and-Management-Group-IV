package team.abc.ssm.modules.notice.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.abc.ssm.common.web.BaseApi;
import team.abc.ssm.modules.notice.service.NoticeReceiveService;

@Controller
@RequestMapping("api/notice/noticeReceive")
public class NoticeReceiveApi extends BaseApi {

    @Autowired
    private NoticeReceiveService noticeReceiveService;
}
