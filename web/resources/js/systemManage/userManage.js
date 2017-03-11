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
    getCarSysUserCondition(condition);
});
function queryByPage(page){
    var userAccount = $("#search_user_acc").val();
    var userName = $("#search_user_name").val();
    var userRealName = $("#search_user_relName").val();
    var deptId = $("#search_user_dept").val();
    currentPage=page;
    var condition = {
        userAccount:userAccount,
        userName:userName,
        userRealName:userRealName,
        // deptId:deptId,
        offset: currentPage*pageSize,
        limit: pageSize
    };
    getCarSysUserCondition(condition);
}
var getCarSysUserCondition = function (condition) {
    // alert(condition);
    $.ajax({
        url : "../sysUser/getSysUserList",
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
                    $("#user_table tbody").empty();

                    return;
                }
                if (result.data.data != null) {
                    $("#user_table tbody").empty();
                    $.each(result.data.data, function (objIndex, carSysUser) {
                        // alert(carSysUser.deptId);
                        // alert(carSysUser.free);
                        if(carSysUser.free == 1){
                            var html_tr = appendCarSyssUserNode(carSysUser);
                            // alert(html_tr);
                            $("#user_table tbody").append(html_tr);
                            getCarDeptById(carSysUser.deptId,1,carSysUser.id);
                        }else if(carSysUser.free == 0){
                            var html_tr = appendCarSysUserNode(carSysUser);
                            // alert(html_tr);
                            $("#user_table tbody").append(html_tr);
                            getCarDeptById(carSysUser.deptId,1,carSysUser.id);
                        }

                    });
                    $("#user_table tbody").append("<tr></tr>");

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

                $("#user_table tbody").empty();

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
var appendCarSyssUserNode = function (carSysUser) {
    var organization_tr = "<tr>"+
        "<td class=\"width2\" style='max-width: 80px!important;' title="+carSysUser.id+">"+carSysUser.id+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userAccount+">"+carSysUser.userAccount+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userName+">"+carSysUser.userName+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userPhone+">"+carSysUser.userPhone+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userEmail+">"+carSysUser.userEmail+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userGender+">"+carSysUser.userGender+"</td>"+
        // "<td class='width2 td_width' title="+carSysUser.deptName+">"+carSysUser.deptName+"</td>"+
        "<td class='width2 td_width' id='parent_name_"+carSysUser.id+"'></td>"+
        // "<td class='width2 td_width' title="+carSysUser.deptDesc+">"+carSysUser.deptDesc+"</td>"+
        "<td class='width2 td_width'>"+
        // "<button type=\"button\" class=\"btn btn-link green carSysUser_detail\" onclick=\"javascript:void(0);\" id="+carSysUser.id+">查看</button>|"+
        "<button type=\"button\" class=\"btn btn-link orange carSysUser_edit\" onclick=\"javascript:void(0);\" id="+carSysUser.id+" value="+carSysUser.deptId+">修改</button>|"+
        "<button type=\"button\" class=\"btn btn-link blue carSysUser_delete\" onclick=\"javascript:void(0);\" id="+carSysUser.id+" value="+carSysUser.deptId+">删除</button>|"+
        "<button type=\"button\" class=\"btn btn-link blue carSysUser_free\" onclick=\"javascript:void(0);\" id="+carSysUser.id+" value="+carSysUser.deptId+">锁定</button>"+
        "<input type=\"hidden\" name=\"carSysUser_id\" value=\""+carSysUser.id+"\">"+
        "<input type=\"hidden\" name=\"carSysUser_deptId\" value=\""+carSysUser.deptId+"\">"+
        "</td>"+
        "</tr>";
    return organization_tr;
}
var appendCarSysUserNode = function (carSysUser) {
    var organization_tr = "<tr>"+
        "<td class=\"width2\" style='max-width: 80px!important;' title="+carSysUser.id+">"+carSysUser.id+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userAccount+">"+carSysUser.userAccount+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userName+">"+carSysUser.userName+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userPhone+">"+carSysUser.userPhone+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userEmail+">"+carSysUser.userEmail+"</td>"+
        "<td class='width2 td_width' title="+carSysUser.userGender+">"+carSysUser.userGender+"</td>"+
        // "<td class='width2 td_width' title="+carSysUser.deptName+">"+carSysUser.deptName+"</td>"+
        "<td class='width2 td_width' id='parent_name_"+carSysUser.id+"'></td>"+
        // "<td class='width2 td_width' title="+carSysUser.deptDesc+">"+carSysUser.deptDesc+"</td>"+
        "<td class='width2 td_width'>"+
        // "<button type=\"button\" class=\"btn btn-link green carSysUser_detail\" onclick=\"javascript:void(0);\" id="+carSysUser.id+">查看</button>|"+
        "<button type=\"button\" class=\"btn btn-link orange carSysUser_edit\" onclick=\"javascript:void(0);\" id="+carSysUser.id+" value="+carSysUser.deptId+">修改</button>|"+
        "<button type=\"button\" class=\"btn btn-link blue carSysUser_delete\" onclick=\"javascript:void(0);\" id="+carSysUser.id+" value="+carSysUser.deptId+">删除</button>|"+
        "<button type=\"button\" class=\"btn btn-link blue carSysUser_free_no\" onclick=\"javascript:void(0);\" id="+carSysUser.id+" value="+carSysUser.deptId+">解锁</button>"+
        "<input type=\"hidden\" name=\"carSysUser_id\" value=\""+carSysUser.id+"\">"+
        "<input type=\"hidden\" name=\"carSysUser_deptId\" value=\""+carSysUser.deptId+"\">"+
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
                        var html_pname = "<tr style='width: 100%'><td style='text-align: center'>"+this.deptName+"</td></tr>";
                        // alert("parent_name_"+carId+"");
                        $("#parent_name_"+carId+"").append(html_pname);
                    });
                }else if(choose == 3){
                    $("#edit_deptId").val("");
                    $.each(resultDate,function () {
                        $("#edit_deptId").val(this.deptName);
                    });
                }
            }
        },
    });
}

