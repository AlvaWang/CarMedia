//知识录入Js
$(function () {
    $("#addArticle").click(function () {

        var KnowledgeName=$("#KnowledgeName").val().trim();
        var kind=$("#select_knowledgeKind").val().trim();
        var text=$("#knowledgeText").val().trim();
        if(isNull(KnowledgeName)){
            alertShow("请输入知识标题!");
            return;
        }
        if(isNull(kind)){
            alertShow("请选择分类!");
            return;
        }

        if(isNullOfeditor(text)){
            alertShow("请输入内容!");
            return;
        }

        var condition = {
            title:KnowledgeName
        };

        condition = JSON.stringify(condition);
        if(checkKnowledge(condition)==false){
            if(getKnowledge() != null){
                addKnow(JSON.stringify(getKnowledge()));
                var data = {
                    integration:"1"
                };
                data = JSON.stringify(data);
                addIntegration(data);
            }
        };

    })
});

/**
 * 增加知识校验
 */
var checkKnowledge = function (condition) {
    var flag = false;
    $.ajax({
        url:"../know/checkKnowledge",
        type : 'post',
        data : {
            param:condition
        },
        dataType : 'json',
        async:false,
        error : function(obj, msg) {
            var txt = "error校验失败";
            alertShow(txt);
            return;
        },
        complete : function() {

        },
        success : function(result) {
            if(result.success==true){
                if(result.data != null){
                    alertShow("该知识名已存在！请重新输入名字！");
                    flag=true;
                }

            } else{
                alertShow(result.error);
            }
        }
    });
    return flag;
};
/**
 * 获取知识录入信息
 * @returns {{}}
 */
function getKnowledge() {
    var newKnowledgeOtherName=new Array();
    var newKnowledgeOtherContent=new Array();

    $("input[id='KnowledgeOtherName']").each(function(){
        if(null != $(this).val() || "" !=$(this).val()){
            newKnowledgeOtherName.push($(this).val().trim());
        }
    });
    $("input[id='KnowledgeOtherContent']").each(function(){

        if(null != $(this).val() || "" !=$(this).val()) {
            newKnowledgeOtherContent.push($(this).val().trim());
        }

    });

    for(var i=0;i<newKnowledgeOtherName.length;i++){
        if(isNull(newKnowledgeOtherName[i])){
            alertShow("请输入全部字段")
            return;
        }
    }
    for(var i=0;i<newKnowledgeOtherContent.length;i++){
        if(isNull(newKnowledgeOtherContent[i])){
            alertShow("请输入全部字段")
            return;
        }
    }

    var KnowledgeName=$("#KnowledgeName").val();
    // var KnowledgeUser=$("#KnowledgeUser").val();
    var kind=$("#select_knowledgeKind").val();
    var text=$("#knowledgeText").val();

    var json={};
    json.KnowledgeOtherName=newKnowledgeOtherName;
    json.KnowledgeOtherContent=newKnowledgeOtherContent;
    json.KnowledgeName=KnowledgeName;
    // json.KnowledgeUser=KnowledgeUser;
    json.kind=kind;
    json.KnowledgeText=text;
    console.log(json)
    return json;
}

function addKnow(data) {
    $.ajax({
        url: "../know/addKnowledge",
        type : 'post',
        data : {
            json:data
        },
        async: true,
        dataType : 'json',
        error : function(obj, msg) {
            $("#knowledgeOther").empty();
            var txt = "添加失败";
            alertShow(txt);
            return;
        },
        complete : function() {
            var condition = {
                offset: currentPage*pageSize,
                limit: pageSize
            };
            condition=JSON.stringify(condition);
            getKnowledgeByCondition(condition);
            knowledgeOtherCount=5;
        },
        success : function(result) {
            $("#knowledgeOther").empty();
            if(result.success==true){
                if(result.error=="知识添加成功"){
                    alertShow(result.error);
                    $("#knowTable tr td input[type=text]").val('')
                    editor.$txt.html('<p><br></p>');
                }else{
                    alertShow(result.error);
                }

            }
            else{
               alertShow(result.error);
            }
        }
    });
}

var addIntegration =function (data) {
    $.ajax({
        url: "../integrationManage/updateIntegration",
        type : 'post',
        data : {
            param:data
        },
        async: true,
        dataType : 'json',
        error : function(obj, msg) {
            return;
        },
        complete : function() {

        },
        success : function(result) {
                console.log(result)

        }
    });
};
/**
 * 判断输入字符串是否为空或者全部都是空格
 * @param str
 * @returns {boolean}
 */
function isNull( str ){
    if ( str == "" ){
        return true;
    }
    var regu = "^[ ]+$";
    var re = new RegExp(regu);
    return re.test(str);
}

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