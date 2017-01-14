//预案编制及管理
var modheight = $("#modify").height();
var deheight = $("#delete").height();
var seeheight = $("#see").height();
var relheight = $("#release").height();
var recheight = $("#record").height();
var fileheight = $("#file").height();
var apprheight = $("#approval").height();
var recordheight = $("#apprecord").height();
var optionsH = $("#options").height();
var drawnH = $("#drawn").height();
var feedH = $("#feedback").height();
var popintoH = $(".popinto").height();
var addIntegrationHeight = $("#addIntegration").height();
var popshow = function(){
    $(".pop").show();
}

var showPopLevel2 = function(){
    $(".popLevel2").show();
}

var modify = function (obj) {
    popshow();
    $("#modify").css({
        'marginTop':-modheight/2,
    })
    $("#modify").show();
    
}
var impContact = function (obj) {
    popshow();
    $("#impContact").css({
        'marginTop':-modheight/2,
    })
    $("#impContact").show();

}
var delete_ = function (obj) {
    popshow();
    $("#delete").css({
        'marginTop':-deheight/2,
    })
    $("#delete").show();
    
};
var delete_2 = function (obj) {
    popshow();
    $("#delete2").css({
        'marginTop':-deheight/2,
    })
    $("#delete2").show();

};
var see = function (obj) {
    popshow();
    $("#see").css({
        'marginTop':-200,
    })
    $("#see").show();
    
};
var scrollSee = function (obj) {
    popshow();
    $("#see").show();

};
var file = function (obj) {
    popshow();
    $("#file").css({
        'marginTop':-fileheight/2,
    })
    $("#file").show();
    
}
var more_option = function(){
    popshow();
    $("#options").css({
        'marginTop':-optionsH/2,
    })
    $("#options").show();
}
var closepop= function(){
    $("#pop1").hide();
    $(".pop").hide();
    $(".popinto").hide();
    $(".popinto0").hide();
    $(".PopTips").hide();
}
var closepop1= function(){
    $(".pop1").hide();
    $(".pop").hide();
    $(".popinto1").hide();
    $(".PopTips").hide();
}
var closepopSmall= function(){
    $(".pop").hide();
    $(".popinto").hide();
    $(".popintoSmall").hide();
    $(".PopTips").hide();
};
var closepopTree= function(){
    $(".popintoSmall").hide();
    $(".pop").hide();
};

var closePopLevel2= function(){
    $(".popLevel2").hide();
    $(".popintoLevel2").hide();
    $(".PopTips").hide();
};

var closepopTree1= function(){
    $(".popintoSmall").hide();
};

var closepopDoc= function(){
    $(".popLevel2").hide();
    $(".popintoSmall").hide();
    // $(".PopTips").hide();
};

var closepopOrg= function(){
    $(".popintoSmall").hide();
    $(".PopTips").hide();
};

//应急预案评审

var approval = function (obj) {
    popshow();
    $("#approval").css({
        'marginTop':-apprheight/2,
    })
    $("#approval").show(); 
}
var appr_record = function (obj) {
    popshow();
    $("#apprecord").css({
        'marginTop':-recordheight/2,
    })
    $("#apprecord").show(); 
}
var concluded = function(obj){
    popshow();
    $("#drawn").css({
        'marginTop':-drawnH/2,
    })
    $("#drawn").show(); 
}
var feedback = function () {
    popshow();
    $("#feedback").css({
        'marginTop':-feedH/2,
    })
    $("#feedback").show(); 
}
//地市子系统
var stepResult = function(){
    popshow();
    $("#stepResult").css({
        'marginTop':-$("#stepResult").height()/2,
    })
    $("#stepResult").show();
};

var receipt = function(){
    popshow();
    $("#receipt").css({
        'marginTop':-$("#receipt").height()/2,
    })
    $("#receipt").show();
};
var nuclear_draft = function(){
    popshow();
    $("#nuclear_draft").css({
        'marginTop':-popintoH/2,
    })
    $("#nuclear_draft").show();
}
var sign =  function(){
    popshow();
    $("#sign").css({
        'marginTop':-popintoH/2,
    })
    $("#sign").show();
}
var proposed = function(){
    popshow();
    $("#proposed").css({
        'marginTop':-$("#proposed").height()/2,
    })
    $("#proposed").show();
}
var read = function(){
    popshow();
    $("#read").css({
        'marginTop':-$("#read").height()/2,
    })
    $("#read").show(); 
}
var office = function(){
    popshow();
    $("#office").css({
        'marginTop':-$("#office").height()/2,
    })
    $("#office").show();    
}
var undertook = function(){
    popshow();
    $("#undertook").css({
        'marginTop':-$("#undertook").height()/2,
    })
    $("#undertook").show();    
}

