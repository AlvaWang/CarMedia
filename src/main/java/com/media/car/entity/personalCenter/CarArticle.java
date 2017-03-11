package com.media.car.entity.personalCenter;

import java.io.Serializable;

/**
 * Created by Administrator on 2016/12/29.
 */
public class CarArticle implements Serializable{
    private Long id;
    private String articleTitle;
    private String articleCreateType;
    private String articleType;
    private Long userId;
    private  String articleContent;
    private String articleEnclosure;//附件
    private String sendStatus;
    private String sendTime;//发表时间
    private String remark;
    private String createTime;
    private String updateTime;
    private Long createUser;
    private Long updateUser;
    private String status;

    private String staticCode;
    private String staticValue;

    private Long articleId;

    private String clickTime;

    private String userName;

    private int articleClickCount;

    public Long getId(){
        return id;
    }
    public void setId(Long id){
        this.id = id;
    }

    public String getArticleTitle(){return articleTitle;}
    public void setArticleTitle(String articleTitle){this.articleTitle = articleTitle;}

    public String getArticleCreateType(){
        return  articleCreateType;
    }
    public void setArticleCreateType(String articleCreateType){
        this.articleCreateType = articleCreateType;
    }

    public String getArticleType(){
        return  articleType;
    }
    public void setArticleType(String articleType){
        this.articleType = articleType;
    }

    public String getArticleContent(){
        return  articleContent;
    }
    public void setArticleContent(String articleContent){
        this.articleContent = articleContent;
    }

    public String getArticleEnclosure(){
        return  articleEnclosure;
    }
    public void setArticleEnclosure(String articleEnclosure){
        this.articleEnclosure = articleEnclosure;
    }

    public String getSendStatus(){
        return  sendStatus;
    }
    public void setSendStatus(String sendStatus){
        this.sendStatus = sendStatus;
    }

    public String getSendTime(){
        return  sendTime;
    }
    public void setSendTime(String sendTime){
        this.sendTime = sendTime;
    }

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

    public String getStaticCode(){return staticCode;}
    public void setStaticCode(String staticCode){this.staticCode = staticCode;}

    public String getStaticValue(){return staticValue;}
    public void setStaticValue(String staticValue){this.staticValue = staticValue;}

    public Long getArticleId(){return articleId;}
    public void setArticleId(Long articleId){this.articleId = articleId;}

    public String getClickTime(){
        return  clickTime;
    }
    public void setClickTime(String clickTime){
        this.clickTime = clickTime;
    }

    public String getUserName(){
        return  userName;
    }
    public void setUserName(String userName){
        this.userName = userName;
    }

    public int getArticleClickCount(){
        return  articleClickCount;
    }
    public void setArticleClickCount(int userName){
        this.articleClickCount = articleClickCount;
    }

}
