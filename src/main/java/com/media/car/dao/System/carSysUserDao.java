package com.media.car.dao.System;

import com.media.car.entity.System.CarSysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface carSysUserDao {
    /**
     *
     * @param userName
     * @param userAccount
     * @param deptId
     * @param userRealName
     * @param offset
     * @param limit
     * @return
     */
    List<CarSysUser> getCarSysUser(@Param("userName") String userName,
                                   @Param("userAccount")String userAccount,
                                   @Param("deptId")Long deptId,
                                   @Param("userRealName")String userRealName,
                                   @Param("offset")Integer offset,
                                   @Param("limit")Integer limit);

    /**
     * id
     */
    List<CarSysUser> getCarSysUserById(@Param("id") Long id);

    /**
     *
     * @param userName
     * @param userAccount
     * @param deptId
     * @param userRealName
     * @param offset
     * @param limit
     * @return
     */
    int getCarSysUserCount(@Param("userName") String userName,
                           @Param("userAccount")String userAccount,
                           @Param("deptId")Long deptId,
                           @Param("userRealName")String userRealName,
                           @Param("offset")Integer offset,
                           @Param("limit")Integer limit);

    int updateCarSysUser(CarSysUser carSysUser);

    int insertCarSysUser(CarSysUser carSysUser);

    int deleteCarSysUser(@Param("id") Long id);

    int freeCarSysUser(@Param("id") Long id,@Param("free") String free);

    List<CarSysUser> login(@Param("userAccount") String userAccount, @Param("userPassword") String userPassword);
}