var file_ = function(){
    popshow();
    $("#filed").css({
        'marginTop':-$("#filed").height()/2,
    })
    $("#filed").show();    
}

var reminders = function(){
    popshow();
    $("#reminders").css({
        'marginTop':-$("#reminders").height()/2,
    })
    $("#reminders").show();    
}

var made = function(){
    popshow();
    $("#made").css({
        'marginTop':-$("#made").height()/2,
    })
    $("#made").show();    
}

var add_gisicon = function(){
    popshow();
    $("#add_gisicon").css({
        'marginTop':-$("#add_gisicon").height()/2,
    })
    $("#add_gisicon").show();     
}

var edit_gis = function(){
    popshow();
    $("#edit_gis").css({
        'marginTop':-$("#edit_gis").height()/2,
    })
    $("#edit_gis").show();     
}

var add_manage = function(){
    $(".add_manage").show(50);     
}

var add_store = function(){
    $(".add_store").show(50);
}

var add_sys_static = function(){
    $(".add_sys_static").show(50);
}

var add_bus_static = function(){
    $(".add_bus_static").show(50);
}

var cancle = function(obj){
    $(obj).parents("form").hide();
}

var see_attendance = function(){
    popshow();
    $("#see_attendance").css({
        'marginTop':-$("#see_attendance").height()/2,
    })
    $("#see_attendance").show();
}

var addIntegration = function(){
    popshow();
    $("#addIntegration").css({
        'marginTop':-addIntegrationHeight/2,
    })
    $("#addIntegration").show();
}

var add_step = function(obj){
    // $("<tr> <td class='colorsix'>步&nbsp;骤&nbsp;二</td>\
    // <td class='colorsix'><input type='text' placeholder='请输入第二步骤'/></td>\
    // <td class='colorsix'>\
    //     <select>\
    //         <option>请选择相关执行部门</option>\
    //         <option>应急执行部门</option>\
    //     </select>\
    // </td>\
    // <td class='colorsix'><button type='button' class='btn btn-link orange' onclick='add_step(this)'>添加步骤</button></td></tr>").appendTo("tbody");
    $(obj).parents("tr").after("<tr> <td class='colorsix'>步&nbsp;骤&nbsp;二</td>\
    <td class='colorsix'><input type='text' placeholder='请输入第二步骤'/></td>\
    <td class='colorsix'>\
        <select>\
            <option>请选择相关执行部门</option>\
            <option>应急执行部门</option>\
        </select>\
    </td>\
    <td class='colorsix'><button type='button' class='btn btn-link orange' onclick='add_step(this)'>添加步骤</button></td></tr>");
}
var reset_passsword = function(){
    popshow();
    $("#reset_pw").css({
        'marginTop':-$("#reset_pw").height()/2,
    })
    $("#reset_pw").show();     
}
//alert信息显示
var alertShow=function (txt) {
    $("#alertText").html(txt);
    $("#ModalDiv").modal("show");
}
//关闭alert显示层
var closeAlert=function(){
    $("#ModalDiv").modal("hide");
}
//create by brianray on 2016/10/26
/**
 * 获取url传递的参数
 * @param paras 参数名
 * @returns {*}
 */
function getUrlParam(paras) {
    var url = location.href;
    var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
    var paraObj = {}
    for (i = 0; j = paraString[i]; i++) {
        paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
    }
    var returnValue = paraObj[paras.toLowerCase()];
    if (typeof (returnValue) == "undefined") {
        return "";
    } else {
        //t=new String(returnValue.getBytes("ISO8859_1"),"UTF-8");
        //return t;
        return returnValue;
    }
}
/**
 * 将td的内容(包括td下input)赋值给其title属性。
 * 配合max样式使用
 */
function appendTabTitle() {
    $(".table tr td").each(function(){
        if ($(this).parent().attr('class') != 'last_tr' ){ //有操作按钮的一栏不添加 title 属性
            if ($(this).children("select").length <= 0 ){
                $(this).attr("title",$(this).text());
            }
        }
    });

    $(".table tr td input").each(function(){
        $(this).attr("title",$(this).val());
    });
}

/**
 * 传入要实现table的Id即可
 * @param id
 */
function appendTabTitleById(id) {
    var cellIndex = parseInt($("#"+id+".table th").length) - 1;
    $($("#"+id+".table tr td")).each(function () {
        if (this.cellIndex != cellIndex) {
            $(this).attr("title", $(this).text());
        }
    });
    $("#"+id+".table tr td input").each(function () {
        $(this).attr("title", $(this).val());
    });
}




