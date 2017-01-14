package com.media.car.service.service.System;

import com.media.car.entity.System.CarDept;

import java.util.List;

/**
 * Created by Administrator on 2016/12/30.
 */
public interface IDeptService {
    /**
     * 获取部门列表
     * @param deptName
     * @param deptId
     * @param limit
     * @return
     */
    List<CarDept> getDeptCondition(String deptName,Long deptId,Integer offset,Integer limit);

    /**
     * @param id
     * @return
     */
    List<CarDept> getDeptConditionById(Long id);

    int getDeptConditionCount(String deptName,Long deptId,Integer offset,Integer limit);

    int updateDeptConditionById(Long id,String deptName,String deptDesc,Long deptId);

    String addCarDept(String deptName,String deptDesc,Long deptId);

    int deleteDeptConditionById(Long id);
}
