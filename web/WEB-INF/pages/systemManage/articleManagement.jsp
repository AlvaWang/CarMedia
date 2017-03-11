<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/23
  Time: 14:15
  To change this template use File | Settings | File Templates.
  文章管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Data Tables</title>
    <!-- Tell the browser to be responsive to screen width -->
    <%--引入公共引入文件--%>
    <jsp:include page="../common/head.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=contextPath%>/resources/common/css/reveal.css">
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
                文章管理
                <%--<small>advanced tables</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">系统管理</a></li>
                <li class="active">文章管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">文章审批</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="table_articleManage" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>文章标题</th>
                                        <th>作者</th>
                                        <th>状态</th>
                                        <th>浏览量</th>
                                        <th>评论</th>
                                        <th>创建时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <jsp:include page="../common/pagination.jsp"></jsp:include>
                    </div>
                    <!-- /.box -->
                </div>
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
        <%--弹窗--%>
        <div id="delete" class="reveal-modal border">
            <h5>删除弹窗</h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
            <%--<a class="close-reveal-modal">&#215;</a>--%>
            <div>
                <span>您确定删除这篇文章吗？删除之后无法恢复！</span>
            </div>
            <div class="btn_middle">
                <button type="button" class="btn border btn_blue" id="delete_sure">确认</button>
                <button type="button" class="btn border btn_gray" id="delete_cancel">取消</button>
            </div>
        </div>
</div>
<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="<%=contextPath%>/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="<%=contextPath%>/resources/plugins/jQuery/jquery.params.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="<%=contextPath%>/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<%=contextPath%>/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="<%=contextPath%>/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="<%=contextPath%>/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=contextPath%>/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=contextPath%>/resources/dist/js/demo.js"></script>
<script src="<%=contextPath%>/resources/common/js/header.js"></script>
<script src="<%=contextPath%>/resources/common/js/leftMenu.js"></script>
<script src="<%=contextPath%>/resources/js/systemManage/articleManage.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resources/common/js/jquery.reveal.js"></script>
<script src="<%=contextPath%>/resources/common/js/pagination.js"></script>
<!-- page script -->
<script>
    $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });
</script>
</body>
</html>
