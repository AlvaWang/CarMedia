package com.media.car.service.impl.System;

import com.media.car.dao.System.carDeptDao;
import com.media.car.entity.System.CarDept;
import com.media.car.service.service.System.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
@Service("deptService")
public class OrgServiceImpl implements IDeptService{
    @Autowired
    private carDeptDao carDeptDao;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public List<CarDept> getDeptCondition(String deptName,Long deptId,Integer offset,Integer limit){
        List<CarDept> list = carDeptDao.getCarDept(deptName,deptId,offset,limit);
        return list;
    }

    public List<CarDept> getDeptConditionById(Long id){
        List<CarDept> list = carDeptDao.getCarDeptById(id);
        return list;
    }

    public int getDeptConditionCount(String deptName,Long deptId,Integer offset,Integer limit){
        int count = carDeptDao.getCarDeptCount(deptName,deptId,offset,limit);
        return count;
    }

    public int updateDeptConditionById(Long id,String deptName,String deptDesc,Long deptId){
        CarDept carDept =new CarDept();
        carDept.setId(id);
        carDept.setUpdateTime(timeF.format(new Date()));
        carDept.setUpdateUser(Long.valueOf(1));
        carDept.setDeptDesc(deptDesc);
        carDept.setDeptName(deptName);
        carDept.setDeptId(deptId);
        int update = carDeptDao.updateCarDept(carDept);
        if(update>0){
            return update;
        }
        return 0;
    }

    public int deleteDeptConditionById(Long id){
        int rel = carDeptDao.deleteCarDept(id);
        return rel;
    }

    public String addCarDept(String deptName,String deptDesc,Long deptId){
        CarDept carDept = new CarDept();
        carDept.setCreateUser(Long.valueOf(1));
        carDept.setStatus("1");
        carDept.setCreateTime(timeF.format(new Date()));
        carDept.setDeptId(deptId);
        carDept.setDeptName(deptName);
        carDept.setDeptDesc(deptDesc);
        int cd = carDeptDao.insertCarDept(carDept);
        System.out.println(cd);
        if(cd>0){
            return String.valueOf(carDept.getId());
        }
        return "";
    }
}
