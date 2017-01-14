package com.media.car.controller.systemController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/12/23.
 */
@Controller
@RequestMapping("system")
public class systemController {
    /**
     * 进入文章管理页面
     * @return
     */
    @RequestMapping("/articleManage")
    public String goToArticleManage(){
        return "systemManage/articleManagement";
    }

    /**
     * 竞猜管理页面
     * @return
     */
    @RequestMapping("/guessCompetitionManage")
    public String goToGuessCompetitionManage(){
        return "systemManage/guessCompetitionManagement";
    }

    /**
     * 通知管理页面
     * @return
     */
    @RequestMapping("/notificationManage")
    public String goToNotificationManage(){
        return "systemManage/notificationManagement";
    }

    /**
     * 组织管理
     * @return
     */
    @RequestMapping("/orgManage")
    public String goToOrgManage(){
        return "systemManage/orgManagement";
    }

    /**
     * 用户管理
     * @return
     */
    @RequestMapping("/userManage")
    public String goToUserManage(){
        return "systemManage/userManagement";
    }
}
