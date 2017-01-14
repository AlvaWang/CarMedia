package com.media.car.controller.systemController;

import com.alibaba.fastjson.JSON;
import com.media.car.controller.dto.BaseResult;
import com.media.car.controller.dto.BootStrapTableResult;
import com.media.car.entity.System.CarDept;
import com.media.car.service.service.System.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import static jdk.nashorn.internal.codegen.Compiler.LOG;

/**
 * Created by Administrator on 2016/12/29.
 */
@Controller
@RequestMapping("org")
public class orgController {
    @Autowired
    private IDeptService deptService;
    private  static DateFormat timeF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 获取部门列表
     * produces解决乱码问题
     */
    @RequestMapping(value = "/getDeptList",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getDeptList(@RequestParam(required = false) String deptName,
                              @RequestParam(required = false) Long deptId,
                              @RequestParam(required = false) Integer offset,
                              @RequestParam(required = false) Integer limit) {
        String result = "";
        BaseResult baseResult = null;
        try {
            int  sum= deptService.getDeptConditionCount(deptName, deptId, offset, limit);
            if (sum > 0) {
                List<CarDept> list = deptService.getDeptCondition(deptName, deptId, offset, limit);
                if (list != null && list.size() > 0) {
                    BootStrapTableResult tableResult = new BootStrapTableResult<CarDept>(list, sum);
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
     * 根据ID查询部门信息
     * @param id
     * @return
     */
    @RequestMapping(value = "getCarDeptById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String getCarDeptById(@RequestParam Long id){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                List<CarDept> carDepts = deptService.getDeptConditionById(id);
                if ( carDepts != null) {
                    baseResult = new BaseResult(true, "");
                    baseResult.setData(carDepts);
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
     * 修改部门信息
     * @param id
     * @return
     */
    @RequestMapping(value = "updateCarDeptById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String updateCarDeptById(@RequestParam(required = false) Long id,
                                                  @RequestParam(required = false) String deptName,
                                                  @RequestParam(required = false) String deptDesc,
                                                  @RequestParam(required = false) Long deptId){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int update = deptService.updateDeptConditionById(id,deptName,deptDesc,deptId);//根据ID查询预案培训
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
     *
     * @return
     */
    @RequestMapping(value = "/addCarDept",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String addCarDeptCondition(@RequestParam(required = false) String deptName,
                                                  @RequestParam(required = false) String deptDesc,
                                                    @RequestParam(required = false) Long deptId){
        String result = null;
        BaseResult baseResult=null;
        try {
            String id = deptService.addCarDept(deptName,deptDesc,deptId);
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
     * 删除部门信息
     * @param id
     * @return
     */
    @RequestMapping(value = "deleteCarDeptById",produces = "text/html;charset=UTF-8;")
    public @ResponseBody String deleteCarDeptById(@RequestParam(required = false) Long id){

        LOG.info("invoke----------/org/getCarDeptById");
        LOG.info("传入参数:"+id);
        String result="";
        BaseResult baseResult=null;
        try {
            if(id!=null){
                int rel = deptService.deleteDeptConditionById(id);//根据ID查询预案培训
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

}

    /**
     * 组织树形结构数据查询
     * @param request
     * @param response
     * @throws Exception
     */
//    @RequestMapping("/qryCarDeptTreeInfo")
//    public  void queryKnowledgeKindTreeInfo (HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String jsonData="";
//        //获取前台树节点
//        long parentId = 0;
//        long id = Long.parseLong(request.getParameter("id"));
//        if(StringUtils.isEmpty(id)){
//            parentId =0;//无节点信息为一级节点
//        }else{
//            parentId=id;
//        }
//        List list =  new ArrayList();
//        List<CarDept>  carDepts=null;
//        if (parentId == 0) {
//            //查询所有一级节点，即parentId为0的节点数据
////            Map<String,String> param=new HashedMap();
////            param.put("parentId",parentId);
//            carDepts = deptService.getDeptCondition(null,parentId,null,null);
//            if (carDepts != null && carDepts.size() > 0) {
//                for (int i = 0; i < carDepts.size(); i++) {
//                    HashMap map = new HashMap();
//                    map.put("id",carDepts.get(i).getId());
//                    map.put("pId","-1");
//                    map.put("name",carDepts.get(i).getDeptName());
//                    map.put("isParent",true);
//                    map.put("file", "core/click");
//                    map.put("userobj", carDepts.get(i).getDeptId(););
//                    list.add(map);
//                }
//            }
//        }else{
//            //子级节点
////            Map<String,String> param=new HashedMap();
////            param.put("parentId",parentId);
//            carDepts = deptService.getDeptCondition(null,parentId,null,null);
//            boolean  flag = false;
//
//            if (carDepts != null && carDepts.size() > 0) {
//                for (int i = 0; i < carDepts.size(); i++) {
//                    //判断是否有下级
//                    param=new HashedMap();
//                    param.put("parentId",carDepts.get(i).getId());
//                    List<CarDept> isHaveNodes = deptService.getKnowledgeKindByCondition(param);
//                    if(isHaveNodes != null && isHaveNodes.size() > 0){
//                        flag=true;
//                    }
//                    //放置节点值
//                    HashMap map = new HashMap();
//                    map.put("id",carDepts.get(i).getId());
//                    map.put("pId", id);
//                    map.put("name",carDepts.get(i).getKnowledgeKind());
//                    map.put("isParent",flag);
//                    map.put("file", "core/click");
//                    map.put("userobj",carDepts.get(i).getParentId());
//                    list.add(map);
//                    flag = false;
//                }
//            }
//        }
//        HashMap resultMap = new HashMap();
//        resultMap.put("success", "1");
//        resultMap.put("jsonData", list);
//        jsonData = JSON.toJSONString(resultMap);
//        LOG.info("jsonData is "+jsonData);
//        response.setContentType("json; charset=utf-8");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(jsonData);
//        response.getWriter().flush();
//        response.getWriter().close();
//    }
//}
