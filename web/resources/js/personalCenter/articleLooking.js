/**
 * Created by Devin on 2016/10/6.
 */

$(function () {
    $.extend({
        Request: function (m) {
            var sValue = location.search.match(new RegExp("[\?\&]" + m + "=([^\&]*)(\&?)", "i"));
            return sValue ? sValue[1] : sValue;
        },
        UrlUpdateParams: function (url, name, value) {
            var r = url;
            if (r != null && r != 'undefined' && r != "") {
                value = encodeURIComponent(value);
                var reg = new RegExp("(^|)" + name + "=([^&]*)(|$)");
                var tmp = name + "=" + value;
                if (url.match(reg) != null) {
                    r = url.replace(eval(reg), tmp);
                }
                else {
                    if (url.match("[\?]")) {
                        r = url + "&" + tmp;
                    } else {
                        r = url + "?" + tmp;
                    }
                }
            }
            return r;
        }

    });

    var id = $.Request("articleId");
    // alert(id);
    if(id != null){
        getArticleById(id);
    }
});


/**
 * 获取文章
 * @param id
 */
var getArticleById = function(id) {

    $.ajax({
        url:"../article/getCarArticleById",
        type: 'post',
        data: {id:id},
        dataType: 'json',
        async:false,

        error: function (obj, msg) {
            //还得先清空所有行
            $("#article_interaction").empty();
            currentPage = 0;
            pageCount = 0;
            var txt = "没有查询到符合条件的信息!";
            alert(txt);
            return;
        },
        complete: function () {

        },
        success: function (result) {
            if (result.success == true) {
                if (result.error != "") {
                    alert(result.error);
                    //清空已有记录
                    $("#article_interaction").empty();
                    return;
                }
                if (result.data != null) {
                    console.log(result.data);

                    //清空已有记录
                    $("#article_interaction").empty();

                    $.each(result.data, function (objIndex, carArticle) {
                        var html_tr = appendCarArticleNodeAbout(carArticle);
                        $("#article_interaction").append(html_tr);
                        var condition = {
                            articleId:carArticle.id
                        };
                        getDiscussInteraction(condition);

                    });


                } else {
                    $("#article_interaction").empty();
                    var txt = "没有查询到符合条件的信息";
                    alert(txt);
                    return;
                }
            } else {

                $("#article_interaction").empty();
                var txt = result.error;
                alert(txt);
                return;
            }

        }
    });
};

/**
 * 文章
 * @param knowledgeInteractionKnowledge
 * @returns {string}
 */
var appendCarArticleNodeAbout = function (carArticle) {
    // alert(carArticle.userName);
    var sendTime = carArticle.sendTime.substr(0,19);
    var html_main = "<hr><tr><h3>" + carArticle.userName + "&nbsp;发表于&nbsp;" + sendTime +
        "</h3><hr><div> <h3 align=\"center\">" + carArticle.articleTitle + "</h3><br><p style='margin-left: 5px'>" + carArticle.articleContent +
        "</p></div>" +
        "<button type=\"button\" class=\"btn btn-link blue discuss\" id="+carArticle.id+" onclick=\"javascript:void(0);\">评论</button>"+
        "<input type=\"hidden\" name=\"knowledge_id\" value=\""+carArticle.id+"\">"+ "</tr>"
    return html_main
};

/**
 * 获取评论
 * @param condition
 */
