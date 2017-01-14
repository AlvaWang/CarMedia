package com.media.car.entity.System;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/12/29.
 */
public class CarSysUser implements Serializable{
    private Long id;
    private String userAccount;
    private String userName;
    private String userPassword;
    private Long deptId;
    private  String userRealName;
    private String userPhone;
    private String userEmail;
    private String userAddress;
    private String userQq;
    private String userGender;
    private String remark;
    private String createTime;
    private String updateTime;
    private Long createUser;
    private Long updateUser;
    private String status;
    private String free;
    private String isSys;

    public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id = id;
    }

    public String getUserAccount(){return userAccount;}
    public void setUserAccount(String userAccount){this.userAccount = userAccount;}

    public String getUserPassword(){
        return  userPassword;
    }
    public void setUserPassword(String userPassword){
        this.userPassword = userPassword;
    }

    public String getUserName(){
        return  userName;
    }
    public void setUserName(String userName){
        this.userName = userName;
    }

    public String getUserRealName(){
        return  userRealName;
    }
    public void setUserRealName(String userRealName){
        this.userRealName = userRealName;
    }

    public String getUserPhone(){
        return  userPhone;
    }
    public void setUserPhone(String userPhone){
        this.userPhone = userPhone;
    }

    public String getUserEmail(){
        return  userEmail;
    }
    public void setUserEmail(String userEmail){
        this.userEmail = userEmail;
    }

    public String getUserAddress(){
        return  userAddress;
    }
    public void setUserAddress(String userAddress){
        this.userAddress = userAddress;
    }

    public String getUserQq(){
        return  userQq;
    }
    public void setUserQq(String userQq){
        this.userQq = userQq;
    }

    public String getUserGender(){
        return  userGender;
    }
    public void setUserGender(String userGender){
        this.userGender = userGender;
    }

    public Long getDeptId(){
        return deptId;
    }
    public void setDeptId(Long deptId){
        this.deptId = deptId;
    }

    public String getRemark(){return remark;}
    public void setRemark(String remark){this.remark = remark;}

    public String getCreateTime(){return createTime;}
    public void setCreateTime(String createTime){this.createTime = createTime;}

    public String getUpdateTime(){return updateTime;}
    public void setUpdateTime(String updateTime){this.updateTime = updateTime;}

    public Long getCreateUser(){return createUser;}
    public void setCreateUser(Long createUser){this.createUser = createUser;}

    public Long getUpdateUser(){return updateUser;}
    public void setUpdateUser(Long updateUser){this.updateUser = updateUser;}

    public String getStatus(){return status;}
    public void setStatus(String status){this.status = status;}

    public String getFree(){return free;}
    public void setFree(String free){this.free = free;}

    public String getIsSys(){return isSys;}
    public void setIsSys(String isSys){this.isSys = isSys;}
}
