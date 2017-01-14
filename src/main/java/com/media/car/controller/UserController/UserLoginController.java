package com.media.car.controller.UserController;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.media.car.controller.dto.BaseResult;
import com.media.car.controller.dto.BootStrapTableResult;
import com.media.car.entity.System.CarSysUser;
import com.media.car.entity.user.CarAdmin;
import com.media.car.service.service.System.ISysUserService;
import com.media.car.service.service.User.ICarAdminService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/22.
 */
@Controller
@RequestMapping("login")
public class UserLoginController {
    @Autowired
    private ICarAdminService carAdminService;
    @Autowired
    private ISysUserService sysUserService;

    /**
     * 登入主页入口
     * @return
     */
    @RequestMapping(value = "/carAdminMassage")
    public String goToCarAdminMassage(){
        return "userPage/index";
    }

    /**
     * 登入主页2入口
     * @return
     */
    @RequestMapping(value = "/carAdmin2Massage")
    public String goToCarAdmin2Massage(){
        return "userPage/index2";
    }

    /**
     * 登录校对以及查询controller信息，可以通过登录名查询到该用户相关信息
     * @param userAccount
     * @param userPassword
     * @return
     */
//    @RequestMapping("loginMethod")
//    @ResponseBody
//    public String getAdmin(HttpServletRequest req, HttpServletResponse response,@RequestParam String userAccount, @RequestParam String userPassword,
//                           Model model)throws ServletException, IOException {
//        String result = "";
//        BaseResult baseResult = null;
//        String a = null;
////        RequestDispathcher rd = null;
//        try{
//            List<CarSysUser> list = sysUserService.login(userAccount,userPassword);
//            if(list != null){
//                baseResult = new BaseResult(true, "");
//                baseResult.setData(list);
//                result = JSON.toJSONString(baseResult);
//                List<Object> objects = new ArrayList<Object>();
//                for (CarSysUser bsi : list) {
//                    String baiVal = JSON.toJSONString(bsi);
//                    objects.add(baiVal);
//                }
//                JSONArray jsonArray = new JSONArray(objects);
//                if(jsonArray.size()>0) {
//                    for (int i = 0; i < jsonArray.size(); i++) {
//                        String avVal = (String) jsonArray.get(i);
//                        JSONObject jo = JSON.parseObject(avVal);//将字符串转化为json对象
//                        String free = (String) jo.get("free");//获取相应属性的值
//                        if(free.equals(1)){
//                            req.getSession().setAttribute("userPage", list);
////                            a = "userPage/index";
//                            req.getRequestDispatcher("userPage/index").forward(req,response);
//                        }
//                        else {
//                            req.getRequestDispatcher("login").forward(req,response);
//                        }
//
//                    }
//                }
//            }else {
//                System.out.print("密码错误");
//                req.getRequestDispatcher("login").forward(req,response);
//                baseResult = new BaseResult(true, "没有查询到账号信息！");
//                req.getRequestDispatcher("login").forward(req,response);
//            }

//            List<CarAdmin> list = carAdminService.getCarAdminByAccount(adminAccount);
//            if(list != null && list.size() > 0){
////                baseResult = new BaseResult(true, "");
//                baseResult.setData(list);
//                result = JSON.toJSONString(baseResult);
//            }else {
//                baseResult = new BaseResult(true, "没有查询到账号信息！");
//            }
//            result = JSON.toJSONString(baseResult);
//        }catch (Exception e){
//
//        }
//        return result;
//    }

    @RequestMapping(value = "/loginUser",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String loginUser( @RequestParam(required = false) String userAccount, @RequestParam(required = false) String userPassword) {
        String result = "";
        BaseResult baseResult = null;
        try {
                List<CarSysUser> list = sysUserService.login(userAccount,userPassword);
                if (list != null && list.size() > 0) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(list);
                }else {
                    baseResult = new BaseResult(true, "账号或密码错误");
                }
            result = JSON.toJSONString(baseResult);
        } catch (Exception e) {
            baseResult = new BaseResult(false, "查询到的数据信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }


}
