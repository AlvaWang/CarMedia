/**
 * Created by Administrator on 2017/3/11.
 */
$(function(){
    var name = $.query.get("name");
    $("#account_email").html(name);

    var userAccount = $("#account_email").html();
    // alert(name);
    getSysUser(userAccount);
});

var getSysUser = function (condition) {
    // alert(condition);
    $.ajax({
        url: "../sysUser/getSysUserByAccount?userAccount="+condition+"" ,
        type:"post",
        async:true,
        data : condition,
        dataType : 'json',
        error : function(obj, msg) {
            alert("服务器异常！")
        },
        success : function(result) {
            if(result.success==true){
                if(result.data!=null){
                    var name = condition.userAccount;

                }else {
                    alert("登录失败，请检查原因")
                    window.location.href="";
                }
            }else{

            }

        }
    });
}