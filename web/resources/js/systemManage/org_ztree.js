/**
 * Created by Administrator on 2017/1/1.
 */
function addHoverDom(treeId, treeNode) {
    var sObj = $("#" + treeNode.tId + "_span");
    if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length > 0) return;
    if(treeNode.isParent==false){
        // var addStr = "<span class='button view' title='组织' id='addBtn_" + treeNode.tId + "'></span>";
        // sObj.after(addStr);
    }
    var btn = $("#addBtn_"+treeNode.tId);
    if (btn) btn.bind("click", function(){
        var zTree = $.fn.zTree.getZTreeObj("orgTree");
        return false;
    });
};
function removeHoverDom(treeId, treeNode) {
    $("#addBtn_"+treeNode.tId).unbind().remove();
    $("#removeBtn_"+treeNode.tId).unbind().remove();
    $("#editBtn_"+treeNode.tId).unbind().remove();
};

var setting = {
    check: {
        enable: true,
        chkboxType:{ "Y" : "", "N" : "s" }
    },
    view: {
        addHoverDom: addHoverDom,
        removeHoverDom: removeHoverDom,
        dblClickExpand: false,
        showLine: true,
        selectedMulti: false
    },
    data: {
        simpleData: {
            enable:true,
            idKey: "id",
            pIdKey: "pId",
            rootPId: ""
        }
    },
    callback: {
        beforeClick: function(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("orgTree");
            if (treeNode.isParent) {
                zTree.expandNode(treeNode);
                return false;
            } else {
                demoIframe.attr("src",treeNode.file + ".html");
                return true;
            }
        }
    },
    async:{
        enable:true,
        url: "../DBTree/qryOrgTreeInfo",
        autoParam: ["id"],
        dataFilter:ajaxDataFilter,
        otherParam: {"proname":""}
    }
};
var zNodes =[{id:27, pId:0, name:"功能 演示", file:"core/click"}];
$.fn.zTree.init($("#orgTree"),setting);
demoIframe = $("#testIframe");
demoIframe.bind("load", loadReady);

function loadReady() {
    var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
        htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
        maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
        h = demoIframe.height() >= maxH ? minH:maxH ;
    if (h < 530) h = 530;
    demoIframe.height(h);
}
function ajaxDataFilter(treeId, parentNode, responseData) {
    return responseData.jsonData;
};
