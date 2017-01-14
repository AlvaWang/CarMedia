/**
 * Created by Administrator on 2017/1/14.
 */
var currentPage=0;//当前页
var pageCount=0;//总页数
var pageSize=5;//每页数量
$(function () {
    var condition = {
        offset: currentPage*pageSize,
        limit: pageSize
    };
    getCarArticleCondition(condition);
});
function queryByPage(page){
    var articleTitle = $("#search_article_title").val();
    var articleCreateType = $("#search_article_create_type option:selected").val();
    var articleType = $("#search_article_type option:selected").val();
    currentPage=page;
    var condition = {
        // articleTitle:articleTitle,
        // articleCreateType:articleCreateType,
        // articleType:articleType,
        // userId:1,
        offset: currentPage*pageSize,
        limit: pageSize
    };
    getCarArticleCondition(condition);
}
/**
 *点击搜索按钮事件
 */
$("#search_article").click(function () {
    var articleTitle = $("#search_article_title").val();
    var articleCreateType = $("#search_article_create_type option:selected").val();
    var articleType = $("#search_article_type option:selected").val();
    var condition = {
        articleTitle:articleTitle,
        articleCreateType:articleCreateType,
        articleType:articleType,
        userId:1,
        offset: currentPage*pageSize,
        limit: pageSize
    };
    // getCarArticleCondition(condition);
});
var getCarArticleCondition = function (condition) {
    // alert(condition);
    $.ajax({
        url : "../article/getArticleList",
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
                    $("#table_articleManage tbody").empty();

                    return;
                }
                if (result.data.data != null) {
                    $("#table_articleManage tbody").empty();
                    $.each(result.data.data, function (objIndex, carArticle) {
                        // alert(carSysUser.deptId);
                        // alert(carSysUser.free);
                        var html_tr = appendCarArticleNode(carArticle);
                        // alert(html_tr);
                        $("#table_articleManage tbody").append(html_tr);
                        getArticleAboutCount(carArticle.id,1);
                        getArticleAboutCount(carArticle.id,2);
                    });
                    $("#table_articleManage tbody").append("<tr></tr>");

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

                $("#article_table tbody").empty();

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
var appendCarArticleNode = function (carArticle) {
    var sendTime = carArticle.sendTime.substr(0,19);
    var organization_tr = "<tr>"+
        // "<td class=\"width2\" style='max-width: 80px!important;' title="+carArticle.id+">"+carArticle.id+"</td>"+
        "<td class='width2 td_width' style='width: 40%;' title="+carArticle.articleTitle+"><a class='read_article' id="+carArticle.id+">"+carArticle.articleTitle+"</a></td>"+
        "<td class='width2 td_width' title="+carArticle.userName+">"+carArticle.userName+"</td>"+
        "<td class='width2 td_width' title="+carArticle.staticValue+">"+carArticle.staticValue+"</td>"+
        "<td class='width2 td_width' id='read_count_"+carArticle.id+"'></td>"+//文章浏览量
        "<td class='width2 td_width' id='discuss_count_"+carArticle.id+"'></td>"+
        "<td class='width2 td_width' title="+sendTime+">"+sendTime+"</td>"+
        "<td class='width2 td_width'>"+
        "<button type=\"button\" class=\"btn btn-link blue carArticle_delete\" onclick=\"javascript:void(0);\" id="+carArticle.id+">删除</button>"+
        // "<a href='#' data-toggle='control-sidebar'><i class='fa fa-gears'></i></a></li></ul></div>"+
        "<input type=\"hidden\" name=\"carArticle_id\" value=\""+carArticle.id+"\">"+
        "<input type=\"hidden\" name=\"carArticle_deptId\" value=\""+carArticle.deptId+"\">"+
        "</td>"+"</tr>";
    return organization_tr;
};


var getArticleAboutCount = function (articleId,choose) {
    var url="";
    if(choose==1){
        url = "../article/getArticleClickCount";
    }
    if(choose == 2){
        url = "../article/getArticleDiscussCount";
    }
    $.ajax({
        url : url,
        type : "post",
        data : {
            articleId:articleId
        },
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
                var count=0;
                if(result.data !=""){
                    count=result.data;
                }
                // alert(clickCount);
                if(choose == 1){
                    // alert("read_count_"+articleId);
                    var html_count = "<tr><td>"+count+"</td></tr>";
                    $("#read_count_"+articleId+"").append(html_count);
                }
                if (choose == 2){
                    // alert("discuss_count_"+articleId);
                    var html_count = "<tr><td>"+count+"</td></tr>";
                    $("#discuss_count_"+articleId+"").append(html_count);
                }
            }
        }
    });
};
$("body").on('click','.carArticle_delete',function (e) {
    var data = $(this).attr("id");
    $("#delete").append("<input  hidden id='deleteId' value = "+data+">");
    e.preventDefault();
    $("#delete").reveal($(this).data());
});
$("#delete_sure").click(function () {
    var id = $("#deleteId").val();
    // alert(id);
    deleteCarArticle(id);
});

var deleteCarArticle = function (id) {
    $.ajax({
        url : "../article/deleteCarArticleById",
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
                getCarArticleCondition(condition);
                alert("删除数据成功！");
            }
        },
    });
};
$("#delete_cancel").click(function () {
    $(".reveal-modal-bg").hide();
    $("#delete").hide();
});

var articleId;
$("body").on('click','.read_article',function () {
    articleId = $(this).attr("id");
    var condition ={
        articleId:articleId,
        userId:1
    }
    ClickRead(condition);
    window.location.href="../personalCenter/readArticle?articleId="+articleId;
});

/**
 *
 * @param articleId
 * @constructor
 */
var ClickRead=function (condition) {
    $.ajax({
        url : "../article/addCarArticleClick",
        type : "post",
        data : condition,
        async:true,
        dataType : "json",
        success : function (result) {
            if (result.success == true) {
            }else {

            }
        },
        error:function () {;
        }
    });
}
