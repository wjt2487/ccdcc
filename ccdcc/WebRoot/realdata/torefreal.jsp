<%@ page language="java"  pageEncoding="gbk" import="java.util.*"%>
<%@page import="org.tbcc.util.MySpringFactory"%>
<%@page import="org.tbcc.biz.ProjectBiz"%>
<%@page import="org.tbcc.biz.RealRefBiz"%>
<%@page import="org.tbcc.entity.TbccPrjType"%>
<%@page import="org.tbcc.entity.TbccRefInfo"%>
<%@page import="org.tbcc.entity.TbccAiInfo"%>
<%@page import="org.tbcc.entity.TbccBaseRealRef"%>
<%@include file="../taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>仓库实时数据查看22</title>
<link href="../css/cangku/cssrellist.css" rel="stylesheet" type="text/css" />
<link rel="Shortcut Icon" href="../img/add/logo.ico" />
<script type="text/javascript">
	function golist(url,operate){
		document.getElementById('myform').action = url ;
		document.getElementById('ope').value = operate ;
		document.myform.submit();
	}
	
	
	/**
	*	跳转到仓库系统页面
	**/
	function gosyslist(url,operate,projectId){
		document.getElementById('projectId').value = projectId ;
		golist(url,operate);
	}
	
	/**
	*	跳转到不同的楼层页面
	**/
	function gofloorlist(url,operate,projectId,ftype,fno){
		document.getElementById('projectId').value = projectId ;
		document.getElementById('floorType').value = ftype ;
		document.getElementById('floorNo').value = fno ;
		golist(url,operate);
	}
	
	/**
	*	页面初始化时执行方法
	**/
	
	function init(){
			branchId =  document.getElementById("branchId").value ;
		 	pid 	 = 	document.getElementById("projectId").value ;
			ftype	 =  document.getElementById('floorType').value ;
			fno 	 =  document.getElementById('floorNo').value ;
					
			if(branchId==null || branchId=="" || pid==null || pid=="" || ftype==null || ftype=="" || fno==null || fno=="" ){
				return  ;
			}
						
		getData() ;
		window.setInterval("getData()",10000); 	//每隔10秒钟获取一次冷库实时数据
	}
	
	
			//采用原生态Ajax代码请求，返回冷库的实时数据
			var xmlHttpRequest = null  ;
			var branchId = null ;
			var pid = null ;
			var ftype =	null ;
			var fno =	null ;
			
			//创建xmlhttprequest  对象
			function createXMLHttpRequest(){
				 if (window.XMLHttpRequest) { 
     			   		xmlHttpRequest = new XMLHttpRequest();  // Mozilla、Firefox、Safari 
  				  }else if (window.ActiveXObject) { 
      				  xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
  				  }		
  				  	
			}
			
			//获取请求的路径
			function getURL(){
				
				var url = "realref.jsp?projectId="+pid+"&floorType="+ftype+"&floorNo="+fno+"&branchId="+branchId+"&time="+new Date().getTime(); 
				return url ;
			}
			
			
			
			//请求状态发生改变时处理函数
			function statusChangeHandler(){
				//表示服务器端已经处理完毕
				if(xmlHttpRequest.readyState==4 ){
					if(xmlHttpRequest.status==200){
						var r = xmlHttpRequest.responseText ;
						document.getElementById("redDataContainer").innerHTML = "" ;
						document.getElementById("redDataContainer").innerHTML = r  ;
						document.getElementById('waitingDiv').style.display = "none" ;
				    }
			    }
			}
			
			
			
			//每个10秒调用的方法
			function getData(){
			    createXMLHttpRequest() ;			    
				xmlHttpRequest.onreadystatechange = statusChangeHandler ;
				xmlHttpRequest.open("GET",getURL());
				xmlHttpRequest.send(null);	
			
			}
			
	
</script>
</head>
 
<body onload="init();">

