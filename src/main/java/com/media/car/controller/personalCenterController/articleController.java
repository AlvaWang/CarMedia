package com.media.car.controller.personalCenterController;

import com.alibaba.fastjson.JSON;
import com.media.car.controller.dto.BaseResult;
import com.media.car.controller.dto.BootStrapTableResult;
import com.media.car.entity.personalCenter.CarArticle;
import com.media.car.entity.personalCenter.CarDiscussAndReply;
import com.media.car.service.service.personalCenter.ICarArticleService;
import com.media.car.service.service.personalCenter.ICarDiscussAndReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static jdk.nashorn.internal.codegen.Compiler.LOG;

/**
 * Created by Administrator on 2017/1/11.
 */
@Controller
@RequestMapping("article")
public class articleController {
    @Autowired
    private ICarArticleService carArticleService;
    @Autowired
    private ICarDiscussAndReplyService carDiscussAndReplyService;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 獲取文章列表
     * produces解决乱码问题
     */
    @RequestMapping(value = "/getArticleList",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getArticleList(@RequestParam(required = false) String articleTitle,
                                               @RequestParam(required = false) String articleCreateType,
                                               @RequestParam(required = false) String articleType,
                                               @RequestParam(required = false) Long userId,
                                               @RequestParam(required = false) Integer offset,
                                               @RequestParam(required = false) Integer limit) {
        String result = "";
        BaseResult baseResult = null;
        try {
//            Long userId = Long.valueOf(1);
            int  sum= carArticleService.getArticleConditionCount(articleTitle, articleCreateType, articleType,userId,offset, limit);
            if (sum > 0) {
                List<CarArticle> list = carArticleService.getArticleCondition(articleTitle, articleCreateType, articleType,userId,offset, limit);
                if (list != null && list.size() > 0) {
                    BootStrapTableResult tableResult = new BootStrapTableResult<CarArticle>(list, sum);
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(tableResult);
                    result = JSON.toJSONString(baseResult);
                }
            } else {
                baseResult = new BaseResult(true, "没有查询到相关信息！");
                result = JSON.toJSONString(baseResult);
            }

        } catch (Exception e) {
            baseResult = new BaseResult(false, "查询到的数据信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 浏览量
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/getArticleClickCount",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getArticleClickCount(@RequestParam(required = false) Long articleId) {
        String result = "";
        BaseResult baseResult = null;
        try {
            int  sum= carArticleService.getArticleClickCount(articleId);
            baseResult = new BaseResult(true, "");
            baseResult.setData(sum);
            result = JSON.toJSONString(baseResult);

        } catch (Exception e) {
            baseResult = new BaseResult(false, "查询到的数据信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 评论量
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/getArticleDiscussCount",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getArticleDiscussCount(@RequestParam(required = false) Long articleId) {
        String result = "";
        BaseResult baseResult = null;
        try {
            int  sum= carArticleService.getArticleDiscussCount(articleId);
            baseResult = new BaseResult(true, "");
            baseResult.setData(sum);
            result = JSON.toJSONString(baseResult);

        } catch (Exception e) {
            baseResult = new BaseResult(false, "查询到的数据信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 获取文章详情
     * @param id
     * @return
     */
    @RequestMapping(value = "getCarArticleById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getCarArticleById(@RequestParam Long id){

        LOG.info("invoke----------/org/getCarArticleById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                List<CarArticle> carArticles = carArticleService.getArticleConditionById(id);
                if ( carArticles != null) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(carArticles);
                } else {
                    baseResult = new BaseResult(true, "根据ID没有查询到部门信息！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"根据ID查询部门信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 编辑文章
     * @param id
     * @return
     */
    @RequestMapping(value = "updateCarArticleById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String updateCarArticleById(@RequestParam(required = false) Long id,
                                                  @RequestParam(required = false) String articleTitle,
                                                  @RequestParam(required = false) String articleCreateType,
                                                  @RequestParam(required = false) String articleType,
                                                  @RequestParam(required = false) String articleContent,
                                                  @RequestParam(required = false) String articleEnclosure){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int update = carArticleService.updateCarArticleConditionById(id,articleTitle,articleCreateType,articleType,articleContent,articleEnclosure);//根据ID查询预案培训
                if ( update>0) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(update);
                } else {
                    baseResult = new BaseResult(true, "id不存在！");
                }
                result = JSON.toJSONString(baseResult);
            }else{
                baseResult=new BaseResult(true,"没有传入Id");
                result = JSON.toJSONString(baseResult);
            }
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     *增加、发表文章
     * @return
     */
    @RequestMapping(value = "/addCarArticle",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String addCarArticle(@RequestParam(required = false) String articleTitle,
                                                    @RequestParam(required = false) String articleCreateType,
                                                    @RequestParam(required = false) String articleType,
                                                    @RequestParam(required = false) String articleContent,
                                                    @RequestParam(required = false) String articleEnclosure){
        String result = null;
        BaseResult baseResult=null;
        try {
            Long userId = Long.valueOf(1);
            String id = carArticleService.addCarArticle(articleTitle,articleCreateType,articleType,articleContent,articleEnclosure,userId);
            if (id != null){
                baseResult = new BaseResult(true,"");
                baseResult.setData(id);
            }else {
                baseResult = new BaseResult(true,"插入数据失败！");
            }
            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
            baseResult = new BaseResult(false,"插入数据异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 删除文章
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCarArticleById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String deleteCarArticleById(@RequestParam(required = false) Long id){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int rel = carArticleService.deleteArticleConditionById(id);//根据ID查询预案培训
                if ( rel>0) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(rel);
                } else {
                    baseResult = new BaseResult(true, "id不存在！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }


    /**
     * 增加浏览量
     * @param articleId
     * @param userId
     * @return
     */
    @RequestMapping(value = "/addCarArticleClick",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String addCarArticleClick(@RequestParam(required = false) Long articleId,
                                              @RequestParam(required = false) Long userId){
        String result = null;
        BaseResult baseResult=null;
        try {
            String clickTime = timeF.format(new Date());
            String id = carArticleService.addCarArticleClick(articleId,userId,clickTime);
            if (id != null){
                baseResult = new BaseResult(true,"");
                baseResult.setData(id);
            }else {
                baseResult = new BaseResult(true,"插入数据失败！");
            }
            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
            baseResult = new BaseResult(false,"插入数据异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 获取评论
     * @param articleId
     * @return
     */
    @RequestMapping(value = "getCarDiscussById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getCarDiscussById(@RequestParam Long articleId){

        LOG.info("invoke----------/org/getCarArticleById");
        LOG.info("传入参数:"+articleId);
        String result="";
        BaseResult baseResult=null;
        try {
            if(articleId!=null){
                List<CarDiscussAndReply> list = carDiscussAndReplyService.getDiscussConditionById(articleId);
                if ( list != null) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(list);
                } else {
                    baseResult = new BaseResult(true, "根据ID没有查询到部门信息！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"根据ID查询部门信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    /**
     * 获取回复
     * @param discussId
     * @return
     */
    @RequestMapping(value = "getCarReplyById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getCarReplyById(@RequestParam Long discussId){

        LOG.info("invoke----------/org/getCarReplyById");
        LOG.info("传入参数:"+discussId);
        String result="";
        BaseResult baseResult=null;
        try {
            if(discussId!=null){
                List<CarDiscussAndReply> list = carDiscussAndReplyService.getReplyConditionById(discussId);
                if ( list != null) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(list);
                } else {
                    baseResult = new BaseResult(true, "根据ID没有查询到部门信息！");
                }

            }else{
                baseResult=new BaseResult(true,"传入的参数不对");
            }

            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
//            LOG.error("根据ID查询档案信息异常！", e);
            baseResult=new BaseResult(false,"根据ID查询部门信息异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    @RequestMapping(value = "/addCarDiscuss",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String addCarDiscuss(@RequestParam(required = false) Long articleId,
                                              @RequestParam(required = false) Long userId,
                                              @RequestParam(required = false) String discussContent,
                                              @RequestParam(required = false) String discussThumbsNumber){
        String result = null;
        BaseResult baseResult=null;
        try {
            String id = carDiscussAndReplyService.addCarDiscuss(articleId,userId,discussContent,discussThumbsNumber);
            if (id != null){
                baseResult = new BaseResult(true,"");
                baseResult.setData(id);
            }else {
                baseResult = new BaseResult(true,"插入数据失败！");
            }
            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
            baseResult = new BaseResult(false,"插入数据异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

    @RequestMapping(value = "/addCarReply",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String addCarReply(@RequestParam(required = false) Long discussId,
                                              @RequestParam(required = false) Long userId,
                                            @RequestParam(required = false) Long replyUserId,
                                              @RequestParam(required = false) String replyContent,
                                              @RequestParam(required = false) String replyThumbsNumber){
        String result = null;
        BaseResult baseResult=null;
        try {
            String id = carDiscussAndReplyService.addCarReply(discussId,userId,replyUserId,replyContent,null);
            if (id != null){
                baseResult = new BaseResult(true,"");
                baseResult.setData(id);
            }else {
                baseResult = new BaseResult(true,"插入数据失败！");
            }
            result = JSON.toJSONString(baseResult);
        }catch (Exception e){
            baseResult = new BaseResult(false,"插入数据异常！");
            result = JSON.toJSONString(baseResult);
        }
        return result;
    }

}
