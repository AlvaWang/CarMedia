<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/12/23
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
        <div class="pull-left image">
            <img src="<%=contextPath%>/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
            <p>Alva Wang</p>
            <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
        </div>
    </div>
    <!-- search form -->
    <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
            <input type="text" name="q" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
        </div>
    </form>
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu">
        <li class="header">MAIN NAVIGATION</li>
        <li class="active treeview">
            <a href="<%=contextPath%>/login/carAdminMassage">
                <%--<i class="fa fa-home"></i> <span>首页</span>--%>
                <%--<span class="pull-right-container">--%>
            <%--</span>--%>
            </a>
        </li>
        <%--系统管理--%>
        <li class="treeview">
            <a href="#">
            <i class="fa fa-user "></i>
            <span>系统管理</span>
            <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
            </span>
            </a>
            <ul class="treeview-menu">
                <li><a href="<%=contextPath%>/system/articleManage"><i class="fa fa-circle-o"></i> 文章管理</a></li>
                <li><a href="<%=contextPath%>/system/userManage"><i class="fa fa-circle-o"></i> 用户管理</a></li>
                <li><a href="<%=contextPath%>/system/orgManage"><i class="fa fa-circle-o"></i> 组织管理</a></li>
                <%--<li><a href="<%=contextPath%>/system/notificationManage"><i class="fa fa-circle-o"></i> 通知管理</a></li>--%>
                <%--<li><a href="<%=contextPath%>/system/guessCompetitionManage"><i class="fa fa-circle-o"></i> 竞猜管理</a></li>--%>
            </ul>
        </li>
        <%--个人管理--%>
        <li class="treeview">
            <a href="#">
                <i class="fa fa-credit-card"></i>
                <span>个人管理</span>
                <span class="pull-right-container">
                    <i class="fa fa-angle-left pull-right"></i>
                </span>
            </a>
            <ul class="treeview-menu">
                <li><a href="<%=contextPath%>/personalCenter/personalProfileManage"><i class="fa fa-circle-o"></i> 个人中心</a></li>
                <li><a href="<%=contextPath%>/personalCenter/myArticleManage"><i class="fa fa-circle-o"></i> 我的文章</a></li>
                <%--<li><a href="<%=contextPath%>/personalCenter/guessingCompetition"><i class="fa fa-circle-o"></i> 竞猜</a></li>--%>
                <%--<li><a href="<%=contextPath%>/personalCenter/mailbox/noticeManage"><i class="fa fa-circle-o"></i> 通知</a></li>--%>
            </ul>
        </li>
        <%--邮箱--%>
        <%--<li>--%>
            <%--<a href="<%=contextPath%>/personalCenter/mailbox/mailboxManage">--%>
                <%--<i class="fa fa-envelope"></i> <span>Mailbox</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<small class="label pull-right bg-yellow">12</small>--%>
              <%--<small class="label pull-right bg-green">16</small>--%>
              <%--<small class="label pull-right bg-red">5</small>--%>
            <%--</span>--%>
            <%--</a>--%>
        <%--</li>--%>

        <%--layout options布局--%>
        <%--<li class="treeview">--%>
        <%--<a href="#">--%>
        <%--<i class="fa fa-files-o"></i>--%>
        <%--<span>Layout Options</span>--%>
        <%--<span class="pull-right-container">--%>
        <%--<span class="label label-primary pull-right">4</span>--%>
        <%--</span>--%>
        <%--</a>--%>
        <%--<ul class="treeview-menu">--%>
        <%--<li><a href="../layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li>--%>
        <%--<li><a href="../layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>--%>
        <%--<li><a href="../layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>--%>
        <%--<li><a href="../layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>--%>
        <%--</ul>--%>
        <%--</li>--%>
        <%--<li>--%>
            <%--<a href="../schedule/widgets.html">--%>
                <%--<i class="fa fa-th"></i> <span>Widgets</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<small class="label pull-right bg-green">new</small>--%>
            <%--</span>--%>
            <%--</a>--%>
        <%--</li>--%>
        <%--图表--%>
        <%--<li class="treeview">--%>
            <%--<a href="#">--%>
                <%--<i class="fa fa-pie-chart"></i>--%>
                <%--<span>Charts</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<i class="fa fa-angle-left pull-right"></i>--%>
            <%--</span>--%>
            <%--</a>--%>
            <%--<ul class="treeview-menu">--%>
                <%--<li><a href="../charts/chartjs.html"><i class="fa fa-circle-o"></i> ChartJS</a></li>--%>
                <%--<li><a href="../charts/morris.html"><i class="fa fa-circle-o"></i> Morris</a></li>--%>
                <%--<li><a href="../charts/flot.html"><i class="fa fa-circle-o"></i> Flot</a></li>--%>
                <%--<li><a href="../charts/inline.html"><i class="fa fa-circle-o"></i> Inline charts</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--UI样式--%>
        <%--<li class="treeview">--%>
            <%--<a href="#">--%>
                <%--<i class="fa fa-laptop"></i>--%>
                <%--<span>UI Elements</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<i class="fa fa-angle-left pull-right"></i>--%>
            <%--</span>--%>
            <%--</a>--%>
            <%--<ul class="treeview-menu">--%>
                <%--<li><a href="../UI/general.html"><i class="fa fa-circle-o"></i> General</a></li>--%>
                <%--<li><a href="../UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>--%>
                <%--<li><a href="../UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>--%>
                <%--<li><a href="../UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>--%>
                <%--<li><a href="../UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>--%>
                <%--<li><a href="../UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--form--%>
        <%--<li class="treeview">--%>
            <%--<a href="#">--%>
                <%--<i class="fa fa-edit"></i> <span>Forms</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<i class="fa fa-angle-left pull-right"></i>--%>
            <%--</span>--%>
            <%--</a>--%>
            <%--<ul class="treeview-menu">--%>
                <%--<li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> General Elements</a></li>--%>
                <%--<li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>--%>
                <%--<li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> Editors</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--表格--%>
        <%--<li class="treeview">--%>
            <%--<a href="#">--%>
                <%--<i class="fa fa-table"></i> <span>Tables</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<i class="fa fa-angle-left pull-right"></i>--%>
            <%--</span>--%>
            <%--</a>--%>
            <%--<ul class="treeview-menu">--%>
                <%--<li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Simple tables</a></li>--%>
                <%--<li><a href="../tables/data.html"><i class="fa fa-circle-o"></i> Data tables</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--日程--%>
        <%--<li>--%>
            <%--<a href="../schedule/calendar.html">--%>
                <%--<i class="fa fa-calendar"></i> <span>Calendar</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<small class="label pull-right bg-red">3</small>--%>
              <%--<small class="label pull-right bg-blue">17</small>--%>
            <%--</span>--%>
            <%--</a>--%>
        <%--</li>--%>
        <%--登陆注册页面都在 = =--%>
        <%--<li class="treeview">--%>
            <%--<a href="#">--%>
                <%--<i class="fa fa-folder"></i> <span>Examples</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<i class="fa fa-angle-left pull-right"></i>--%>
            <%--</span>--%>
            <%--</a>--%>
            <%--<ul class="treeview-menu">--%>
                <%--<li><a href="../examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>--%>
                <%--<li><a href="../examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>--%>
                <%--<li><a href="../examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>--%>
                <%--<li><a href="../examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>--%>
                <%--<li><a href="../examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>--%>
                <%--<li><a href="../examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>--%>
                <%--<li><a href="../examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>--%>
                <%--<li><a href="../examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>--%>
                <%--<li><a href="../examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--<li class="treeview">--%>
            <%--<a href="#">--%>
                <%--<i class="fa fa-share"></i> <span>Multilevel</span>--%>
                <%--<span class="pull-right-container">--%>
              <%--<i class="fa fa-angle-left pull-right"></i>--%>
            <%--</span>--%>
            <%--</a>--%>
            <%--<ul class="treeview-menu">--%>
                <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>--%>
                <%--<li>--%>
                    <%--<a href="#"><i class="fa fa-circle-o"></i> Level One--%>
                        <%--<span class="pull-right-container">--%>
                  <%--<i class="fa fa-angle-left pull-right"></i>--%>
                <%--</span>--%>
                    <%--</a>--%>
                    <%--<ul class="treeview-menu">--%>
                        <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>--%>
                        <%--<li>--%>
                            <%--<a href="#"><i class="fa fa-circle-o"></i> Level Two--%>
                                <%--<span class="pull-right-container">--%>
                      <%--<i class="fa fa-angle-left pull-right"></i>--%>
                    <%--</span>--%>
                            <%--</a>--%>
                            <%--<ul class="treeview-menu">--%>
                                <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>--%>
                                <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>--%>
                            <%--</ul>--%>
                        <%--</li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>--%>
            <%--</ul>--%>
        <%--</li>--%>
        <%--<li><a href="<%=contextPath%>/login/carAdminMassage"><i class="fa fa-book"></i> <span>Documentation</span></a></li>--%>
        <%--<li class="header">LABELS</li>--%>
        <%--<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>--%>
        <%--<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>--%>
        <%--<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>--%>
    </ul>
</section>
