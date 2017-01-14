// alert("a");
$("#btn_login").click(function () {
    // alert("A");
   var userAccount = $("#userAccount").val();
   var userPassword = $("#userPassword").val();
   // alert(userAccount+","+userPassword);
   var condition = {
      userAccount:userAccount,
      userPassword:userPassword
   }
   loginIndex(condition);
   // window.location.href="personalCenter/myArticleManage";

});
var loginIndex = function (condition) {
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
               window.location.href="personalCenter/myArticleManage"
            }else {
               alert("登录失败，请检查原因")
               window.location.href="";
            }
         }else{

         }

      }
   });

};
$("#btn_register").click(function () {
   window.location.href="register.jsp"
});
