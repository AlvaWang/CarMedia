package com.media.car.dao.personalCenter;

import com.media.car.entity.personalCenter.CarArticle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/12/29.
 */
public interface carArticleDao {
    /**
     *
     * @param articleTitle
     * @param articleCreateType
     * @param articleType
     * @param offset
     * @param limit
     * @return
     */
    List<CarArticle> getCarArticle(@Param("articleTitle") String articleTitle,
                                   @Param("articleCreateType") String articleCreateType,
                                   @Param("articleType") String articleType,
                                   @Param("userId") Long userId,
                                   @Param("offset") Integer offset,
                                   @Param("limit") Integer limit);

    /**
     * id
     */
    List<CarArticle> getCarArticleById(@Param("id") Long id);

    /**
     *
     * @param articleTitle
     * @param articleCreateType
     * @param articleType
     * @param offset
     * @param limit
     * @return
     */
    int getCarArticleCount(@Param("articleTitle") String articleTitle,
                           @Param("articleCreateType") String articleCreateType,
                           @Param("articleType") String articleType,
                           @Param("userId") Long userId,
                           @Param("offset") Integer offset,
                           @Param("limit") Integer limit);

    int updateCarArticle(CarArticle carArticle);

    int insertCarArticle(CarArticle carArticle);

    int insertCarArticleClick(CarArticle carArticle);

    int deleteCarArticle(@Param("id") Long id);

    int getCarArticleClickCount(@Param("articleId") Long articleId);

    int getCarArticleDiscussCount(@Param("articleId")Long articleId);
}
