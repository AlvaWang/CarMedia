<%--
  Created by IntelliJ IDEA.
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
    <%--<script src="http://www.jq22.com/jquery/jquery-1.6.2.js"></script>--%>
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
                <div class="add" id="addDeptWindow" hidden>
                    <div class="add_box">
                        <div>
                            <div class="title_tab"><p>新增组织</p></div>
                            <table class="addTable">
                                <tbody>
                                <tr class="border">
                                    <td class="width1">部门名称</td><td><input type="text" class="no_border" placeholder="请输入部门名称" id="add_deptName"></td>
                                    <td class="width1">部门描述</td><td><input type="text" class="no_border"placeholder="请输入部门描述" id="add_deptDesc"></td>
                                </tr>
                                <%--<tr class="border"><td class="width1">上级部门</td><td colspan="3"><input type="text" class="no_border" placeholder="请选择上级部门" readonly id="add_deptId"></td></tr>--%>
                                </tbody>
                            </table>
                            <div class="btn_middle">
                                <button type="button" class="btn border btn_blue" id="add_dept_btn">确认</button>
                                <button type="button" class="btn border btn_gray" id="add_cancel">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header operate">
                            <div>
                                <input type="text" class="search_input border" placeholder="请输入部门名称" id="search_dept_name">
                                <input type="text" class="search_input border" placeholder="请输入上级部门" id="search_dept_up" readonly>
                                <button type="button" class="btn search_btn border" id="search_dept">搜索</button>
                            </div>
                            <div class="add_left">
                                <button type="button" class="btn add_btn border" id="add_dept">添加</button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="dept_table" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>部门名称</th>
                                    <th>上级部门</th>
                                    <th>部门描述</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <jsp:include page="../common/pagination.jsp"></jsp:include>
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

    <%--弹窗--%>
    <%--选择组织弹窗start--%>
        <div class="popinto" id="popTips_org" style="top: 20%;" rel="popover">
            <h1 class="font16">
                <span class="pull-left gray_three">选择组织</span>
                <%--<i class="fa fa-times pull-right font18" onclick="closepopSmall()"></i>--%>
            </h1>
            <form class="TipsForm" style="height: 300px;max-height: 300px;overflow: auto" id="org_select_form">
                <div>
                    <ul id="orgTree" class="ztree"></ul>
                </div>
                <p class="popcon_btn padding20">
                    <button type="button" class="btn btn-primary" id="confirm_popTips_org">确认</button>
                    <button type="button" class="btn btn-default" id="hide_popTips_org">取消</button>
                </p>
            </form>
        </div>
    <%--选择组织弹窗end--%>
        <div id="delete" class="reveal-modal border">
            <h5>删除弹窗</h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
            <%--<a class="close-reveal-modal">&#215;</a>--%>
            <div>
                <span>确定删除该条数据吗？</span>
            </div>
            <div class="btn_middle">
                <button type="button" class="btn border btn_blue" id="delete_sure">确认</button>
                <button type="button" class="btn border btn_gray" id="delete_cancel">取消</button>
            </div>
        </div>
        <%--关闭遮罩层--%>
        <div class="pop" onclick="closepop()"></div>
        <div class="popLevel2" onclick="closePopLevel2()"></div>

        <div id="modify" class="reveal-modal border">
            <h5>修改弹窗</h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
            <table class="addTable">
                <tbody>
                <tr class="border">
                    <td class="width1">部门名称</td><td><input type="text" class="no_border" placeholder="请输入部门名称" id="mod_deptName"></td>
                    <td class="width1">部门描述</td><td><input type="text" class="no_border"placeholder="请输入部门描述" id="mod_deptDesc"></td>
                </tr>
                <tr class="border"><td class="width1">上级部门</td><td colspan="3"><input type="text" class="no_border" placeholder="请选择上级部门" id="mod_deptId"></td></tr>
                </tbody>
            </table>
            <div class="btn_middle">
                <button type="button" class="btn border btn_blue" id="mod_sure" value="">确认</button>
                <button type="button" class="btn border btn_gray" id="mod_cancel">取消</button>
            </div>
            <a class="close-reveal-modal">&#215;</a>
        </div>
        <div id="myModal" class="reveal-modal">

            <h1>jquery导出层</h1>

            <p>This is a default modal in all its glory, but any of the styles here can easily be changed in the CSS.</p>

            <a class="close-reveal-modal">&#215;</a>

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
<!-- page script -->
<%--分页--%>
<script src="<%=contextPath%>/resources/common/js/pagination.js"></script>
<%--<script src="<%=contextPath%>/resources/js/systemManage/org_ztree.js"></script>--%>
<script src="<%=contextPath%>/resources/common/js/header.js"></script>
<script src="<%=contextPath%>/resources/common/js/leftMenu.js"></script>
<script src="<%=contextPath%>/resources/js/systemManage/orgManagement.js"></script>
<script type="text/javascript" src="<%=contextPath%>/resources/common/js/jquery.reveal.js"></script>
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
