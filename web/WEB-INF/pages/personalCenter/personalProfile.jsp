<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/23
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>个人资料</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <jsp:include page="../common/head.jsp"></jsp:include>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%--引入头部文件--%>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <%--左边栏--%>
        <jsp:include page="../common/leftMenu.jsp"></jsp:include>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                User Profile
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Examples</a></li>
                <li class="active">User profile</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-3">

                    <!-- Profile Image -->
                    <div class="box box-primary">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle" src="<%=contextPath%>/resources/dist/img/user4-128x128.jpg" alt="User profile picture">

                            <h3 class="profile-username text-center" id="account_name">王潘</h3>

                            <p class="text-muted text-center" id="account_email">252782825@qq.com</p>

                            <ul class="list-group list-group-unbordered">
                                <li class="list-group-item">
                                    <b>文章</b> <a class="pull-right" id="article_click">浏览量</a>
                                </li>
                                <li class="list-group-item">
                                    <b>原创</b> <a class="pull-right" id="original_num">数量</a>
                                </li>
                                <li class="list-group-item">
                                    <b>转载</b> <a class="pull-right" id="turn_num">数量</a>
                                </li>
                            </ul>

                            <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <!-- About Me Box -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">About Me</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <strong><i class="fa fa-book margin-r-5"></i> Education</strong>

                            <p class="text-muted">
                                B.S. in Computer Science from the University of Tennessee at Knoxville
                            </p>

                            <hr>

                            <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

                            <p class="text-muted">Malibu, California</p>

                            <hr>

                            <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

                            <p>
                                <span class="label label-danger">UI Design</span>
                                <span class="label label-success">Coding</span>
                                <span class="label label-info">Javascript</span>
                                <span class="label label-warning">PHP</span>
                                <span class="label label-primary">Node.js</span>
                            </p>

                            <hr>

                            <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam fermentum enim neque.</p>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col -->
                <div class="col-md-9">
                    <h1>设置（注：*号项为不可修改项）</h1>
                    <div>
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label" id="user_name">昵称</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputName" placeholder="Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputEmail" class="col-sm-2 control-label" id="user_email">邮箱（*）</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputEmail" placeholder="Email">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputName" class="col-sm-2 control-label" id="real_name">姓名</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="input_name" placeholder="Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputSkills" class="col-sm-2 control-label" id="dept_name">职位（*）</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="inputSkills" placeholder="职位（*）">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputExperience" class="col-sm-2 control-label" id="dept_describe">管理权限</label>

                                <div class="col-sm-10">
                                    <textarea class="form-control" id="inputExperience" placeholder="管理权限"></textarea>
                                </div>
                            </div>

                            <%--<div class="form-group">--%>
                                <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                    <%--<div class="checkbox">--%>
                                        <%--<label>--%>
                                            <%--<input type="checkbox"> I agree to the <a href="#">terms and conditions</a>--%>
                                        <%--</label>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="button" class="btn btn-danger" id="personal_submit">提交</button>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <%--<div class="col-md-9">--%>
                    <%--<div class="nav-tabs-custom">--%>
                        <%--<ul class="nav nav-tabs">--%>
                            <%--<li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>--%>
                            <%--<li><a href="#timeline" data-toggle="tab">Timeline</a></li>--%>
                            <%--<li><a href="#settings" data-toggle="tab">Settings</a></li>--%>
                        <%--</ul>--%>
                        <%--<div class="tab-content">--%>
                            <%--<div class="active tab-pane" id="activity">--%>
                                <%--<!-- Post -->--%>
                                <%--<div class="post">--%>
                                    <%--<div class="user-block">--%>
                                        <%--<img class="img-circle img-bordered-sm" src="<%=contextPath%>/resources/dist/img/user1-128x128.jpg" alt="user image">--%>
                                        <%--<span class="username">--%>
                          <%--<a href="#">Jonathan Burke Jr.</a>--%>
                          <%--<a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>--%>
                        <%--</span>--%>
                                        <%--<span class="description">Shared publicly - 7:30 PM today</span>--%>
                                    <%--</div>--%>
                                    <%--<!-- /.user-block -->--%>
                                    <%--<p>--%>
                                        <%--Lorem ipsum represents a long-held tradition for designers,--%>
                                        <%--typographers and the like. Some people hate it and argue for--%>
                                        <%--its demise, but others ignore the hate as they create awesome--%>
                                        <%--tools to help create filler text for everyone from bacon lovers--%>
                                        <%--to Charlie Sheen fans.--%>
                                    <%--</p>--%>
                                    <%--<ul class="list-inline">--%>
                                        <%--<li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>--%>
                                        <%--<li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>--%>
                                        <%--</li>--%>
                                        <%--<li class="pull-right">--%>
                                            <%--<a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments--%>
                                                <%--(5)</a></li>--%>
                                    <%--</ul>--%>

                                    <%--<input class="form-control input-sm" type="text" placeholder="Type a comment">--%>
                                <%--</div>--%>
                                <%--<!-- /.post -->--%>

                                <%--<!-- Post -->--%>
                                <%--<div class="post clearfix">--%>
                                    <%--<div class="user-block">--%>
                                        <%--<img class="img-circle img-bordered-sm" src="<%=contextPath%>/resources/dist/img/user7-128x128.jpg" alt="User Image">--%>
                                        <%--<span class="username">--%>
                          <%--<a href="#">Sarah Ross</a>--%>
                          <%--<a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>--%>
                        <%--</span>--%>
                                        <%--<span class="description">Sent you a message - 3 days ago</span>--%>
                                    <%--</div>--%>
                                    <%--<!-- /.user-block -->--%>
                                    <%--<p>--%>
                                        <%--Lorem ipsum represents a long-held tradition for designers,--%>
                                        <%--typographers and the like. Some people hate it and argue for--%>
                                        <%--its demise, but others ignore the hate as they create awesome--%>
                                        <%--tools to help create filler text for everyone from bacon lovers--%>
                                        <%--to Charlie Sheen fans.--%>
                                    <%--</p>--%>

                                    <%--<form class="form-horizontal">--%>
                                        <%--<div class="form-group margin-bottom-none">--%>
                                            <%--<div class="col-sm-9">--%>
                                                <%--<input class="form-control input-sm" placeholder="Response">--%>
                                            <%--</div>--%>
                                            <%--<div class="col-sm-3">--%>
                                                <%--<button type="submit" class="btn btn-danger pull-right btn-block btn-sm">Send</button>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</form>--%>
                                <%--</div>--%>
                                <%--<!-- /.post -->--%>

                                <%--<!-- Post -->--%>
                                <%--<div class="post">--%>
                                    <%--<div class="user-block">--%>
                                        <%--<img class="img-circle img-bordered-sm" src="<%=contextPath%>/resources/dist/img/user6-128x128.jpg" alt="User Image">--%>
                                        <%--<span class="username">--%>
                          <%--<a href="#">Adam Jones</a>--%>
                          <%--<a href="#" class="pull-right btn-box-tool"><i class="fa fa-times"></i></a>--%>
                        <%--</span>--%>
                                        <%--<span class="description">Posted 5 photos - 5 days ago</span>--%>
                                    <%--</div>--%>
                                    <%--<!-- /.user-block -->--%>
                                    <%--<div class="row margin-bottom">--%>
                                        <%--<div class="col-sm-6">--%>
                                            <%--<img class="img-responsive" src="<%=contextPath%>/resources/dist/img/photo1.png" alt="Photo">--%>
                                        <%--</div>--%>
                                        <%--<!-- /.col -->--%>
                                        <%--<div class="col-sm-6">--%>
                                            <%--<div class="row">--%>
                                                <%--<div class="col-sm-6">--%>
                                                    <%--<img class="img-responsive" src="<%=contextPath%>/resources/dist/img/photo2.png" alt="Photo">--%>
                                                    <%--<br>--%>
                                                    <%--<img class="img-responsive" src="<%=contextPath%>/resources/dist/img/photo3.jpg" alt="Photo">--%>
                                                <%--</div>--%>
                                                <%--<!-- /.col -->--%>
                                                <%--<div class="col-sm-6">--%>
                                                    <%--<img class="img-responsive" src="<%=contextPath%>/resources/dist/img/photo4.jpg" alt="Photo">--%>
                                                    <%--<br>--%>
                                                    <%--<img class="img-responsive" src="<%=contextPath%>/resources/dist/img/photo1.png" alt="Photo">--%>
                                                <%--</div>--%>
                                                <%--<!-- /.col -->--%>
                                            <%--</div>--%>
                                            <%--<!-- /.row -->--%>
                                        <%--</div>--%>
                                        <%--<!-- /.col -->--%>
                                    <%--</div>--%>
                                    <%--<!-- /.row -->--%>

                                    <%--<ul class="list-inline">--%>
                                        <%--<li><a href="#" class="link-black text-sm"><i class="fa fa-share margin-r-5"></i> Share</a></li>--%>
                                        <%--<li><a href="#" class="link-black text-sm"><i class="fa fa-thumbs-o-up margin-r-5"></i> Like</a>--%>
                                        <%--</li>--%>
                                        <%--<li class="pull-right">--%>
                                            <%--<a href="#" class="link-black text-sm"><i class="fa fa-comments-o margin-r-5"></i> Comments--%>
                                                <%--(5)</a></li>--%>
                                    <%--</ul>--%>

                                    <%--<input class="form-control input-sm" type="text" placeholder="Type a comment">--%>
                                <%--</div>--%>
                                <%--<!-- /.post -->--%>
                            <%--</div>--%>
                            <%--<!-- /.tab-pane -->--%>
                            <%--<div class="tab-pane" id="timeline">--%>
                                <%--<!-- The timeline -->--%>
                                <%--<ul class="timeline timeline-inverse">--%>
                                    <%--<!-- timeline time label -->--%>
                                    <%--<li class="time-label">--%>
                        <%--<span class="bg-red">--%>
                          <%--10 Feb. 2014--%>
                        <%--</span>--%>
                                    <%--</li>--%>
                                    <%--<!-- /.timeline-label -->--%>
                                    <%--<!-- timeline item -->--%>
                                    <%--<li>--%>
                                        <%--<i class="fa fa-envelope bg-blue"></i>--%>

                                        <%--<div class="timeline-item">--%>
                                            <%--<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>--%>

                                            <%--<h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>--%>

                                            <%--<div class="timeline-body">--%>
                                                <%--Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,--%>
                                                <%--weebly ning heekya handango imeem plugg dopplr jibjab, movity--%>
                                                <%--jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle--%>
                                                <%--quora plaxo ideeli hulu weebly balihoo...--%>
                                            <%--</div>--%>
                                            <%--<div class="timeline-footer">--%>
                                                <%--<a class="btn btn-primary btn-xs">Read more</a>--%>
                                                <%--<a class="btn btn-danger btn-xs">Delete</a>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                    <%--<!-- END timeline item -->--%>
                                    <%--<!-- timeline item -->--%>
                                    <%--<li>--%>
                                        <%--<i class="fa fa-user bg-aqua"></i>--%>

                                        <%--<div class="timeline-item">--%>
                                            <%--<span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>--%>

                                            <%--<h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request--%>
                                            <%--</h3>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                    <%--<!-- END timeline item -->--%>
                                    <%--<!-- timeline item -->--%>
                                    <%--<li>--%>
                                        <%--<i class="fa fa-comments bg-yellow"></i>--%>

                                        <%--<div class="timeline-item">--%>
                                            <%--<span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>--%>

                                            <%--<h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>--%>

                                            <%--<div class="timeline-body">--%>
                                                <%--Take me to your leader!--%>
                                                <%--Switzerland is small and neutral!--%>
                                                <%--We are more like Germany, ambitious and misunderstood!--%>
                                            <%--</div>--%>
                                            <%--<div class="timeline-footer">--%>
                                                <%--<a class="btn btn-warning btn-flat btn-xs">View comment</a>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                    <%--<!-- END timeline item -->--%>
                                    <%--<!-- timeline time label -->--%>
                                    <%--<li class="time-label">--%>
                        <%--<span class="bg-green">--%>
                          <%--3 Jan. 2014--%>
                        <%--</span>--%>
                                    <%--</li>--%>
                                    <%--<!-- /.timeline-label -->--%>
                                    <%--<!-- timeline item -->--%>
                                    <%--<li>--%>
                                        <%--<i class="fa fa-camera bg-purple"></i>--%>

                                        <%--<div class="timeline-item">--%>
                                            <%--<span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>--%>

                                            <%--<h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>--%>

                                            <%--<div class="timeline-body">--%>
                                                <%--<img src="http://placehold.it/150x100" alt="..." class="margin">--%>
                                                <%--<img src="http://placehold.it/150x100" alt="..." class="margin">--%>
                                                <%--<img src="http://placehold.it/150x100" alt="..." class="margin">--%>
                                                <%--<img src="http://placehold.it/150x100" alt="..." class="margin">--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                    <%--<!-- END timeline item -->--%>
                                    <%--<li>--%>
                                        <%--<i class="fa fa-clock-o bg-gray"></i>--%>
                                    <%--</li>--%>
                                <%--</ul>--%>
                            <%--</div>--%>
                            <%--<!-- /.tab-pane -->--%>

                            <%--<div class="tab-pane" id="settings">--%>
                                <%--<form class="form-horizontal">--%>
                                    <%--<div class="form-group">--%>
                                        <%--<label for="inputName" class="col-sm-2 control-label">Name</label>--%>

                                        <%--<div class="col-sm-10">--%>
                                            <%--<input type="email" class="form-control" id="inputName" placeholder="Name">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                        <%--<label for="inputEmail" class="col-sm-2 control-label">Email</label>--%>

                                        <%--<div class="col-sm-10">--%>
                                            <%--<input type="email" class="form-control" id="inputEmail" placeholder="Email">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                        <%--<label for="inputName" class="col-sm-2 control-label">Name</label>--%>

                                        <%--<div class="col-sm-10">--%>
                                            <%--<input type="text" class="form-control" id="input_name" placeholder="Name">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                        <%--<label for="inputExperience" class="col-sm-2 control-label">Experience</label>--%>

                                        <%--<div class="col-sm-10">--%>
                                            <%--<textarea class="form-control" id="inputExperience" placeholder="Experience"></textarea>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                        <%--<label for="inputSkills" class="col-sm-2 control-label">Skills</label>--%>

                                        <%--<div class="col-sm-10">--%>
                                            <%--<input type="text" class="form-control" id="inputSkills" placeholder="Skills">--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                        <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                            <%--<div class="checkbox">--%>
                                                <%--<label>--%>
                                                    <%--<input type="checkbox"> I agree to the <a href="#">terms and conditions</a>--%>
                                                <%--</label>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="form-group">--%>
                                        <%--<div class="col-sm-offset-2 col-sm-10">--%>
                                            <%--<button type="submit" class="btn btn-danger">Submit</button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</form>--%>
                            <%--</div>--%>
                            <%--<!-- /.tab-pane -->--%>
                        <%--</div>--%>
                        <%--<!-- /.tab-content -->--%>
                    <%--</div>--%>
                    <%--<!-- /.nav-tabs-custom -->--%>
                <%--</div>--%>
                <!-- /.col -->
            </div>
            <!-- /.row -->

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 2.3.8
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
        reserved.
    </footer>

    <!-- Control Sidebar -->
    <!-- /.control-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<%=contextPath%>/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=contextPath%>/resources/plugins/jQuery/jquery.params.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<%=contextPath%>/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=contextPath%>/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=contextPath%>/resources/dist/js/demo.js"></script>
<script src="<%=contextPath%>/resources/common/js/header.js"></script>
<script src="<%=contextPath%>/resources/common/js/leftMenu.js"></script>
<script src="<%=contextPath%>/resources/js/personalCenter/personalProfile.js"></script>
</body>
</html>