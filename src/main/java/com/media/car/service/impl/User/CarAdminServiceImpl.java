package com.media.car.service.impl.User;

import com.media.car.dao.user.carAdminDao;
import com.media.car.entity.user.CarAdmin;
import com.media.car.service.service.User.ICarAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/12/8.
 */
@Service("carAdminService")
public class CarAdminServiceImpl implements ICarAdminService {
    @Autowired
    private carAdminDao carAdminDao;

    /**
     * 查询用户信息
     * @param param
     * @return
     */
    public List<CarAdmin> getCarAdmin(Map<String, Object> param){
        List<CarAdmin> list = carAdminDao.getCarAdminCondition(param);
        return list;
    }

    /**
     * 通过账户名获取账户信息
     * @param adminAccount
     * @return
     */
    public List<CarAdmin> getCarAdminByAccount(String adminAccount){
        List<CarAdmin> list = carAdminDao.getCarAdminByAccount(adminAccount);
        return list;
    }
}
