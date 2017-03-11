package com.media.car.service.impl.System;

import com.media.car.dao.System.carSysUserDao;
import com.media.car.entity.System.CarSysUser;
import com.media.car.service.service.System.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
@Service("sysUserService")
public class SysUserServiceImpl implements ISysUserService{
    @Autowired
    private carSysUserDao carSysUserDao;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public List<CarSysUser> getCarSysUserCondition(String userName,String userAccount,Long deptId,String userRealName,Integer offset,Integer limit){
        List<CarSysUser> list = carSysUserDao.getCarSysUser(userName,userAccount,deptId,userRealName, offset, limit);
        return list;
    }

    public List<CarSysUser> getCarSysUserConditionById(Long id){
        List<CarSysUser> list = carSysUserDao.getCarSysUserById(id);
        return list;
    }

    public int getCarSysUserConditionCount(String userName,String userAccount,Long deptId,String userRealName,Integer offset,Integer limit){
        int count = carSysUserDao.getCarSysUserCount(userName,userAccount,deptId,userRealName, offset, limit);
        return count;
    }

    public int updateCarSysUserConditionById(Long id,String userPhone,String userEmail,String userQq,
                                             String userAddress,String free,String isSys,Long deptId){
        CarSysUser carSysUser =new CarSysUser();
        carSysUser.setId(id);
        carSysUser.setUpdateTime(timeF.format(new Date()));
        carSysUser.setUpdateUser(Long.valueOf(1));
        carSysUser.setUserPhone(userPhone);
        carSysUser.setUserEmail(userEmail);
        carSysUser.setUserQq(userQq);
        carSysUser.setUserAddress(userAddress);
        carSysUser.setDeptId(deptId);
        int update = carSysUserDao.updateCarSysUser(carSysUser);
        if(update>0){
            return update;
        }
        return 0;
    }

    public int deleteCarSysUserConditionById(Long id){
        int rel = carSysUserDao.deleteCarSysUser(id);
        return rel;
    }

    public int freeCarSysUserConditionById(Long id,String free){
        int rel = carSysUserDao.freeCarSysUser(id,free);
        return rel;
    }

    public String addCarSysUser(String userAccount,String userName,String userRealName,String userGender,
                                String userPhone,String userEmail,String userQq,String userAddress,String userPassword,Long deptId){
        CarSysUser carSysUser = new CarSysUser();
        carSysUser.setCreateUser(Long.valueOf(1));
        carSysUser.setStatus("1");
        carSysUser.setCreateTime(timeF.format(new Date()));
        carSysUser.setDeptId(deptId);
        carSysUser.setUserAccount(userAccount);
        carSysUser.setUserName(userName);
        carSysUser.setUserRealName(userRealName);
        carSysUser.setUserGender(userGender);
        carSysUser.setUserPhone(userPhone);
        carSysUser.setUserEmail(userEmail);
        carSysUser.setUserQq(userQq);
        carSysUser.setUserAddress(userAddress);
        carSysUser.setUserPassword(userPassword);
        carSysUser.setFree("1");
        carSysUser.setIsSys("1");
        int cd = carSysUserDao.insertCarSysUser(carSysUser);
        System.out.println(cd);
        if(cd>0){
            return String.valueOf(carSysUser.getId());
        }
        return "";
    }

    public List<CarSysUser> login(String userAccount, String userPassword){
        List<CarSysUser> list = carSysUserDao.login(userAccount,userPassword);
        return list;
    }

    public  List<CarSysUser> getCarSysUserConditionByAccount(String userAccount){
        List<CarSysUser> list = carSysUserDao.getCarSysUserByAccount(userAccount);
        return list;
    }
}
