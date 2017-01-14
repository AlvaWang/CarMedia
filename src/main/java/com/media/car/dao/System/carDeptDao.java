package com.media.car.dao.System;

import com.media.car.entity.System.CarDept;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface carDeptDao {
    /**
     * 获取部门列表
     */
    List<CarDept> getCarDept(@Param("deptName") String deptName,
                             @Param("deptId") Long deptId,
                             @Param("offset") Integer offset,
                             @Param("limit") Integer limit);

    /**
     * id
     */
    List<CarDept> getCarDeptById(@Param("id") Long id);

    /**
     * 总数
     * @param deptName
     * @param deptId
     * @param limit
     * @return
     */
    int getCarDeptCount(@Param("deptName") String deptName,
                        @Param("deptId") Long deptId,
                        @Param("offset") Integer offset,
                        @Param("limit") Integer limit);

    int updateCarDept(CarDept carDept);

    int insertCarDept(CarDept carDept);

    int deleteCarDept(@Param("id") Long id);
}
