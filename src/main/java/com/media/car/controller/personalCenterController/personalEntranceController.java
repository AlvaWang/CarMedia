package com.media.car.controller.personalCenterController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/12/23.
 */
@Controller
@RequestMapping("personalCenter")
public class personalEntranceController {

    /**
     * 个人竞猜页面
     * @return
     */
    @RequestMapping("/guessingCompetition")
    public String goToGuessingCompetition(){
        return "personalCenter/guessingCompetition";
    }

    /**
     * 我的文章管理页面
     */
    @RequestMapping("/myArticleManage")
    public String goToMyArticleManage(){
        return "personalCenter/myArticle";
    }

    /**
     * 个人资料页面
     */
    @RequestMapping("/personalProfileManage")
    public String goToPersonalProfileManage(){
        return "personalCenter/personalProfile";
    }

    /**
     * 个人资料页面
     */
    @RequestMapping("/readArticle")
    public String goToReadArticleManage(){
        return "personalCenter/articleLooking";
    }

    /**
     * 邮箱
     */
    @RequestMapping("/mailbox/composeManage")
    public String goToCompose(){
        return "mailbox/compose";
    }
    @RequestMapping("/mailbox/mailboxManage")
    public String goToMailbox(){
        return "mailbox/mailbox";
    }
    @RequestMapping("/mailbox/readManage")
    public String goToReadMail(){
        return "mailbox/read-mail";
    }
    @RequestMapping("/mailbox/noticeManage")
    public String goToNotice(){
        return "mailbox/noticeManage";
    }

    /**
     * 数据中心
     */
    @RequestMapping("/data/userCharts")
    public String goToUserCharts(){
        return "charts/userCharts";
    }
}
