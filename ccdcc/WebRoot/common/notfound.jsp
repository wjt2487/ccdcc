<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>你请求的资源不存在!!!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="Shortcut Icon" href="/ccdcc/img/add/logo.ico" >
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="/ccdcc/css/style.css" rel="stylesheet" type="text/css">
		<LINK href="/ccdcc/css/mainWin.css" type=text/css media=screen rel=stylesheet>
		<LINK href="/ccdcc/css/mainWin2.css" type=text/css media=screen rel=stylesheet>
		<LINK href="/ccdcc/css/desktop.css" type=text/css media=screen rel=stylesheet>
		<script type="text/javascript" src="/ccdcc/script/common.js"></script>
		<script type="text/javascript" src="/ccdcc/script/titleTime.js"></script>
		<style type="text/css">
			.STYLE1 {font-size: 12px}
        </style>

	<style type="css/text">
			.div_top{
				border-top: solid 1px #4986D4;
			}
		</style>
  </head>
  
  <body  onload="showtime();" bgcolor="#FFFFFF">
    	 <table width="990" border="0" align="center" cellpadding="0"
			cellspacing="0" bordercolorlight="#CCCCCC" bordercolor="#FFFFFF"
			bordercolordark="#FFFFFF">
			<tr align="center">
				<td height="76" colspan="3" align="right"
					background="/ccdcc/img/stock_index_01.gif">
					<a target="_parent" title="注销" href="/ccdcc/user.do?ope=doLogout"><img border="0" src="/ccdcc/img/stock_index_02.gif"/></a><span style="cursor: hand"><img border="0" onclick="if(confirm('确定退出系统吗?'))window.close();" src="/ccdcc/img/stock_index_04.gif" /></span>
				</td>
			</tr>
			<tr align="center">
				<td height="40" colspan="3" align="left" 
					background="/ccdcc/img/stock_index_06.gif">
				<div id="time" style="padding-top:8px; padding-right:20px; float: right; text-align: left;color: white;"></div>
				<div id="userInfo" style="padding-top:6px; padding-right:28px; float: right; text-align: left;color: white;">${userInfo}</div>
				</td>
			</tr>
			<tr align="center">
				<td colspan="3"><img src="/ccdcc/img/fault_404.gif"/>
				<br>
				<span style="font: 17px;color: red;cursor:hand" onclick="javascript:window.history.back();"> 返回操作 </span>
				&nbsp;&nbsp;&nbsp;
				<span style="font: 17px;color: red;cursor:hand" onclick="javascript:window.location.href='/ccdcc/user.do?ope=doLogout'"> &nbsp;&nbsp;重新登陆</span>
				</td>
			</tr>
			</table>
  </body>
</html>
