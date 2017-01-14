<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="paragraphBox">
    <span class="showMsg pull-left">显示<i class="red" id="show_begin_position_two">0</i>到<i class="red" id="show_end_position_two">0</i>，共<i class="red" id="countTwo">0</i>条记录,共<i class="red" id="pageAllCountTwo">0</i>页</span>
    <ul class="pagination new_pagination pull-right">
        <li><a href="javascript:prevPageTwo();">«</a></li>
        <li><a href="javaScript:void(0)" id="pageNumTwo">1</a></li>
        <li><a href="javascript:nextPageTwo();">»</a></li>
        <span class="gofont">跳转到</span><input id="pageSelectTwo" type="text" class="Pageinput">
        <button type="button" class="btn btn-success submitBt pull-right" onclick="javascript:goPageTwo();">确定</button>
        <input type="hidden" value="0" id="pageCountTwo" />
    </ul>
</div>