function getCarSysUserById(id) {
    alert(id)
    $.ajax({
        url : "../sysUser/getSysUserById",
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
                $("#edit_userAcc").val("");
                $("#edit_userName").val("");
                $("#edit_user_gender").val("");
                $("#edit_userRealName").val("");
                $("#edit_userPhone").val("");
                $("#edit_userEmail").val("");
                $("#edit_userQQ").val("");
                $("#edit_userAddress").val("");
                $.each(resultDate,function () {
                    $("#edit_userAcc").val(this.userAccount);
                    $("#edit_userName").val(this.userName);
                    $("#edit_user_gender").val(this.userGender);
                    $("#edit_userRealName").val(this.userRealName);
                    $("#edit_userPhone").val(this.userPhone);
                    $("#edit_userEmail").val(this.userEmail);
                    $("#edit_userQQ").val(this.userQq);
                    $("#edit_userAddress").val(this.userAddress);
                });
            }
        },
    });
}

/**
 * 点击添加按钮事件
 */
$("#add_user").click(function () {
    // alert("a");
    $("#addUserWindow").show();
});
/**
 *
 */
$("#add_user_btn").click(function () {
   var userAccount = $("#add_userAcc").val();
    // var deptId = $("#add_deptId").val();
    var deptId = 1;
    var userName = $("#add_userName").val();
    var userRealName = $("#add_userRealName").val();
    var userGender = $("#user_gender input:radio:checked").val();
    var userPhone = $("#add_userPhone").val();
    var userEmail = $("#add_userEmail").val();
    var userQq = $("#add_userQQ").val();
    var userAddress = $("#add_userAddress").val();
    if(userAccount == "" || deptId == "" || userName == "" || userRealName==""  || userPhone=="" || userEmail=="" || userAddress==""){
        alert("*号为必填项");
    }else {
        var condition = {
            userAccount:userAccount,
            userName:userName,
            userRealName:userRealName,
            userGender:userGender,
            userPhone:userPhone,
            userEmail:userEmail,
            userQq:userQq,
            userAddress:userAddress,
            userPassword:"123456",//账号初始密码
            deptId:1
        }
        addCarSysUser(condition);
    }
});
var addCarSysUser=function (condition) {
    // alert(condition);
    $.ajax({
        url : "../sysUser/addSysUser",
        type : "post",
        data : condition,
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                $("#addUserWindow").hide();

                //清空新增窗体
                $("#add_userAcc").val("");
                $("#add_userName").val("");
                $("#add_deptId").val("");
                $("#add_userRealName").val("");
                $("#user_gender").val("");
                $("#add_userPhone").val("");
                $("#add_userEmail").val("");
                $("#add_userAddress").val("");
                var condition = {
                    offset: currentPage*pageSize,
                    limit: pageSize
                };
                getCarSysUserCondition(condition);
                alert("增加组织信息成功！");
            }else {
                $("#add_userAcc").val("");
                $("#add_userName").val("");
                $("#add_deptId").val("");
                $("#add_userRealName").val("");
                $("#user_gender").val("");
                $("#add_userPhone").val("");
                $("#add_userEmail").val("");
                $("#add_userAddress").val("");
                $("#addUserWindow").hide();
                alert("增加组织信息失败！");
            }
        },
        error:function () {
            $("#add_userAcc").val("");
            $("#add_userName").val("");
            $("#add_deptId").val("");
            $("#add_userRealName").val("");
            $("#user_gender").val("");
            $("#add_userPhone").val("");
            $("#add_userEmail").val("");
            $("#add_userAddress").val("");
            $("#addUserWindow").hide();
            alert("增加组织信息失败！");
        }
    });
};
/**
 *点击搜索按钮事件
 */