var getDiscussInteraction = function(condition) {

    $.ajax({
        url:"../article/getCarDiscussById",
        type: 'post',
        data: condition,
        dataType: 'json',
        async:false,
        error: function (obj, msg) {
            var txt = "没有查询到符合条件的信息!";
            alert(txt);
            return;
        },
        complete: function () {

        },
        success: function (result) {
            if (result.success == true) {
                if (result.error != "") {
                    // alertShow(result.error);
                    return;
                }
                if (result.data != null) {
                    $.each(result.data, function (objIndex, carDiscuss) {
                        // alert(carDiscuss.id);
                        // var html_tr = appendDiscussInteractionNode(carDiscuss);
                        // alert(carDiscuss.userName);
                        var html_comment =
                            "<tr><td style=\"vertical-align: top; text-align: left; \">"+carDiscuss.userName+"&nbsp; 评论于&nbsp; "+carDiscuss.createTime+
                            "</td><td style=\"vertical-align: top; text-align: right; \"><span></span></td></tr>" +
                            "<tr><td colspan=\"2\" style=\"word-break: break-all;height: 200px; vertical-align: 20px; text-align: left; padding-left: 5px; padding-top: 10px; margin-left: 5px;\">"+
                            "<span style=\"color: red;\"></span><p>"+carDiscuss.discussContent+"</p><div style=\"margin-left:3%; margin-right: 20px\" data-1=\"5482918\" id=\"reply_area\">";
                        // alert(html_comment);
                        $("#article_interaction").append(html_comment);
                        getKnowledgeInteractionReply(carDiscuss.id,carDiscuss);

                    });



                } else {
                    var txt = "没有查询到符合条件的信息";
                    // alert(txt);
                    return;
                }
            } else {
                var txt = result.error;
                // alert(txt);
                return;
            }

        }
    });
};

/**
 * 获取回复
 * @param condition
 */
var getKnowledgeInteractionReply = function(discussId,carDiscuss) {
    // alert(discussId);
    var html_reply="";
    $.ajax({
        url:"../article/getCarReplyById",
        type: 'post',
        data: {
            discussId:discussId
        },
        dataType: 'json',
        async:false,
        error: function (obj, msg) {
            currentPage = 0;
            pageCount = 0;
            var txt = "没有查询到符合条件的信息!";
            alert(txt);
            return;
        },
        complete: function () {
            var htmlAll = "</div></td></tr><tr><td colspan=\"2\" style=\" height: 22px; vertical-align: top; text-align: left; \">" +
                "<button type=\"button\" class=\"btn btn-link blue reply\" onclick=\"javascript:void(0);\" id="+carDiscuss.id+" value="+carDiscuss.userId+">回复</button>" +
                "<input type=\"hidden\" name=\"article_id\" id=articleReply'' value="+carDiscuss.articleId+">"+
                "<input type=\"hidden\" name=\"user_id\" value=\""+carDiscuss.userId+"\">"+
                "<input type=\"hidden\" name=\"discuss_id\" value=\""+carDiscuss.id+"\">"+
                "</td></tr></div>";
            $("#article_interaction").append(htmlAll);
            // alert(htmlAll);
        },
        success: function (result) {
            if (result.success == true) {

                if (result.error != "") {
                    // alertShow(result.error);
                    return;
                }
                if (result.data != null) {
                    $.each(result.data, function (objIndex, carReply) {
                        // alert(carDiscuss.articleId);
                        var   html_tr= "<div style=\"width: 100%; background-color: #F7F7F7; border: 1px #d7d7d7 dotted; margin-left:50px\"> <div style=\"text-align: left; padding-top: 5px; padding-left: 5px; \">"+
                            "<div style=\"font-size:13px \"> <p>"+carReply.userName+" &nbsp;回复&nbsp; "+carReply.replyUserName+"</p>"+carReply.replyContent+"</div><div style=\"font-size:14px\">"+carReply.createTime+
                            "<button type=\"button\" class=\"btn btn-link blue reply\" onclick=\"javascript:void(0);\" value= "+carReply.userId+" id="+carReply.discussId+">回复</button>"+
                            "<input type=\"hidden\" name=\"article_id\" id='articleReply' value="+carDiscuss.articleId+">"+
                            "<input type=\"hidden\" name=\"replyUser_id\" value=\""+carReply.replyUserId+"\">"+
                            "<input type=\"hidden\" name=\"reply_id\" value=\""+carReply.id+"\">"+
                            "<div style=\"float:right;\"></div></div></div></div>";
                        // var html_tr = appendDiscussInteractionReplyNode(carReply);
                        html_reply=html_tr;
                        // alert(html_reply);
                        $("#article_interaction").append(html_reply);
                    });

                } else {
                    var txt = "没有查询到符合条件的信息";
                    // alert(txt);
                    return;
                }
            } else {

                var txt = result.error;
                return;
            }

        }
    });
};

