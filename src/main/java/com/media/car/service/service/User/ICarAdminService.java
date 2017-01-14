package com.media.car.service.service.User;

import com.media.car.entity.user.CarAdmin;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/8.
 */
public interface ICarAdminService {
    /**
     * 查找所有用户
     * @param param
     */
    List<CarAdmin> getCarAdmin(Map<String, Object> param);
    List<CarAdmin> getCarAdminByAccount(String adminAccount);
}
