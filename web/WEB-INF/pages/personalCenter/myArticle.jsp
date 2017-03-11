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
                我的文章
                <%--<small>advanced tables</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">个人中心</a></li>
                <li class="active">文章管理</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <section class="mail-box-info" hidden="hidden" id="add_article_form">
                    <%--<header class="header font14 gray_three">新增文章</header>--%>
                    <section class="mail-list" style="height: auto">
                        <!--预案模版 start-->
                        <form class="form-search">
                            <table class="table table-bordered black_white" id="articleTable">

                                <tr>
                                    <th colspan="6" class="font16">新增文章</th>
                                </tr>
                                <tr>
                                    <td class="colorsix">文章标题</td>
                                    <td colspan="1" class="colorsix">
                                        <input type="hidden" name="articleId" id="articleId"/>
                                        <input type="text" class="width100" name="articleTitle" id="articleTitle"
                                               maxlength="80" placeholder="请输入知识标题"/>
                                    </td>
                                    <td class="colorsix">文章分类</td>
                                    <td colspan="1" class="colorsix">
                                        <select id="articleType">
                                            <option value="">请选择文章分类</option>
                                            <option value="美学">美学</option>
                                            <option value="设计">设计</option>
                                            <option value="随笔">随笔</option>
                                        </select>
                                    </td>
                                    <td class="colorsix">创作类型</td>
                                    <td colspan="1" class="colorsix">
                                        <select id="articleCreateType">
                                            <option value="">请选择文章创作类型</option>
                                            <option value="原创">原创</option>
                                            <option value="转载">转载</option>
                                            <option value="其他">其他</option>
                                        </select>
                                    </td>
                                </tr>

                                <tr>

                                </tr>
                                <tbody id="articleOther">

                                </tbody>
                                <tr>
                                    <td colspan="6">
                                        <textarea id="articleText" style="height:200px;max-height:500px;"><p></p></textarea>
                                    </td>
                                </tr>
                            </table>

                        </form>
                        <table class="table table-bordered black_white">
                            <tbody>
                            <tr class="last_tr">
                                <div class="btn_middle">
                                    <button type="button" class="btn border btn_blue" id="addArticle">增加</button>
                                    <button type="button" class="btn border btn_gray" id="cancelArticle">关闭</button>
                                </div>
                            </tr>
                            </tbody>
                        </table>
                        <!--预案模版 end-->
                    </section>

                </section>
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header operate">
                            <div>
                                <input type="text" class="search_input border" placeholder="请输入文章标题" id="search_article_title">
                                <select id="search_article_type">
                                    <option value="">请选择文章分类</option>
                                    <option value="美学">美学</option>
                                    <option value="设计">设计</option>
                                    <option value="随笔">随笔</option>
                                </select>
                                <select id="search_article_create_type">
                                    <option value="">请选择创作类型</option>
                                    <option value="原创">原创</option>
                                    <option value="转载">转载</option>
                                    <option value="其他">其他</option>
                                </select>
                                <button type="button" class="btn search_btn border" id="search_article">搜索</button>
                            </div>
                            <div class="add_left">
                                <button type="button" class="btn add_btn border" id="add_article">添加</button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="article_table" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <%--<th>序号</th>--%>
                                    <th>文章标题</th>
                                    <th>发送状态</th>
                                    <th>阅读量</th>
                                    <th>评论</th>
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
<script src="<%=contextPath%>/resources/js/personalCenter/myArticle.js"></script>
<%--<script src="<%=contextPath%>/resources/js/personalCenter/articleAdd.js"></script>--%>
<script type="text/javascript" src="<%=contextPath%>/resources/common/js/jquery.reveal.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/js/personalCenter/wangEditor.min.js"></script>
<script type="text/javascript">
    var editor = new wangEditor('articleText');
    editor.config.menus = $.map(wangEditor.config.menus, function (item, key) {
        if (item === 'bold' || item === 'location' || item === 'video' || item === 'insertcode' || item === 'source' || item === 'unorderlist' || item === 'orderlist') {
            return null;
        }
        return item;
    });
    editor.create();
</script>
</body>
</html>
