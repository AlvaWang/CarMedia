package com.media.car.dao.user;

import com.media.car.entity.user.CarAdmin;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/8.
 */
public interface carAdminDao {

    /**
     * 获取用户信息
     * @param param
     * @return
     */
    List<CarAdmin> getCarAdminCondition(Map<String, Object> param);

    /**
     * 通过账户名获取账户信息
     * @param adminAccount
     * @return
     */
    List<CarAdmin> getCarAdminByAccount(String adminAccount);
}
