/***下一页查询***/
function nextPage(){
	if(currentPage<pageCount){
		var nextPage=currentPage+1;
		queryByPage(nextPage);
	}else{
		var txt="对不起,当前已经是最后一页了！"
		alert(txt);
	}
}
/***上一页查询****/
function prevPage(){
	if(currentPage>0){
		var prevPage=currentPage-1;
		queryByPage(prevPage);
	}else{
		var txt="对不起,当前已经是第一页了！"
		alert(txt);
	}

}
/****查询第一页*****/
function goFirstPage(){
	queryByPage(0);
}
/*****查询最后一页*******/
function goLastPage(){
	//var pageCount=$("#pageCount").text();
	queryByPage(pageCount);

}

/***查询指定页***/

function goPage() {
	var pageNum = $("#pageSelect").val();
	//var pageCount=$("#pageCount").text();
	var r = /^[0-9]*[1-9][0-9]*$/　　//正整数
	if (!r.test(pageNum)){
		alert("请输入正整数的页数");
		return;
	}
	if (pageNum <= pageCount+1) {
		var nextPage = pageNum-1;
		queryByPage(nextPage);
		$("#pageSelect").val(pageNum);
	}else{
		var txt="注意：输入页码不能超过总页数:"+parseInt(pageCount+1);
		alert(txt);
	}
}


/**
 * 同一页面存在2个分页时，分别对每个分页实现
 */
function nextPageTwo(){
	if(currentPageTwo<pageCountTwo){
		var nextPage=currentPageTwo+1;
		queryByPageTwo(nextPage);
	}else{
		var txt="对不起,当前已经是最后一页了！"
		alert(txt);
	}
}
/***上一页查询****/
function prevPageTwo(){
	if(currentPageTwo>0){
		var prevPage=currentPageTwo-1;
		queryByPageTwo(prevPage);
	}else{
		var txt="对不起,当前已经是第一页了！"
		alert(txt);
	}
}
/****查询第一页*****/
function goFirstPageTwo(){
	queryByPageTwo(0);
}
/*****查询最后一页*******/
function goLastPageTwo(){
	//var pageCount=$("#pageCount").text();
	queryByPageTwo(pageCountTwo);

}
/***查询指定页***/
function goPageTwo() {
	var pageNum = $("#pageSelectTwo").val();

	if(pageNum=="")
	{
		alert("请输入跳转到的页面！");
		return ;
	}
	var r = /^[0-9]*[1-9][0-9]*$/　　//正整数
	if (!r.test(pageNum)){
		alert("请输入正整数的页数");
		return;
	}
	if (pageNum <= pageCountTwo+1) {
		var nextPage = pageNum-1;
		queryByPageTwo(nextPage);
		$("#pageSelectTwo").val(pageNum);
	}else{
		var txt="注意：输入页码不能超过总页数:"+parseInt(pageCountTwo+1);
		alert(txt);
	}
}
/*****************************************************************************/

/**
 * 页面旁边存在的小分页时，分别对每个分页实现
 */
function nextPageSmall(){
	if(smallCurrentPage<smallPageCount){
		var nextPage=smallCurrentPage+1;
		queryByPageSmall(nextPage);
	}else{
		var txt="对不起,当前已经是最后一页了！"
		alert(txt);
	}
}
/***上一页查询****/
function prevPageSmall(){
	if(smallCurrentPage>0){
		var prevPage=smallCurrentPage-1;
		queryByPageSmall(prevPage);
	}else{
		var txt="对不起,当前已经是第一页了！"
		alert(txt);
	}
}


function nextPageSmallTwo(){
	if(smallCurrentPageTwo<smallPageCountTwo){
		var nextPage=smallCurrentPageTwo+1;
		queryByPageSmallTwo(nextPage);
	}else{
		var txt="对不起,当前已经是最后一页了！"
		alert(txt);
	}
}
/***上一页查询****/
function prevPageSmallTwo(){
	if(smallCurrentPageTwo>0){
		var prevPage=smallCurrentPageTwo-1;
		queryByPageSmallTwo(prevPage);
	}else{
		var txt="对不起,当前已经是第一页了！"
		alert(txt);
	}
}
this.getServicePath=function () {
	return window.location.protocol+"//"+window.location.host+window.location.pathname.substring(0,window.location.pathname.substr(1).indexOf('/')+1);
}


/**
 * 同一页面存在2个分页时，分别对每个分页实现
 */
function nextPageThree(){
	if(currentPageThree < pageCountThree){
		var nextPage =currentPageThree + 1;
		queryByPageThree(nextPage);
	}else{
		var txt="对不起,当前已经是最后一页了！"
		alert(txt);
	}
}
/***上一页查询****/
function prevPageThree(){
	if(currentPageThree > 0){
		var prevPage = currentPageThree - 1;
		queryByPageThree(prevPage);
	}else{
		var txt="对不起,当前已经是第一页了！"
		alert(txt);
	}
}
/****查询第一页*****/
function goFirstPageTwo(){
	queryByPageThree(0);
}
/*****查询最后一页*******/
function goLastPageTwo(){
	//var pageCount=$("#pageCount").text();
	queryByPageThree(pageCountThree);

}
/***查询指定页***/
function goPageThree() {
	var pageNum = $("#pageSelectThree").val();

	if(pageNum=="")
	{
		alert("请输入跳转到的页面！");
		return ;
	}
	var r = /^[0-9]*[1-9][0-9]*$/　　//正整数
	if (!r.test(pageNum)){
		alert("请输入正整数的页数");
		return;
	}
	if (pageNum <= pageCountThree + 1) {
		var nextPage = pageNum - 1;
		queryByPageThree(nextPage);
		$("#pageSelectThree").val(pageNum);
	}else{
		var txt="注意：输入页码不能超过总页数:"+parseInt(pageCountThree+1);
		alert(txt);
	}
}




