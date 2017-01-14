<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/23
  Time: 14:14
  To change this template use File | Settings | File Templates.
  用户管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>AdminLTE 2 | Icons</title>

    <%--引入公共引入文件--%>
    <jsp:include page="../common/head.jsp"></jsp:include>
    <link rel="stylesheet" href="<%=contextPath%>/resources/common/css/reveal.css">

    <style>
        /* FROM HTTP://WWW.GETBOOTSTRAP.COM
         * Glyphicons
         *
         * Special styles for displaying the icons and their classes in the docs.
         */

        .bs-glyphicons {
            padding-left: 0;
            padding-bottom: 1px;
            margin-bottom: 20px;
            list-style: none;
            overflow: hidden;
        }

        .bs-glyphicons li {
            float: left;
            width: 25%;
            height: 115px;
            padding: 10px;
            margin: 0 -1px -1px 0;
            font-size: 12px;
            line-height: 1.4;
            text-align: center;
            border: 1px solid #ddd;
        }

        .bs-glyphicons .glyphicon {
            margin-top: 5px;
            margin-bottom: 10px;
            font-size: 24px;
        }

        .bs-glyphicons .glyphicon-class {
            display: block;
            text-align: center;
            word-wrap: break-word; /* Help out IE10+ with class names */
        }

        .bs-glyphicons li:hover {
            background-color: rgba(86, 61, 124, .1);
        }
        .border td p{
            color: red;
        }

        @media (min-width: 768px) {
            .bs-glyphicons li {
                width: 12.5%;
            }
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
                Icons
                <small>a set of beautiful icons</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">UI</a></li>
                <li class="active">Icons</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#fa-icons" data-toggle="tab">系统用户管理</a></li>
                            <%--<li><a href="#glyphicons" data-toggle="tab">平台用户管理</a></li>--%>
                        </ul>
                        <div class="tab-content">
                            <!-- Font Awesome Icons -->
                            <div class="tab-pane active" id="fa-icons">
                                <section class="content">
                                    <div class="row">
                                        <div class="add" id="addUserWindow" hidden>
                                            <div class="add_box">
                                                <div>
                                                    <div class="title_tab"><p>新增管理人员</p></div>
                                                    <table class="addTable">
                                                        <tbody>
                                                        <tr class="border">
                                                            <td class="width1"><p>*</p>登入系统账号</td><td><input type="text" class="no_border" placeholder="请输入登入系统账号" id="add_userAcc"></td>
                                                            <td class="width1"><p>*</p>系统账号名称</td><td><input type="text" class="no_border"placeholder="请输入系统账号名称" id="add_userName"></td>
                                                            <td class="width1"><p>*</p>所属部门</td><td><input type="text" class="no_border"placeholder="请选择所属部门" id="add_deptId"></td>
                                                        </tr>
                                                        <tr class="border">
                                                            <td class="width1"><p>*</p>真实姓名</td><td><input type="text" class="no_border" placeholder="请填写真是姓名" id="add_userRealName"></td>
                                                            <td class="width1"><p>*</p>性别</td><td id="user_gender" colspan="3"><input type="radio" value="男" id="boy"><label for="boy">男士</label><input type="radio" value="女" id="girl"><label  for="girl">女士</label></td>
                                                        </tr>
                                                        <tr class="border">
                                                            <td class="width1"><p>*</p>联系电话</td><td><input type="text" class="no_border" placeholder="请填写联系电话" id="add_userPhone"></td>
                                                            <td class="width1"><p>*</p>常用邮箱</td><td><input type="text" class="no_border"placeholder="请填写常用邮箱" id="add_userEmail"></td>
                                                            <td class="width1">常用QQ</td><td><input type="text" class="no_border"placeholder="请填写常用QQ" id="add_userQQ"></td>
                                                        </tr>
                                                        <tr class="border"><td class="width1"><p>*</p>现居住地址</td><td colspan="5"><input type="text" class="no_border" placeholder="请填写现居住地址"  id="add_userAddress"></td></tr>
                                                        </tbody>
                                                    </table>
                                                    <div class="btn_middle">
                                                        <button type="button" class="btn border btn_blue" id="add_user_btn">确认</button>
                                                        <button type="button" class="btn border btn_gray" id="add_user_cancel">取消</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="box">
                                                <div class="box-header operate">
                                                    <div>
                                                        <input type="text" class="search_input border" placeholder="请输入登录账户" id="search_user_acc">
                                                        <input type="text" class="search_input border" placeholder="请输入登录账户名称" id="search_user_name">
                                                        <input type="text" class="search_input border" placeholder="请输入真实姓名" id="search_user_relName" >
                                                        <%--<input type="text" class="search_input border" placeholder="请选择搜索部门" id="search_user_dept" readonly>--%>
                                                        <button type="button" class="btn search_btn border" id="search_user">搜索</button>
                                                    </div>
                                                    <div class="add_left">
                                                        <button type="button" class="btn add_btn border" id="add_user">添加</button>
                                                    </div>
                                                </div>
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <table id="user_table" class="table table-bordered table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th>序号</th>
                                                            <th>账号</th>
                                                            <th>账号名</th>
                                                            <th>电话</th>
                                                            <th>邮箱</th>
                                                            <th>性别</th>
                                                            <th>所属组织</th>
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
                            </div>
                            <!-- /#fa-icons -->

                            <!-- glyphicons-->
                            <div class="tab-pane" id="glyphicons">
                                <section class="content">
                                    <div class="row">
                                        <div class="add" id="addAdminWindow" hidden>
                                            <div class="add_box">
                                                <div>
                                                    <div class="title_tab"><p>新增组织</p></div>
                                                    <table class="addTable">
                                                        <tbody>
                                                        <tr class="border">
                                                            <td class="width1">部门名称</td><td><input type="text" class="no_border" placeholder="请输入部门名称" id="add_adminName"></td>
                                                            <td class="width1">部门描述</td><td><input type="text" class="no_border"placeholder="请输入部门描述" id="add_adminDesc"></td>
                                                        </tr>
                                                        <%--<tr class="border"><td class="width1">上级部门</td><td colspan="3"><input type="text" class="no_border" placeholder="请选择上级部门" readonly id="add_deptId"></td></tr>--%>
                                                        </tbody>
                                                    </table>
                                                    <div class="btn_middle">
                                                        <button type="button" class="btn border btn_blue" id="add_admin_btn">确认</button>
                                                        <button type="button" class="btn border btn_gray" id="add_admin_cancel">取消</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-12">
                                            <div class="box">
                                                <div class="box-header operate">
                                                    <div>
                                                        <input type="text" class="search_input border" placeholder="请输入部门名称" id="search_admin_name">
                                                        <input type="text" class="search_input border" placeholder="请输入上级部门" id="search_admin_up" readonly>
                                                        <button type="button" class="btn search_btn border" id="search_admin">搜索</button>
                                                    </div>
                                                    <div class="add_left">
                                                        <button type="button" class="btn add_btn border" id="add_admin">添加</button>
                                                    </div>
                                                </div>
                                                <!-- /.box-header -->
                                                <div class="box-body">
                                                    <table id="admin_table" class="table table-bordered table-striped">
                                                        <thead>
                                                        <tr>
                                                            <th>序号</th>
                                                            <th>账号</th>
                                                            <th>账户名称</th>
                                                            <th>姓名</th>
                                                            <th>性别</th>
                                                            <th>联系方式</th>
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
                            </div>
                            <!-- /#ion-icons -->

                        </div>
                        <!-- /.tab-content -->
                    </div>
                    <!-- /.nav-tabs-custom -->
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


    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<%--弹窗--%>
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
<%--锁定弹窗--%>
<div id="free_sure" class="reveal-modal border">
    <h5>锁定账号弹窗</h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
    <%--<a class="close-reveal-modal">&#215;</a>--%>
    <div>
        <span>确认锁定该账户吗？</span>
    </div>
    <div class="btn_middle">
        <button type="button" class="btn border btn_blue" id="free_sure_yes">确认</button>
        <button type="button" class="btn border btn_gray" id="free_sure_cancel">取消</button>
    </div>
</div>
<%--解锁弹窗--%>
<div id="free_no" class="reveal-modal border">
    <h5>接触账户锁定弹窗</h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
    <%--<a class="close-reveal-modal">&#215;</a>--%>
    <div>
        <span>确认解除该账户锁定吗？</span>
    </div>
    <div class="btn_middle">
        <button type="button" class="btn border btn_blue" id="free_sure_no">确认</button>
        <button type="button" class="btn border btn_gray" id="free_no_cancel">取消</button>
    </div>
</div>
<%--关闭遮罩层--%>
<div class="pop" onclick="closepop()"></div>
<div class="popLevel2" onclick="closePopLevel2()"></div>

<div id="modify" class="reveal-modal border">
    <h5>修改弹窗</h5><hr style="height:1px;border:none;border-top:1px solid #555555;" />
    <table class="editTable">
        <tbody>
        <tr class="border">
            <td class="width1"><p>*</p>登入系统账号</td><td><input type="text" class="no_border"  id="edit_userAcc" readonly></td>
            <td class="width1"><p>*</p>系统账号名称</td><td><input type="text" class="no_border" id="edit_userName" readonly></td>
            <td class="width1"><p>*</p>所属部门</td><td><input type="text" class="no_border" id="edit_deptId"></td>
        </tr>
        <tr class="border">
            <td class="width1"><p>*</p>真实姓名</td><td><input type="text" class="no_border"  id="edit_userRealName" readonly></td>
            <td class="width1"><p>*</p>性别</td><td colspan="3"><input type="text" class="no_border"  id="edit_user_gender" readonly></td>
        </tr>
        <tr class="border">
            <td class="width1"><p>*</p>联系电话</td><td><input type="text" class="no_border"  id="edit_userPhone"></td>
            <td class="width1"><p>*</p>常用邮箱</td><td><input type="text" class="no_border" id="edit_userEmail"></td>
            <td class="width1">常用QQ</td><td><input type="text" class="no_border" id="edit_userQQ"></td>
        </tr>
        <tr class="border"><td class="width1"><p>*</p>现居住地址</td><td colspan="5"><input type="text" class="no_border"  readonly id="edit_userAddress"></td></tr>
        </tbody>
    </table>
    <div class="btn_middle">
        <button type="button" class="btn border btn_blue" id="mod_sure" value="">确认</button>
        <button type="button" class="btn border btn_gray" id="mod_cancel">取消</button>
    </div>
    <a class="close-reveal-modal">&#215;</a>
</div>

<!-- jQuery 2.2.3 -->
<script src="<%=contextPath%>/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=contextPath%>/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="<%=contextPath%>/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="<%=contextPath%>/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="<%=contextPath%>/resources/dist/js/demo.js"></script>
<script src="<%=contextPath%>/resources/js/systemManage/userManage.js"></script>
<%--<script src="<%=contextPath%>/resources/js/systemManage/adminManage.js"></script>--%>
<script type="text/javascript" src="<%=contextPath%>/resources/common/js/jquery.reveal.js"></script>
<script src="<%=contextPath%>/resources/common/js/pagination.js"></script>
</body>
</html>