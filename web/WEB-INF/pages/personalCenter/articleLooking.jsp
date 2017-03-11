<%--Created by IntelliJ IDEA.
User: Administrator
Date: 2016/12/23
Time: 14:15
To change this template use File | Settings | File Templates.
组织管理
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
    <link rel="stylesheet" href="<%=contextPath%>/resources/css/wangEditor.min.css">
    <%--<script src="http://www.jq22.com/jquery/jquery-1.6.2.js"></script>--%>
    <style type="text/css" rel="stylesheet">
        .td_width{
            vertical-align: middle!important;
        }
        .dropdown_type{
            right: inherit!important;
            top:60px;
            width: 100px!important;
            background: gainsboro;
            height: auto;
            min-height: 120px;
        }
        .type_sure{
            margin: 10px auto;
        }
        .type_div input{
            margin-left: 10px;
        }
    </style>
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
                组织管理
                <%--<small>advanced tables</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">系统管理</a></li>
                <li class="active">组织管理</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <!-- /.box-header -->
                        <table class="table  margin-bottom-5 col-md-12" style="overflow-wrap:break-word;table-layout:auto">

                            <tbody id="article_interaction">

                            </tbody>
                        </table>
                        <!-- /.box-body -->
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


</div>

<div class="reveal-modal" id="edit_text" style="z-index: 1500">
    <h5 id="title_edit"></h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
    <div class="popcon" id="edit_button">
        <div class="">
            <textarea  id="reply_area" name="reply_area" style="height:100px;max-height:100px;">
                 <p></p>
            </textarea>
        </div>
        <div class="btn_middle" style="margin-top: 10px;" id="btn_edit">
            <%--<button type="button" class="btn border btn_blue" id="reply_sure">确认</button>--%>
            <%--<button type="button" class="btn border btn_gray" id="reply_cancel">取消</button>--%>
        </div>
    </div>
    <a class="close-reveal-modal">&#215;</a>
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
<!-- page script -->
<%--分页--%>
<script src="<%=contextPath%>/resources/common/js/pagination.js"></script>
<%--<script src="<%=contextPath%>/resources/js/systemManage/org_ztree.js"></script>--%>
<script src="<%=contextPath%>/resources/js/personalCenter/articleLooking.js"></script>
<%--<script src="<%=contextPath%>/resources/js/personalCenter/articleAdd.js"></script>--%>
<script type="text/javascript" src="<%=contextPath%>/resources/common/js/jquery.reveal.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/js/personalCenter/wangEditor.min.js"></script>

<script src="<%=contextPath%>/resources/common/js/header.js"></script>
<script src="<%=contextPath%>/resources/common/js/leftMenu.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('reply_area');

    editor.config.menus = [
        '|',
        'bold',
        'underline',
        'italic',
        'strikethrough',
        'eraser',
        'forecolor',
        'bgcolor',
        'quote',
        'fontfamily',
        'fontsize',
        'head',
        'alignleft',
        'aligncenter',
        'alignright',
        'link',
        'unlink',
        'emotion',
        'img',
        'undo',
        'redo',
        'fullscreen'
    ];
    editor.create();

</script>
</body>
</html>
