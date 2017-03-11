package com.media.car.controller.systemController;

import com.alibaba.fastjson.JSON;
import com.media.car.controller.dto.BaseResult;
import com.media.car.controller.dto.BootStrapTableResult;
import com.media.car.entity.System.CarDept;
import com.media.car.entity.System.CarSysUser;
import com.media.car.service.service.System.IDeptService;
import com.media.car.service.service.System.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import static jdk.nashorn.internal.codegen.Compiler.LOG;

/**
 * Created by Administrator on 2016/12/29.
 */
@Controller
@RequestMapping("sysUser")
public class UserController {
    @Autowired
    private ISysUserService sysUserService;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 获取用户列表
     * produces解决乱码问题
     */
    @RequestMapping(value = "/getSysUserList",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getSysUserList( @RequestParam(required = false) String userName,//账户名
                                                @RequestParam(required = false) String userAccount,//登录识别账号
                                                @RequestParam(required = false) Long deptId,//所属部门
                                                @RequestParam(required = false) String userRealName,//真实姓名
                                                @RequestParam(required = false) Integer offset,
                                                @RequestParam(required = false) Integer limit) {
        String result = "";
        BaseResult baseResult = null;
        try {
            int  sum= sysUserService.getCarSysUserConditionCount(userName,userAccount,deptId,userRealName, offset, limit);
            if (sum > 0) {
                List<CarSysUser> list = sysUserService.getCarSysUserCondition(userName,userAccount,deptId,userRealName, offset, limit);
                if (list != null && list.size() > 0) {
                    BootStrapTableResult tableResult = new BootStrapTableResult<CarSysUser>(list, sum);
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(tableResult);
                    result = JSON.toJSONString(baseResult);
                }
            } else {
                baseResult = new BaseResult(true, "没有查询到相关信息！");
                result = JSON.toJSONString(baseResult);
            }

        } catch (Exception e) {
            baseResult = new BaseResult(false, "查询到的数据信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 根据ID获取用户信息
     * @param id
     * @return
     */
    @RequestMapping(value = "getSysUserById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getSysUserById(@RequestParam Long id){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                List<CarSysUser> carSysUsers = sysUserService.getCarSysUserConditionById(id);
                if ( carSysUsers != null) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(carSysUsers);
                } else {
                    baseResult = new BaseResult(true, "根据ID没有查询到用户信息！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"根据ID查询用户信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 根据userAccount获取用户信息
     * @param userAccount
     * @return
     */
    @RequestMapping(value = "getSysUserByAccount",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getSysUserByAccount(@RequestParam String userAccount){

        LOG.info("invoke----------/org/getSysUserByAccount");
        LOG.info("传入参数:"+userAccount);
        String result="";
        BaseResult baseResult=null;
        try {
            if(userAccount!=null){
                List<CarSysUser> carSysUsers = sysUserService.getCarSysUserConditionByAccount(userAccount);
                if ( carSysUsers != null) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(carSysUsers);
                } else {
                    baseResult = new BaseResult(true, "根据ID没有查询到用户信息！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"根据ID查询用户信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }
    /**
     * 修改用户信息
     * @param id
     * @return
     */
    @RequestMapping(value = "updateSysUserById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String updateSysUserById(@RequestParam(required = false) Long id,
                                                  @RequestParam(required = false) String userPhone,
                                                  @RequestParam(required = false) String userEmail,
                                                  @RequestParam(required = false) String userQq,
                                                  @RequestParam(required = false) String userAddress,
                                                  @RequestParam(required = false) String free,
                                                  @RequestParam(required = false) String isSys,
                                                  @RequestParam(required = false) Long deptId){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int update = sysUserService.updateCarSysUserConditionById(id,userPhone,userEmail,userQq,userAddress,free,isSys,deptId);//根据ID查询预案培训
                if ( update>0) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(update);
                } else {
                    baseResult = new BaseResult(true, "id不存在！");
                }
                result = JSON.toJSONString(baseResult);
            }else{
                baseResult=new BaseResult(true,"没有传入Id");
                result = JSON.toJSONString(baseResult);
            }
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 增加系统用户
     * @param userAccount
     * @param userName
     * @param userRealName
     * @param userGender
     * @param userPhone
     * @param userEmail
     * @param userQq
     * @param userAddress
     * @param userPassword
     * @param deptId
     * @return
     */
    @RequestMapping(value = "/addSysUser",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String addSysUser(@RequestParam(required = false) String userAccount,
                                           @RequestParam(required = false) String userName,
                                           @RequestParam(required = false) String userRealName,
                                           @RequestParam(required = false) String userGender,
                                           @RequestParam(required = false) String userPhone,
                                           @RequestParam(required = false) String userEmail,
                                           @RequestParam(required = false) String userQq,
                                           @RequestParam(required = false) String userAddress,
                                           @RequestParam(required = false) String userPassword,
                                           @RequestParam(required = false) Long deptId){
        String result = null;
        BaseResult baseResult=null;
        try {
            String id = sysUserService.addCarSysUser(userAccount,userName,userRealName,userGender,userPhone,userEmail,userQq,userAddress,userPassword,deptId);
            if (id != null){
                baseResult = new BaseResult(true,"");
                baseResult.setData(id);
            }else {
                baseResult = new BaseResult(true,"插入数据失败！");
            }
            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
            baseResult = new BaseResult(false,"插入数据异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 删除用户信息
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteSysUserById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String deleteSysUserById(@RequestParam(required = false) Long id){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int rel = sysUserService.deleteCarSysUserConditionById(id);//根据ID查询预案培训
                if ( rel>0) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(rel);
                } else {
                    baseResult = new BaseResult(true, "id不存在！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 删除用户信息
     * @param id
     * @return
     */
    @RequestMapping(value = "freeSysUserById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String freeSysUserById(@RequestParam(required = false) Long id,
                                                @RequestParam(required = false) String free){

        LOG.info("invoke----------/sysUser/freeSysUserById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int rel = sysUserService.freeCarSysUserConditionById(id,free);//根据ID查询预案培训
                if ( rel>0) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(rel);
                } else {
                    baseResult = new BaseResult(true, "id不存在！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

}