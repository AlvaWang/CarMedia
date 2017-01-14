/**
 * Created by Administrator on 2017/1/14.
 */
$("#btn_register_sure").click(function () {
    var userName = $("#user_name").val();
    var condition1 = {
        userName:userName
    }
    loginIndex(condition1,1)
    var userAccount = $("#user_account").val();
    var condition2 = {
        userAccount:userAccount
    }
    loginIndex(condition2,2)
});
var loginIndex = function (condition,choose) {
    // alert(condition);
    $.ajax({
        url: "login/loginUser" ,
        type:'post',
        async:true,
        data : condition,
        dataType : 'json',
        error : function(obj, msg) {
            alert("服务器异常！")
        },
        success : function(result) {
            if(result.success==true){
                if(result.data!=null){
                    if (choose == 1){
                        alert("该用户昵称已存在，请更换");
                    }
                    if (choose == 2){
                        alert("该账户名已存在，请更换");
                    }

                }else {

                }
            }else{

            }

        }
    });

};