$("#search_user").click(function () {
    var userAccount = $("#search_user_acc").val();
    var userName = $("#search_user_name").val();
    var userRealName = $("#search_user_relName").val();
    var deptId = $("#search_user_dept").val();
    var condition = {
        userAccount:userAccount,
        userName:userName,
        userRealName:userRealName,
        // deptId:deptId,
        offset: currentPage*pageSize,
        limit: pageSize
    };
    // alert(condition);
    getCarSysUserCondition(condition);
});
/**
 *点击选择上级部门按钮事件
 */
$("#search_user_dept").on('click', function(e) {
    e.preventDefault();
    // var modalLocation = $(this).attr('data-reveal-id');
    $("#myModal").reveal($(this).data());
});


$("body").on('click','.carSysUser_delete',function (e) {
    var data = $(this).attr("id");
    $("#delete").append("<input  hidden id='deleteId' value = "+data+">");
    e.preventDefault();
    $("#delete").reveal($(this).data());
});
$("#delete_sure").click(function () {
    var id = $("#deleteId").val();
    // alert(id);
    deleteCarSysUser(id);
});

var deleteCarSysUser = function (id) {
    $.ajax({
        url : "../sysUser/deleteSysUserById",
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
                getCarSysUserCondition(condition);
                alert("删除数据成功！");
            }
        },
    });
};
/**
 * 点击修改绑定事件
 */
