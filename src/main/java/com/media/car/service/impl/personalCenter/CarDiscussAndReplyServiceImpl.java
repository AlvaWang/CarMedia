package com.media.car.service.impl.personalCenter;

import com.media.car.dao.personalCenter.carDiscussAndReplyDao;
import com.media.car.entity.personalCenter.CarDiscussAndReply;
import com.media.car.service.service.personalCenter.ICarDiscussAndReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/1/11.
 */
@Service("carDiscussAndReplyService")
public class CarDiscussAndReplyServiceImpl implements ICarDiscussAndReplyService {
    @Autowired
    private carDiscussAndReplyDao carDiscussAndReplyDao;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public List<CarDiscussAndReply> getDiscussConditionById(Long articleId){
        List<CarDiscussAndReply> list= carDiscussAndReplyDao.getCarDiscussById(articleId);
        return list;
    }

    public List<CarDiscussAndReply> getReplyConditionById(Long discussId){
        List<CarDiscussAndReply> list= carDiscussAndReplyDao.getCarReplyById(discussId);
        return list;
    }

    public String addCarDiscuss(Long articleId, Long userId, String discussContent, String discussThumbsNumber){
        CarDiscussAndReply carDiscussAndReplys = new CarDiscussAndReply();
        carDiscussAndReplys.setCreateUser(Long.valueOf(1));
        carDiscussAndReplys.setStatus("1");
        carDiscussAndReplys.setCreateTime(timeF.format(new Date()));
        carDiscussAndReplys.setUserId(userId);
        carDiscussAndReplys.setArticleId(articleId);
        carDiscussAndReplys.setDiscussContent(discussContent);
        carDiscussAndReplys.setDiscussThumbsNumber(discussThumbsNumber);
        int cd = carDiscussAndReplyDao.insertCarDiscuss(carDiscussAndReplys);
        System.out.println(cd);
        if(cd>0){
            return String.valueOf(carDiscussAndReplys.getId());
        }
        return "";
    }

    public  int deleteDiscussConditionById(Long id){
        int del = carDiscussAndReplyDao.deleteCarDiscuss(id);
        return del;
    }

    public  int deleteReplyConditionById(Long id){
        int del = carDiscussAndReplyDao.deleteCarReply(id);
        return del;
    }

    public String addCarReply(Long discussId, Long userId, Long replyUserId,String replyContent, String replyThumbsNumber){
        CarDiscussAndReply carDiscussAndReplys = new CarDiscussAndReply();
        carDiscussAndReplys.setCreateUser(Long.valueOf(1));
        carDiscussAndReplys.setStatus("1");
        carDiscussAndReplys.setCreateTime(timeF.format(new Date()));
        carDiscussAndReplys.setUserId(userId);
        carDiscussAndReplys.setReplyUserId(replyUserId);
        carDiscussAndReplys.setDiscussId(discussId);
        carDiscussAndReplys.setReplyContent(replyContent);
        carDiscussAndReplys.setReplyThumbsNumber(replyThumbsNumber);
        int cd = carDiscussAndReplyDao.insertCarReply(carDiscussAndReplys);
        System.out.println(cd);
        if(cd>0){
            return String.valueOf(carDiscussAndReplys.getId());
        }
        return "";
    }

}

