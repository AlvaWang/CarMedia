/**
 * Created by Administrator on 2016/12/30.
 */
var currentPage=0;//当前页
var pageCount=0;//总页数
var pageSize=5;//每页数量
$(function () {
    var condition = {
        offset: currentPage*pageSize,
        limit: pageSize
    };
    getCarDeptCondition(condition);
});
function queryByPage(page){
    var deptName = $("#search_dept_name").val();
    var deptId = $("#search_dept_up").val();
    currentPage=page;
    var condition = {
        deptName:deptName,
        // deptId:deptId,
        offset: currentPage*pageSize,
        limit: pageSize
    };
    getCarDeptCondition(condition);
}
var getCarDeptCondition = function (condition) {
    // alert(condition);
    $.ajax({
        url : "../org/getDeptList",
        type : "post",
        data : condition,
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                if (result.error != "") {
                    $("#currentPage").val("1");
                    $("#pageNum").text("1");
                    $("#count").text(0);
                    $("#pageAllCount").text(0);
                    $("#show_begin_position").text(0);
                    $("#show_end_position").text(0);
                    currentPage = 0;
                    pageCount = 0;

                    alert(result.error);
                    $("#dept_table tbody").empty();

                    return;
                }
                if (result.data.data != null) {
                    $("#dept_table tbody").empty();
                    $.each(result.data.data, function (objIndex, carDept) {
                        // alert(carDept.deptId);
                        if(carDept.deptId == 0){
                            var html_tr = appendCarDeptRootNode(carDept);
                            // alert(html_tr);
                            $("#dept_table tbody").append(html_tr);
                        }else {
                            var html_tr = appendCarDeptNode(carDept);
                            // alert(html_tr);
                            $("#dept_table tbody").append(html_tr);
                            getCarDeptById(carDept.deptId,1,carDept.id);
                        }
                    });
                    $("#dept_table tbody").append("<tr></tr>");

                    /**
                     * 分页页数
                     * @type {number}
                     */
                    var showPage = parseInt(currentPage)+1;
                    $("#pageNum").text(showPage);
                    var count = result.data.sum;
                    if(count%pageSize == 0){
                        pageCount = parseInt(count/pageSize-1);
                        //  alert(pageCount);
                    }else {
                        pageCount = parseInt(count/pageSize);
                    }
                    $("#count").text(count);
                    $('#pageCount').val(parseInt(pageCount) + 1);
                    $('#pageAllCount').text(parseInt(pageCount) + 1);
                    $("#show_begin_position").text(currentPage * pageSize + 1);
                    $("#show_end_position").text(currentPage * pageSize + pageSize);
                }else {
                    $("#pageNum").text("1");
                    $("#count").text(0);
                    $("#pageAllCount").text(0);
                    $("#show_begin_position").text(0);
                    $("#show_end_position").text(0);
                    currentPage = 0;
                    pageCount=0;

                    var txt = "没有查询到符合条件的信息";
                    alert(txt);
                    return;
                }
            }
            else {
                $("#pageNum").text("1");
                $("#count").text(0);
                $("#pageAllCount").text(0);
                $("#show_begin_position").text(0);
                $("#show_end_position").text(0);
                currentPage = 0;
                pageCount=0;

                $("#dept_table tbody").empty();

                var txt = "没有查询到符合条件的信息";
                alert(txt);
                return;
            }


        },
        error : function (obj,msg) {
            var txt = "查询数据异常！";
            alert(txt);
        },
        complete : function () {

        }

    });
}
var appendCarDeptRootNode = function (carDept) {
    var organization_tr = "<tr>"+
        "<td class=\"width2\" style='max-width: 80px!important;' title="+carDept.id+">"+carDept.id+"</td>"+
        "<td class='width2 td_width' title="+carDept.deptName+">"+carDept.deptName+"</td>"+
        "<td class='width2 td_width'title='最高行政部门'><p>最高行政部门</p></td>"+
        "<td class='width2 td_width' title="+carDept.deptDesc+">"+carDept.deptDesc+"</td>"+
        "<td class='width2 td_width'>"+
        // "<button type=\"button\" class=\"btn btn-link green carDept_detail\" onclick=\"javascript:void(0);\" id="+carDept.id+">查看</button>|"+
        "<button type=\"button\" class=\"btn btn-link orange carDept_edit\" onclick=\"javascript:void(0);\" id="+carDept.id+">修改</button>|"+
        "<button type=\"button\" class=\"btn btn-link blue carDept_delete\" onclick=\"javascript:void(0);\" id="+carDept.id+" value="+carDept.deptId+">删除</button>"+
        "<input type=\"hidden\" name=\"carDept_id\" value=\""+carDept.id+"\">"+
        "<input type=\"hidden\" name=\"carDept_deptId\" value=\""+carDept.deptId+"\">"+
        "</td>"+
        "</tr>";
    return organization_tr;
}
var appendCarDeptNode = function (carDept) {
    var organization_tr = "<tr>"+
        "<td class=\"width2\" style='max-width: 80px!important;' title="+carDept.id+">"+carDept.id+"</td>"+
        "<td class='width2 td_width' title="+carDept.deptName+">"+carDept.deptName+"</td>"+
        // "<td class='width2 td_width' title="+carDept.deptName+">"+carDept.deptName+"</td>"+
        "<td class='width2 td_width' id='parent_name_"+carDept.id+"'></td>"+
        "<td class='width2 td_width' title="+carDept.deptDesc+">"+carDept.deptDesc+"</td>"+
        "<td class='width2 td_width'>"+
        // "<button type=\"button\" class=\"btn btn-link green carDept_detail\" onclick=\"javascript:void(0);\" id="+carDept.id+">查看</button>|"+
        "<button type=\"button\" class=\"btn btn-link orange carDept_edit\" onclick=\"javascript:void(0);\" id="+carDept.id+" value="+carDept.deptId+">修改</button>|"+
        "<button type=\"button\" class=\"btn btn-link blue carDept_delete\" onclick=\"javascript:void(0);\" id="+carDept.id+" value="+carDept.deptId+">删除</button>"+
        "<input type=\"hidden\" name=\"carDept_id\" value=\""+carDept.id+"\">"+
        "<input type=\"hidden\" name=\"carDept_deptId\" value=\""+carDept.deptId+"\">"+
        "</td>"+
        "</tr>";
    return organization_tr;
}
/**
 * 根据id获取相关信息
 * @param id
 * @param choose
 */