<form action="" id="myform" name="myform" method="post" >
	<input type="hidden" name="ope" id="ope" value=""/>
	<input type="hidden" name="projectId" id="projectId" value="${param.projectId }" />
	
	<input type="hidden" name="floorType" id="floorType" value="${param.floorType }"/>
	<input type="hidden" name="floorNo"   id="floorNo"   value="${param.floorNo }"/>	
	<input type="hidden" name="branchId"  id="branchId"  value="${param.branchId }"/>
</form>
<div id="left">
  <ul id="nav">
    <li class="tab">&nbsp;</li>
    <c:forEach  var="refPrj" items="${refPrjList}">
    	<li class="tab_a"> <a href="#"><img src="../images/canku/s.gif" width="20" height="22" />${refPrj.projectName }</a> </li>
    	<li class="tab_b"><a href="#"><img src="../images/canku/icon_a.gif" width="22" height="17"  class="right"/>仓库系统监测</a></li>
    	<c:forEach var="floor" items="${floorList}">
    		<c:if test="${refPrj.projectId==floor.project}">			
    			<li class="tab_b"><a href="#"><img src="../images/canku/icon_b.gif" width="18" height="20"  class="right"/>${floor.floorName }</a></li>
    		</c:if>
    	</c:forEach>
    	
    </c:forEach>

    <li class="tab_c"><a href="#">&nbsp;</a></li>
  </ul>
