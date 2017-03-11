package com.media.car.service.service.personalCenter;

import com.media.car.entity.personalCenter.CarArticle;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/1/11.
 */
public interface ICarArticleService {

    int getArticleConditionCount(String articleTitle, String articleCreateType, String articleType, Long userId,Integer offset, Integer limit);

    List<CarArticle> getArticleCondition(String articleTitle, String articleCreateType, String articleType, Long userId,Integer offset, Integer limit);

    List<CarArticle> getArticleConditionById(Long id);

    int updateCarArticleConditionById(Long id, String articleTitle, String articleCreateType, String articleType,
                                      String articleContent, String articleEnclosure);

    String addCarArticle(String articleTitle, String articleCreateType, String articleType, String articleContent, String articleEnclosure, Long userId);

    int deleteArticleConditionById(Long id);

    int getArticleClickCount(Long articleId);

    int getArticleDiscussCount(Long articleId);

    String addCarArticleClick(Long articleId, Long userId, String clickTime);

    List<CarArticle> getArticleClickOrder();
}
