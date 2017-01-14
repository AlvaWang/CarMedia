package com.media.car.entity.personalCenter;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/12/29.
 */
public class CarDiscussAndReply implements Serializable{
    private Long id;
    private Long articleId;
    private Long userId;
    private String discussContent;//评论内容
    private String discussThumbsNumber;
    private String remark;
    private String createTime;
    private String updateTime;
    private Long createUser;
    private Long updateUser;
    private String status;

    private String userName;

    private Long discussId;
    private String replyContent;
    private String replyThumbsNumber;

    private String replyUserName;
    private Long replyUserId;

    public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id = id;
    }

    public String getDiscussContent(){return discussContent;}
    public void setDiscussContent(String discussContent){this.discussContent = discussContent;}

    public String getDiscussThumbsNumber(){return discussThumbsNumber;}
    public void setDiscussThumbsNumber(String discussThumbsNumber){this.discussThumbsNumber = discussThumbsNumber;}

    public Long getUserId(){
        return userId;
    }
    public void setUserId(Long userId){
        this.userId = userId;
    }

    public String getRemark(){return remark;}
    public void setRemark(String remark){this.remark = remark;}

    public String getCreateTime(){return createTime;}
    public void setCreateTime(String createTime){this.createTime = createTime;}

    public String getUpdateTime(){return updateTime;}
    public void setUpdateTime(String updateTime){this.updateTime = updateTime;}

    public Long getCreateUser(){return createUser;}
    public void setCreateUser(Long createUser){this.createUser = createUser;}

    public Long getUpdateUser(){return updateUser;}
    public void setUpdateUser(Long updateUser){this.updateUser = updateUser;}

    public String getStatus(){return status;}
    public void setStatus(String status){this.status = status;}

    public Long getArticleId(){return articleId;}
    public void setArticleId(Long articleId){this.articleId = articleId;}

    public String  getUserName(){return userName;}
    public void setUserName(String userName){this.userName = userName;}

    public String getReplyContent(){return replyContent;}
    public void setReplyContent(String replyContent){this.replyContent = replyContent;}

    public Long getDiscussId(){return discussId;}
    public void setDiscussId(Long discussId){this.discussId = discussId;}

    public String  getReplyThumbsNumber(){return replyThumbsNumber;}
    public void setReplyThumbsNumber(String replyThumbsNumber){this.replyThumbsNumber = replyThumbsNumber;}

    public String  getReplyUserName(){return replyUserName;}
    public void setReplyUserName(String replyUserName){this.replyUserName = replyUserName;}

    public Long  getReplyUserId(){return replyUserId;}
    public void setReplyUserId(Long replyUserId){this.replyUserId = replyUserId;}

}