function getCarDeptById(id,choose,carId) {
    $.ajax({
        url : "../org/getCarDeptById",
        type : "post",
        data : {
            id:id
        },
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                console.log(result);
                var resultDate = eval(result.data);
                if(choose==1){
                    $("#parent_name").val("");
                    $.each(resultDate,function () {
                        var html_pname = "<tr><td>"+this.deptName+"</td></tr>";
                        // alert("parent_name_"+carId+"");
                        $("#parent_name_"+carId+"").append(html_pname);
                    });
                }else if(choose == 2){
                    $("#mod_deptName").val("");
                    $("#mod_deptDesc").val("");
                    $.each(resultDate,function () {
                        $("#mod_deptName").val(this.deptName);
                        $("#mod_deptDesc").val(this.deptDesc);
                    });
                }else if(choose == 3){
                    $("#mod_deptId").val("");
                    $.each(resultDate,function () {
                        $("#mod_deptId").val(this.deptName);
                    });
                }
            }
        },
    });
}

/**
 * 点击添加按钮事件
 */
$("#add_dept").click(function () {
    // alert("a");
    $("#addDeptWindow").show();
});
/**
 *
 */
$("#add_dept_btn").click(function () {
   var deptName = $("#add_deptName").val();
    // var deptId = $("#add_deptId").val();
    var deptId = 1;
    var deptDesc = $("#add_deptDesc").val();
    if(deptName == "" || deptId == "" || deptDesc == ""){
        alert("请填写全部数据");
    }else {
        var condition = {
            deptName:deptName,
            deptDesc:deptDesc,
            deptId:1
        }
        addCarDept(condition);
    }
});
var addCarDept=function (condition) {
    $.ajax({
        url : "../org/addCarDept",
        type : "post",
        data : condition,
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                $("#addDeptWindow").hide();
                var condition = {
                    offset: currentPage*pageSize,
                    limit: pageSize
                };
                getCarDeptCondition(condition);
                alert("增加组织信息成功！");
            }else {
                alert("增加组织信息失败！");
            }
        },
    });
};
/**
 *点击搜索按钮事件
 */