$("body").on('click','.carSysUser_edit',function (e) {
    // $("#modify").val("");
    var data = $(this).attr("id");
    var deptId = $(this).val();
    getCarSysUserById(data);
    getCarDeptById(deptId,3);
    $("#modify").append("<input  hidden id='modifyId' value = "+data+">")
    // alert("data="+data+"deptId = "+deptId+"");
    e.preventDefault();
    $("#modify").reveal($(this).data());
});
$("#mod_sure").click(function () {
    var editId = $("#modifyId").val();
    // alert(editId);
    var deptId = $("#edit_deptId").val();
    var userPhone = $("#edit_userPhone").val();
    var userEmail = $("#edit_userEmail").val();
    var userQq = $("#edit_userQQ").val();
    var userAddress = $("#edit_userAddress").val();
    var condition = {
        id:editId,
        userPhone:userPhone,
        userEmail:userEmail,
        userQq:userQq,
        userAddress:userAddress
        // deptId:deptId
    }
    updateCarSysUser(condition,3,2);
});
$("body").on('click','.carSysUser_free',function (e) {
    var data = $(this).attr("id");
    $("#free_sure").append("<input  hidden id='modifyId' value = "+data+">")
    e.preventDefault();
    $("#free_sure").reveal($(this).data());
});
$("body").on('click','.carSysUser_free_no',function (e) {
    var data = $(this).attr("id");
    $("#free_no").append("<input  hidden id='modifyId' value = "+data+">")
    e.preventDefault();
    $("#free_no").reveal($(this).data());
});
$("#free_sure_yes").click(function () {
    // alert("a");
    var editId = $("#modifyId").val();
    var condition = {
        id:editId,
        free:"0"
    }
    updateCarSysUser(condition,1,1);
})
$("#free_sure_no").click(function () {
    var editId = $("#modifyId").val();
    var condition = {
        id:editId,
        free:"1"
    }
    updateCarSysUser(condition,2,1);
});
var updateCarSysUser = function (condition,choose,u) {
    // alert("b");
    var url="";
    if(u == 1){
        url="../sysUser/freeSysUserById";
        // return;
    }else if(u==2){
        url = "../sysUser/updateSysUserById";
        // return;
    }
    // alert(url);
    $.ajax({
        url : url,
        type : "post",
        data : condition,
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                if(choose==1){
                    $(".reveal-modal-bg").hide();
                    $("#free_sure").hide();
                    var condition = {
                        offset: currentPage*pageSize,
                        limit: pageSize
                    };
                    getCarSysUserCondition(condition);
                    alert("该账号已被锁定！");
                }else if(choose==2){
                    $(".reveal-modal-bg").hide();
                    $("#free_no").hide();
                    var condition = {
                        offset: currentPage*pageSize,
                        limit: pageSize
                    };
                    getCarSysUserCondition(condition);
                    alert("该账号已解锁！");
                } else if(choose==3){
                    $(".reveal-modal-bg").hide();
                    $("#modify").hide();
                    var condition = {
                        offset: currentPage*pageSize,
                        limit: pageSize
                    };
                    getCarSysUserCondition(condition);
                    alert("修改组织信息成功！");
                    }

            }else {
                alert("修改组织信息失败！");
            }
        },
    });
}
$("#mod_cancel").click(function () {
    $("#edit_userAcc").val("");
    $("#edit_userName").val("");
    $("#edit_deptId").val("");
    $("#edit_userRealName").val("");
    $("#edit_user_gender").val("");
    $("#edit_userPhone").val("");
    $("#edit_userEmail").val("");
    $("#edit_userQQ").val("");
    $("#edit_userAddress").val("");

    $(".reveal-modal-bg").hide();
    $("#modify").hide();
});
$("#add_user_cancel").click(function () {
    $("#add_userAcc").val("");
    $("#add_userName").val("");
    $("#add_deptId").val("");
    $("#add_userRealName").val("");
    $("#user_gender").val("");
    $("#add_userPhone").val("");
    $("#add_userEmail").val("");
    $("#add_userAddress").val("");

    $("#addUserWindow").hide();
});
$("#delete_cancel").click(function () {
    $(".reveal-modal-bg").hide();
    $("#delete").hide();
});
$("#free_sure_cancel").click(function () {
    $(".reveal-modal-bg").hide();
    $("#free_sure").hide();
});
$("#free_no_cancel").click(function () {
    $(".reveal-modal-bg").hide();
    $("#free_no").hide();
});