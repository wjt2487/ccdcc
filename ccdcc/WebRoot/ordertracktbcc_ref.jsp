<%@ page language="java"  pageEncoding="utf-8"%>
<%@ include file="common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>药品所在冷库的温湿度信息</title>
<style type="text/css">
body {
	font-size:12px;
}
#content {
	margin-left: auto;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
}
#content #center .altrow_a {
	background-image: url(images/index/bg3.gif);
	background-repeat: repeat-x;
	background-position: 0px 0px;
	height: 40px;
}
.top {
	margin-top: 8px;
}
#right_content {
	margin: 8px 0 10px 0;
}
table td {
	border: 0
}
#r_table {
	position: relative;
	height: auto;
	text-align: center;
	margin: 0px;
}
#r_table #r_table_tr {
	background-color: #3087DD;
	height: 20px;
}
ul {
	margin-left: 40px;
	margin-top: 3px;
}
ul li {
	line-height: 20px
}
ul.a {
	list-style-type:circle;
}
#back_span {
	margin-left: 500px;
	font-size: 14px;
}
</style>
<link href="css/ordertracktbcc_ref/con_ri.css" rel="stylesheet" type="text/css" />
<link href="css/ordertracktbcc_ref/tcd.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div>
  <iframe scrolling="no" src="common/header2.jsp" width=100% height=128 frameborder=0></iframe >
</div>
<form action="org.do" name="myform" id="myform" method="post">
  <input type="hidden" name="ope"  id="ope"  value="toHigherOrg"/>
  <input  type="hidden" name="oid"  id="oid" value="${oid }"/>
  <input type="hidden" name="ids" id="ids" value="${ids }"/>
  <input type="hidden" name="orgName_statistics" id="orgName_statistics" value="${orgName }" />
</form>
<div id="content">
  <div id="center" >
    <div class="top" style="position:relative; display:block;">
      <table id="tb" border="0" cellspacing="0" cellpadding="0" >
        <tr id="tb1" >
          <td colspan="7"><span style="text-align:left; float:left;padding-left:4px; margin-left:4px; color:#141414;"> <img src=images/index/icon.gif width="9" height="10" /> <b>当前位置</b>：狂犬疫苗所在冷藏间F1C1温湿度信息： <span id="errorTip" style="color: red;display: none;" >(获取报警数据失败 ...)</span> </span> <span id="back_span"><a href="ordertracktbcc.jsp">返回</a></span></td>
        </tr>
      </table>
    </div>
    <div id="right_content">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tb3" >
        <tr id="tb3">
          <td width="159" height="25">时间</td>
          <td width="92">T51</td>
          <td width="89">T52</td>
          <td width="83">T53</td>
          <td width="85">RH51</td>
          <td width="75">最大温度</td>
          <td width="73">最小温度</td>
          <td width="77">平均温度</td>
          <td width="92">最大湿度</td>
          <td width="85">最小湿度</td>
          <td width="80">平均湿度</td>
        </tr>
        <tr>
          <td width="159">2012-07-11 12:00:00</td>
          <td width="92">12.21</td>
          <td width="89">10.91</td>
          <td width="83">12.22</td>
          <td width="85">84%</td>
          <td width="75">13.99</td>
          <td width="73">8.99</td>
          <td width="77">9.12</td>
          <td width="92">75%</td>
          <td width="85">60%</td>
          <td width="80">66%</td>
        </tr>
        <tbody id="t_table_display">
          <tr class="altrow">
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td class="altrow">84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr >
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr class="altrow">
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr >
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr class="altrow">
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr >
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr class="altrow">
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr class="altrow">
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr class="altrow">
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
          <tr>
            <td>2012-07-11 12:00:00</td>
            <td>12.21</td>
            <td>10.91</td>
            <td>12.22</td>
            <td>84%</td>
            <td>13.99</td>
            <td>8.99</td>
            <td>9.12</td>
            <td>75%</td>
            <td>60%</td>
            <td>66%</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<div>
  <iframe scrolling="no" src="common/footer2.jsp" width=100% height=26 frameborder=0></iframe >
</div>
</body>
</html>
