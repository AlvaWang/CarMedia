package com.media.car.service.service.personalCenter;

import com.media.car.entity.personalCenter.CarDiscussAndReply;

import java.util.List;

/**
 * Created by Administrator on 2017/1/11.
 */
public interface ICarDiscussAndReplyService {


    /**
     * 通过文章ID获取评论及详情
     * @param articleId
     * @return
     */
    List<CarDiscussAndReply> getDiscussConditionById(Long articleId);

    /**
     * 通过评论ID获取回复详情
     * @param discussId
     * @return
     */
    List<CarDiscussAndReply> getReplyConditionById(Long discussId);

    /**
     * 增加评论
     * @param articleId
     * @param userId
     * @param discussContent
     * @param discussThumbsNumber
     * @return
     */
    String addCarDiscuss(Long articleId, Long userId, String discussContent, String discussThumbsNumber);

    /**
     * 增加回复
     * @param discussId
     * @param userId
     * @param replyContent
     * @param replyThumbsNumber
     * @return
     */
    String addCarReply(Long discussId, Long userId,Long replyUserId, String replyContent, String replyThumbsNumber);

    /**
     * 删除评论
     * @param id
     * @return
     */
    int deleteDiscussConditionById(Long id);

    /**
     * 删除回复
     * @param id
     * @return
     */
    int deleteReplyConditionById(Long id);
}
