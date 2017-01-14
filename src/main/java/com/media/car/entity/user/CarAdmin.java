package com.media.car.entity.user;

import org.mybatis.spring.SqlSessionTemplate;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/12/18.
 */
public class CarAdmin implements Serializable{
    private Long id;
    private String adminName;
    private String adminLoginPassword;
    private String adminWrite;
    private String adminRealName;
    private String adminEmail;
    private String adminAddress;
    private String remark;
    private String createTime;
    private String updateTime;
    private String createUser;
    private String updateUser;
    private String status;
    private String free;
    private String adminAccount;

    public Long setId(){
        return id;
    }
    public void getId(long id){
        this.id = id;
    }

    public String setAdminLoginPassword(){return adminLoginPassword;}
    public void getAdminLoginPassword(String adminLoginPassword){this.adminLoginPassword = adminLoginPassword;}

    public String setAdminName(){return adminName;}
    public void getAdminName(String adminName){this.adminName = adminName;}

    public String setAdminWrite(){return adminWrite;}
    public void  getAdminWrite(String adminWrite){this.adminWrite = adminWrite;}

    public String setAdminRealName(){return adminRealName;}
    public void getAdminRealName(String adminRealName){this.adminRealName = adminRealName;}

    public String setAdminEmail(){return adminEmail;}
    public void getAdminEmail(String adminEmail){this.adminEmail = adminEmail;}

    public String setAdminAddress(){return adminAddress;}
    public void getAdminAddress(String adminAddress){this.adminAddress = adminAddress;}

    public String getRemark(){return remark;}
    public void setRemark(String remark){this.remark = remark;}

    public String getCreateTime(){return createTime;}
    public void setCreateTime(String createTime){this.createTime = createTime;}

    public String getUpdateTime(){return updateTime;}
    public void setUpdateTime(String updateTime){this.updateTime = updateTime;}

    public String getCreateUser(){return createUser;}
    public void setCreateUser(String createUser){this.createUser = createUser;}

    public String getUpdateUser(){return updateUser;}
    public void setUpdateUser(String updateUser){this.updateUser = updateUser;}

    public String getStatus(){return status;}
    public void setStatus(String status){this.status = status;}

    public String getFree(){return free;}
    public void setFree(String free){this.free = free;}

    public String getAdminAccount() {
        return adminAccount;
    }
    public void setAdminAccount(String adminAccount) {
        this.adminAccount = adminAccount;
    }


}