/**
 * 回复和评论
 * @type {null}
 */
$("body").on('click','.reply',function (e) {
    $("#btn_edit").empty();
    var discussId = $(this).attr("id");
    var replyUserId = $(this).val();
    var articleId = $("#articleReply").val();

    $("#title_edit").html("回复");
    var html_reply = "<button type='button' class='btn border btn_blue reply_sure'>确认</button>"+
        "<button type='button' class='btn border btn_gray reply_cancel'>取消</button>"+
        "<input hidden='hidden' id='discuss_id' value="+discussId+">"+
        "<input hidden='hidden' id='article_id' value="+articleId+">"+
        "<input hidden='hidden' id='replyUser_id' value="+replyUserId+">";
    $("#btn_edit").append(html_reply);
    // alert(html_reply);

    e.preventDefault();
    $("#edit_text").reveal($(this).data());
});
$("body").on('click','.reply_sure',function () {
    var discussId = $("#discuss_id").val();
    var replyUserId = $("#replyUser_id").val();
    var replyContent = editor.$txt.html();
    var articleId = $("#article_id").val();
    // alert(discussId+","+replyContent+","+replyUserId+","+articleId);
    if(isNullOfeditor(replyContent)){
        alert("回复内容不能全部为空，请重新输入")
    }else {
        var condition = {
            discussId:discussId,
            replyUserId:replyUserId,
            userId:1,
            replyContent:replyContent
        }
        // alert(condition);
        addKnowledgeCommentAndReply(condition,2,articleId)
    }
});
$("body").on('click','.reply_cancel',function () {
    $(".reveal-modal-bg").hide();
    $("#edit_text").hide();
});
$("body").on('click','.discuss',function (e) {
    $("#btn_edit").empty();

    var articleId = $(this).attr("id");
    $("#title_edit").html("评论");
    var html_discuss = "<button type='button' class='btn border btn_blue discuss_sure'>确认</button>"+
        "<button type='button' class='btn border btn_gray discuss_cancel'>取消</button>"
        +"<input hidden='hidden' id='article_id' value="+articleId+">";
    $("#btn_edit").append(html_discuss);

    e.preventDefault();
    $("#edit_text").reveal($(this).data());
});
$("body").on('click','.discuss_sure',function () {
    var articleId = $("#article_id").val();
    var discussContent = editor.$txt.html();
    // alert(discussContent);
        var condition = {
            articleId:articleId,
            discussContent:discussContent,
            userId:1
        }
        addKnowledgeCommentAndReply(condition,1,articleId)
});
$("body").on('click','.discuss_cancel',function () {
    $(".reveal-modal-bg").hide();
    $("#edit_text").hide();
});
/**
 * 存入回复或评论
 * @param condition
 * @param knowledge_id
 */
var addKnowledgeCommentAndReply = function (condition,choose,articleId) {
    // alert(articleId);
    var url;
    if(choose == 1){
        url="../article/addCarDiscuss";
    }
    if(choose == 2){
        url="../article/addCarReply";
    }
    // alert(url);
    $.ajax({
        url:url ,
        type:'post',
        async:true,
        data : condition,
        dataType : 'json',
        error : function(obj, msg) {
            if(choose==1){
                alert("评论出现了问题");
            }
            if (choose == 2){
                alert("回复出现了问题");
            }

        },
        complete : function() {
            getArticleById(articleId);
        },
        success : function(result) {
            if(result.success==true){
                $(".reveal-modal-bg").hide();
                $("#edit_text").hide();
            }else{
                var txt = result.error;
                return;
            }

        }
    });
};

/**
 * 判断富文本编辑框输入字符串是否为空或者全部都是空格
 * @param str
 * @returns {boolean}
 */
function isNullOfeditor( str ){
    if ( str == "<p><br></p>" ){
        return true;
    }
    var regu = "<p>[&nbsp; ]+</p>";
    var re = new RegExp(regu);
    return re.test(str);
}

