<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="paragraphBox">
    <span class="showMsg pull-left">显示<i class="red" id="show_begin_position">0</i>到<i class="red" id="show_end_position">0</i>，共<i class="red" id="count">0</i>条记录,共<i class="red" id="pageAllCount">0</i>页</span>
    <ul class="pagination new_pagination pull-right">
        <li><a href="javascript:prevPage();">«</a></li>
        <li><a href="javaScript:void(0)" id="pageNum">1</a></li>
        <li style="margin-right: 10px;"><a href="javascript:nextPage();">»</a></li>
        <span class="gofont">跳转到</span><input id="pageSelect" type="text" class="Pageinput border">
        <button type="button" class="btn btn-success submitBt pull-right border" onclick="javascript:goPage();">确定</button>
        <input type="hidden" value="0" id="pageCount" />
    </ul>
</div>
