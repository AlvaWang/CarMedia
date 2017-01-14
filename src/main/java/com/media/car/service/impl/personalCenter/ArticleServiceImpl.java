package com.media.car.service.impl.personalCenter;

import com.media.car.dao.personalCenter.carArticleDao;
import com.media.car.entity.personalCenter.CarArticle;
import com.media.car.service.service.personalCenter.ICarArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/1/11.
 */
@Service("carArticleService")
public class ArticleServiceImpl implements ICarArticleService {
    @Autowired
    private carArticleDao carArticleDao;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public int getArticleConditionCount(String articleTitle, String articleCreateType, String articleType, Long userId,Integer offset, Integer limit){
        int count  = carArticleDao.getCarArticleCount(articleTitle, articleCreateType, articleType,userId,offset, limit);
        return  count;
    }

    public List<CarArticle> getArticleCondition(String articleTitle, String articleCreateType, String articleType,Long userId, Integer offset, Integer limit){
        List<CarArticle> list = carArticleDao.getCarArticle(articleTitle, articleCreateType, articleType,userId,offset, limit);
        return  list;
    }

    public List<CarArticle> getArticleConditionById(Long id){
        List<CarArticle> list= carArticleDao.getCarArticleById(id);
        return list;
    }

    public int updateCarArticleConditionById(Long id, String articleTitle, String articleCreateType, String articleType,
                                             String articleContent, String articleEnclosure){
        CarArticle carArticle =new CarArticle();
        carArticle.setId(id);
        carArticle.setUpdateTime(timeF.format(new Date()));
        carArticle.setSendTime(timeF.format(new Date()));
        carArticle.setUpdateUser(Long.valueOf(1));
        carArticle.setArticleTitle(articleTitle);
        carArticle.setArticleCreateType(articleCreateType);
        carArticle.setArticleType(articleType);
        carArticle.setArticleContent(articleContent);
        carArticle.setArticleEnclosure(articleEnclosure);
        int update = carArticleDao.updateCarArticle(carArticle);
        if(update>0){
            return update;
        }
        return 0;
    }

    public String addCarArticle(String articleTitle, String articleCreateType,
                                String articleType, String articleContent, String articleEnclosure, Long userId){
        CarArticle carArticle = new CarArticle();
        carArticle.setCreateUser(Long.valueOf(1));
        carArticle.setStatus("1");
        carArticle.setCreateTime(timeF.format(new Date()));
        carArticle.setSendTime(timeF.format(new Date()));
        carArticle.setUserId(userId);
        carArticle.setArticleTitle(articleTitle);
        carArticle.setArticleCreateType(articleCreateType);
        carArticle.setArticleType(articleType);
        carArticle.setArticleContent(articleContent);
        carArticle.setArticleEnclosure(articleEnclosure);
        carArticle.setSendStatus("article_send_1");//设置文章发表状态未默认已发表
        int cd = carArticleDao.insertCarArticle(carArticle);
        System.out.println(cd);
        if(cd>0){
            return String.valueOf(carArticle.getId());
        }
        return "";
    }

    public  int deleteArticleConditionById(Long id){
        int del = carArticleDao.deleteCarArticle(id);
        return del;
    }

    public int getArticleClickCount(Long articleId){
        int clickCount = carArticleDao.getCarArticleClickCount(articleId);
        return clickCount;
    }

    public int getArticleDiscussCount(Long articleId){
        int discussCount = carArticleDao.getCarArticleDiscussCount(articleId);
        return discussCount;
    }

    public String addCarArticleClick(Long articleId, Long userId, String clickTime){
        CarArticle carArticle = new CarArticle();
        carArticle.setCreateUser(Long.valueOf(1));
        carArticle.setStatus("1");
        carArticle.setCreateTime(timeF.format(new Date()));
        carArticle.setUserId(userId);
        carArticle.setArticleId(articleId);
        carArticle.setClickTime(clickTime);
        int cd = carArticleDao.insertCarArticleClick(carArticle);
        System.out.println(cd);
        if(cd>0){
            return String.valueOf(carArticle.getId());
        }
        return "";
    }

}

