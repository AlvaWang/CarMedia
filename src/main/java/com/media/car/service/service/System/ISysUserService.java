package com.media.car.service.service.System;

import com.media.car.entity.System.CarSysUser;

import java.util.List;

/**
 * Created by Administrator on 2016/12/30.
 */
public interface ISysUserService {
    /**
     * 获取部门列表
     * @param deptId
     * @param limit
     * @return
     */
    List<CarSysUser> getCarSysUserCondition(String userName,String userAccount,Long deptId,String userRealName,Integer offset,Integer limit);

    /**
     * @param id
     * @return
     */
    List<CarSysUser> getCarSysUserConditionById(Long id);

    int getCarSysUserConditionCount(String userName,String userAccount,Long deptId,String userRealName,Integer offset,Integer limit);

    int updateCarSysUserConditionById(Long id,String userPhone,String userEmail,
                                      String userQq,String userAddress,String free,String isSys,Long deptId);

    String addCarSysUser(String userAccount,String userName,String userRealName,String userGender,
                         String userPhone,String userEmail,String userQq,String userAddress,String userPassword,Long deptId);

    int deleteCarSysUserConditionById(Long id);

    int freeCarSysUserConditionById(Long id,String free);

    List<CarSysUser> login(String userAccount, String userPassword);
}