$("#search_dept").click(function () {
    var deptName = $("#search_dept_name").val();
    var deptId =$("#search_dept_up").val();
    var condition = {
        deptName:deptName,
        // deptId:deptId,
        offset: currentPage*pageSize,
        limit: pageSize
    };
    // alert(condition);
    getCarDeptCondition(condition);
});
/**
 *点击选择上级部门按钮事件
 */
$("#search_dept_up").on('click', function(e) {
    e.preventDefault();
    // var modalLocation = $(this).attr('data-reveal-id');
    $("#myModal").reveal($(this).data());
});


$("body").on('click','.carDept_delete',function (e) {
    // $("#delete").val("");

    var data = $(this).attr("id");
    $("#delete").append("<input  hidden id='deleteId' value = "+data+">");
    e.preventDefault();
    $("#delete").reveal($(this).data());
});
$("#delete_sure").click(function () {
    var id = $("#deleteId").val();
    // alert(id);
    deleteCarDept(id);
});

var deleteCarDept = function (id) {
    $.ajax({
        url : "../org/deleteCarDeptById",
        type : "post",
        data : {
            id:id
        },
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                $(".reveal-modal-bg").hide();
                $("#delete").hide();
                var condition = {
                    offset: currentPage*pageSize,
                    limit: pageSize
                };
                getCarDeptCondition(condition);
                alert("删除数据成功！");
            }
        },
    });
};
/**
 * 点击修改绑定事件
 */
$("body").on('click','.carDept_edit',function (e) {
    // $("#modify").val("");

    var data = $(this).attr("id");
    var deptId = $(this).val();
    getCarDeptById(data,2);
    getCarDeptById(deptId,3);
    $("#modify").append("<input  hidden id='modifyId' value = "+data+">")
    // alert("data="+data+"deptId = "+deptId+"");
    e.preventDefault();
    $("#modify").reveal($(this).data());
});
$("#mod_sure").click(function () {
    var editId = $("#modifyId").val();
    // alert(editId);
    var deptName = $("#mod_deptName").val();
    var deptDesc = $("#mod_deptDesc").val();
    var deptId = $("#mod_deptId").val();
    var condition = {
        id:editId,
        deptName:deptName,
        deptDesc:deptDesc,
        // deptId:deptId
    }
    updateCarDept(condition);
});
var updateCarDept = function (condition) {
    $.ajax({
        url : "../org/updateCarDeptById",
        type : "post",
        data : condition,
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                $(".reveal-modal-bg").hide();
                $("#modify").hide();
                var condition = {
                    offset: currentPage*pageSize,
                    limit: pageSize
                };
                getCarDeptCondition(condition);
                alert("修改组织信息成功！");
            }else {
                alert("修改组织信息失败！");
            }
        },
    });
}
$("#mod_cancel").click(function () {
    $("#mod_deptName").val("");
    $("#mod_deptDesc").val("");
    $("#mod_deptId").val("");
    $(".reveal-modal-bg").hide();
    $("#modify").hide();
});
$("#add_cancel").click(function () {
    $("#add_deptName").val("");
    $("#add_deptDesc").val("");
    $("#add_deptId").val("");
    $("#addDeptWindow").hide();
});
$("#delete_cancel").click(function () {
    $(".reveal-modal-bg").hide();
    $("#delete").hide();
});