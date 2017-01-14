package com.media.car.dao.personalCenter;

import com.media.car.entity.personalCenter.CarDiscussAndReply;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface carDiscussAndReplyDao {

    /**
     * id
     */
    List<CarDiscussAndReply> getCarDiscussById(@Param("articleId") Long articleId);

    List<CarDiscussAndReply> getCarReplyById(@Param("discussId") Long discussId);

    int insertCarDiscuss(CarDiscussAndReply carDiscussAndReply);

    int insertCarReply(CarDiscussAndReply carDiscussAndReply);

    int deleteCarDiscuss(@Param("id") Long id);

    int deleteCarReply(@Param("id") Long id);

}