</div>
<div id="line"><img src="../images/canku/icon2_090.gif" /></div>
<div id="right">
  <div id="top">
  <a href="#"><img src="../images/chezai/icon_c.gif" width="16" height="15"  class="tb4"/><strong>位置:首页</strong>&lt;您正在查看的仓库实时数据</a>
  <span></span></div>
  <div id="bottom">
    <div id="center"><span>${floorName }</span></div>
   <div id="waitingDiv" align="center"></div>
   <div id="redDataContainer" >
      
    <%
    	
				String branchId = 91+"" ;
				String projectId = 1260+"" ;
				String floorType = 1+"";
				String floorNo = 1+"" ;
				
				
				
				
				RealRefBiz realrefBiz = (RealRefBiz)MySpringFactory.getInstance().getBean("realrefBiz");
				//获取楼层对应的冷库信息
				List<TbccRefInfo> refList = realrefBiz.getRefByFloorInfo(projectId, new Integer(floorType), new Integer(floorNo));
				if(refList==null || refList.size()==0){
					out.print("<h5 style=\"color='red'\">获取实时数据失败,没有配置相应的冷库...</h5>");
					return  ;
				}
					
				//获取冷库对应的探头信息
				List<TbccAiInfo> aiList = realrefBiz.getAiByRef(refList);
				if(aiList==null || aiList.size()==0){
					out.print("<h5 style=\"color='red'\">获取实时数据失败,没有配置相应的探头...</h5>");
					return  ;
				}
				
				//获取仓库对应的实时数据
				List<TbccBaseRealRef> baseRealList = realrefBiz.getRealRefData(projectId);
				
				int count = 0 ;		//定义统计冷库个数的变量
				
				int maxAiStr = 0;	//定义一个冷库的探头名称字符串最长的字节数
				int aiStr = 0;
				
				StringBuffer sb_0;//定义左边表格第一行的字符串
				StringBuffer sb0;//定义左边表格数据输出的字符串
				
				StringBuffer sb1;//定义激活状态输出的字符串
				
				StringBuffer sb2;//定义实时数据输出的字符串中第一行
				StringBuffer sb3;//定义激活状态输出的字符串中第三行
				StringBuffer sb4;//定义实时数据输出的字符串中第二行
				StringBuffer sb5;//定义实时数据输出的字符串中第四行
				
				//外循环遍历所有的冷库
				for (TbccRefInfo tbccRefInfo : refList) {
					
					int count1 = 0 ;   //定义统计每个冷库对应探头实时数据等于-300的个数
					
					maxAiStr = 0;		//每个冷库探头名称字符串最长字节数初始化为0
					
					sb1 = new StringBuffer("");
					//构造标题行的前几列
					out.println("<table id='tb' style='border: none;margin-top: 2px;'>");
					out.println("<tr><td style='border: none;' valign='bottom'>");
					out.println("<table width='270' style='border: none;' border='0' cellspacing='0' cellpadding='0'>");				
					//每一个冷库，两行数据
					sb2 = new StringBuffer("</tr>");
					sb2.append("</table>");
					sb2.append("</td>");
					sb2.append("<td style='border: none;' valign='top'>");
					//定义探头列表集合保存当前冷库探头
					List<Integer> 	portList = new ArrayList<Integer>();
					sb2.append("<table width='515' style='border: none;padding-top: 0px;margin-top: 0px;' border='0' cellspacing='0' cellpadding='0'>");
					sb2.append("<tr class='altrow' style='height:23px;'>");
					int i = 0;
					sb3 = new StringBuffer("");
					for (TbccAiInfo tbccAiInfo : aiList) {
						//如果探头属于当前冷库、则添加到集合中
						if(tbccRefInfo.getId().equals(tbccAiInfo.getRid())){
							aiStr = 0;
							aiStr = tbccAiInfo.getPortName().getBytes().length;		//获取探头名称字符串字节数
							if(aiStr>maxAiStr) maxAiStr = aiStr;
							if(i<12){
								sb2.append("<td width='42'>"+tbccAiInfo.getPortName()+"</td>");
							}else{
								if(i==12){
									sb3.append("</tr><tr class='altrow' style='height:23px;'>");
								}
								sb3.append("<td width='42'>"+tbccAiInfo.getPortName()+"</td>");
							}
							portList.add(tbccAiInfo.getPortNo());
							i++;
						}
					}
					
					//补列头后面的空白默认一个冷库12个探头
					for(int n=0;n<12-portList.size();n++){
						sb2.append("<td width='42'>&nbsp;&nbsp;</td>");
					}
					
					sb_0 = new StringBuffer("<tr class='altrow' style='height:"+(((maxAiStr/6)+(maxAiStr%6==0?0:1))*23)+"px;'>");
					
					sb_0.append("<td width='30'>序号</td>");
					sb_0.append("<td width='120'>冷库名称</td>");
					sb_0.append("<td width='60'>报警状态</td>");
					sb_0.append("<td width='60'>激活状态</td>");
					sb_0.append("</tr>");
					
					
					//左边表格列标题加载完毕，第二行显示数据
					sb0 = new StringBuffer("");
					
//					sb0.append("<tr class='tb2' "+(portList.size()>12?"style='height:75px;'":"")+">");
					sb0.append("<tr class='tb2' style='height:"+(((portList.size()/12)*(portList.size()%12==0?1:2)+(portList.size()%12==0?0:1))*25-2)+"px;'>");
					
					sb0.append("<td width='30'>"+(++count)+"</td>");
					sb0.append("<td width='120'>"+tbccRefInfo.getRefName()+"</td>");
					
					//定义一个变量用来保存，是否找到实时数据
					boolean isFind0 = false ;
					
					for (TbccBaseRealRef tbccBaseRealRef : baseRealList) {
						
						//判断当前冷库的设备id是否与实时数据设备id相同
						if(tbccRefInfo.getNetid().equals(tbccBaseRealRef.getNeiId())){
							isFind0 = true ;			//匹配到了实时数据
							//获取报警状态				
							Integer alarmState = tbccBaseRealRef.getAllRefAlarmStatus()[tbccRefInfo.getRefid()-1];
							
							
							if(tbccBaseRealRef.getConnectStatus().equals(RealRefBiz.CONNECTION)){
								if(alarmState.equals(RealRefBiz.ALARM)){				//报警
									sb0.append("<td width='60' ><img src='../img/menu/win/red.gif' title='表示处于报警状态' /></td>");						
									
								}else if(alarmState.equals(RealRefBiz.NORMAL)){		   //正常
									sb0.append("<td  width='60'><img src='../img/menu/win/blue.gif' title='表示处于正常状态'/></td>");						
								}else if (alarmState.equals(RealRefBiz.PREALARM)){		//预警
									sb0.append("<td width='60' ><img src='../img/menu/win/orange.gif' title='表示处于预警状态' /></td>");
								}else													//非法状态值
									sb0.append("<td width='60'>* * *</td>");
							}else{													//断开连接了
								sb0.append("<td width='60'>* * *</td>");
							}
							
							
							//获取冷库激活状态
							
							Integer runstate = tbccBaseRealRef.getAllRefRunStatus()[tbccRefInfo.getRefid()-1];
							
							if(tbccBaseRealRef.getConnectStatus().equals(RealRefBiz.CONNECTION)){
								if(runstate.equals(RealRefBiz.STOP))  				//停止
									sb1.append("<td width='60' ><img src='../img/menu/msie_doc_mo.gif' title='表示冷库处于未激活状态'  /></td>");						
								else if (runstate.equals(RealRefBiz.RUN))			//运行
									sb1.append("<td width='60'><img src='../img/menu/msie_doc.GIF' title='表示冷库处于激活状态'  /></td>");
								else												
									sb1.append("<td width='60'>* * *</td>");
							}else{													//断开了连接
								sb1.append("<td width='60'>* * *</td>");
							}
						}
					}
					//如果没有匹配到的探头的实时数据。则输出****填充
					if(!isFind0){
						for(int k = 0 ;k<2;k++)
							sb0.append("<td width='60'>* * *</td>");
					}
					
					
				
					
					
					sb4 = new StringBuffer("</tr>");
					sb4.append("<tr class='tb2'>");
					//定义一个变量用来保存，是否找到实时数据
					boolean isFind = false ;
					sb5 = new StringBuffer("");
					for (TbccBaseRealRef tbccBaseRealRef : baseRealList) {
						
						//判断当前冷库的设备id是否与实时数据设备id相同
						if(tbccRefInfo.getNetid().equals(tbccBaseRealRef.getNeiId())){
							
							isFind = true ;			//匹配到了实时数据
							
							int ii = 0;
							//获取探头实时数据
							for(Integer integer:portList){
								String str="* * *";
								if(tbccBaseRealRef.getConnectStatus().equals(RealRefBiz.CONNECTION)){
									Double data = tbccBaseRealRef.getAllAi()[integer-1];
									if(data==-300)
									{
										str="---";
										count1++;
									}
									else str=data.toString();
								}
								if(ii<12){
//									sb2.append("<td>"+str+"</td>");
									sb4.append("<td>"+str+"</td>");
								}else{
									if(ii==12){
										sb5.append("</tr><tr class='tb2'>");
									}
									sb5.append("<td>"+str+"</td>");
								}
								ii++;
							}
							//只要冷库与设备满足NetId相等了，相等就跳出循环就OK				
							break ;  					
							
						}
					}
					
					//如果没有匹配到的探头的实时数据。则输出****填充
					if(!isFind){
						int j = 0;
						for(int k = 0 ;k<portList.size();k++){
							if(j<12){
//								sb2.append("<td>* * *</td>");
								sb4.append("<td>* * *</td>");
							}else{
								sb5.append("<td>* * *</td>");
							}
							j++;
						}
					}
					
					//每一个冷库，两行数据
						
					sb5.append("</tr>");
					sb5.append("</table>");
					sb5.append("</td>");
					sb5.append("</tr>");
					sb5.append("</table>");
					
					
					if(isFind0){
						if(count1==portList.size()){
							out.println(sb_0);
							out.println(sb0+"<td width='60' ><img src='img/menu/msie_doc_mo.gif' title='表示冷库处于未激活状态'  /></td>"+sb2+sb4+sb3+sb5);
						}else{
							out.println(sb_0);
							out.println(sb0);
							out.println(sb1);
							out.println(sb2);
							out.println(sb4);
							out.println(sb3);
							out.println(sb5);
						}
					}else{
						out.println(sb_0);
						out.println(sb0);
						out.println(sb2);
						out.println(sb4);
						out.println(sb3);
						out.println(sb5);
					}
				}
				
     %>
    </div>
    
  </div>
</div>
<div class="clear"></div>

</body>
</html>