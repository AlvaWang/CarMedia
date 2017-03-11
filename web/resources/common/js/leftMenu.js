/**
 * Created by Administrator on 2017/3/11.
 */
$(function(){
    var name = $.query.get("name");
    $("#user_Account").html(name);

    var userAccount = $("#account_email").html();
    // alert(name);
    // getSysUser(userAccount);
});