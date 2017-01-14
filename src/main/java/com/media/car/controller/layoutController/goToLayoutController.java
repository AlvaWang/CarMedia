package com.media.car.controller.layoutController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/12/26.
 */
@Controller
@RequestMapping("layout")
public class goToLayoutController {

    @RequestMapping("/boxedManage")
    public String goToBoxed(){
        return "layout/boxed";
    }

    @RequestMapping("/collapsedSidebarManage")
    public String goToCollapsedSidebar(){
        return "layout/collapsed-sidebar";
    }

    @RequestMapping("/fixedManage")
    public String goToFixed(){
        return "layout/fixed";
    }

    @RequestMapping("/topNavManage")
    public String goToTopNav(){
        return "layout/top-nav";
    }
}
