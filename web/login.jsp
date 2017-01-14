<!--登录-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String contextPath =  request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="<%=contextPath%>/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<%=contextPath%>/resources/dist/css/AdminLTE.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<%=contextPath%>/resources/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style type="text/css" rel="stylesheet">
  </style>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="<%=contextPath%>/login/carAdmin2Massage"><b>Admin</b>LTE</a>
  </div>
  <!-- /.login-logo -->
  <%--<div class="login-box-body">--%>
    <%--<p class="login-box-msg">登录</p>--%>
    <%--&lt;%&ndash;action时login调用的方法&ndash;%&gt;--%>
    <%--<form action="<%=contextPath%>/login/loginMethod" method="post">--%>
    <%--<div class="form-group has-feedback">--%>
      <%--<input type="email" class="form-control" placeholder="Email" name="userAccount">--%>
      <%--<span class="glyphicon glyphicon-envelope form-control-feedback"></span>--%>
    <%--</div>--%>
    <%--<div class="form-group has-feedback">--%>
      <%--<input type="password" class="form-control" placeholder="Password" name="userPassword">--%>
      <%--<span class="glyphicon glyphicon-lock form-control-feedback"></span>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
      <%--&lt;%&ndash;<div class="col-xs-8">&ndash;%&gt;--%>
      <%--&lt;%&ndash;<div class="checkbox icheck">&ndash;%&gt;--%>
      <%--&lt;%&ndash;<label>&ndash;%&gt;--%>
      <%--&lt;%&ndash;<input type="checkbox"> Remember Me&ndash;%&gt;--%>
      <%--&lt;%&ndash;</label>&ndash;%&gt;--%>
      <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
      <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
      <%--<!-- /.col -->--%>
      <%--<div class="col-xs-4" style="margin: 0 30%;">--%>
        <%--<button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>--%>
      <%--</div>--%>
      <%--<div hidden>--%>
        <%--<input value="${p.free}">--%>
      <%--</div>--%>
      <%--<!-- /.col -->--%>
    <%--</div>--%>
  <%--</form>--%>
      <div class="login-box-body">
      <p class="login-box-msg">登录</p>
      <%--action时login调用的方法--%>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" id="userAccount" value="">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" id="userPassword" value="">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4" style="margin: 0 30%;">
          <button type="button" class="btn btn-primary btn-block btn-flat" id="btn_login">登录</button>
          <%--<button type="button" class="btn btn-primary btn-block btn-flat" id="btn_register">注册</button>--%>
        </div>
      <!-- /.col -->
      </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
</div>
<!-- jQuery 2.2.3 -->
<script src="<%=contextPath%>/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<%=contextPath%>/resources/plugins/iCheck/icheck.min.js"></script>
<script src="<%=contextPath%>/resources/js/userLogin/login.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });

</script>
</body>
</html>
