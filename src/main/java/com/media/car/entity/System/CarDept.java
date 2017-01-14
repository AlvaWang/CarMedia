package com.media.car.entity.System;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/12/29.
 */
public class CarDept implements Serializable{
    private Long id;
    private String deptName;
    private String deptDesc;
    private Long deptId;
    private String remark;
    private String createTime;
    private String updateTime;
    private Long createUser;
    private Long updateUser;
    private String status;

    public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id = id;
    }

    public String getDeptName(){return deptName;}
    public void setDeptName(String deptName){this.deptName = deptName;}

    public String getDeptDesc(){
        return  deptDesc;
    }
    public void setDeptDesc(String deptDesc){
        this.deptDesc = deptDesc;
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

//    public void setDeptId(Serializable serializable) {
//    }
}
