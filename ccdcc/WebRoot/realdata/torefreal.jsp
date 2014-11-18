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
<title>�ֿ�ʵʱ���ݲ鿴22</title>
<link href="../css/cangku/cssrellist.css" rel="stylesheet" type="text/css" />
<link rel="Shortcut Icon" href="../img/add/logo.ico" />
<script type="text/javascript">
	function golist(url,operate){
		document.getElementById('myform').action = url ;
		document.getElementById('ope').value = operate ;
		document.myform.submit();
	}
	
	
	/**
	*	��ת���ֿ�ϵͳҳ��
	**/
	function gosyslist(url,operate,projectId){
		document.getElementById('projectId').value = projectId ;
		golist(url,operate);
	}
	
	/**
	*	��ת����ͬ��¥��ҳ��
	**/
	function gofloorlist(url,operate,projectId,ftype,fno){
		document.getElementById('projectId').value = projectId ;
		document.getElementById('floorType').value = ftype ;
		document.getElementById('floorNo').value = fno ;
		golist(url,operate);
	}
	
	/**
	*	ҳ���ʼ��ʱִ�з���
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
		window.setInterval("getData()",10000); 	//ÿ��10���ӻ�ȡһ�����ʵʱ����
	}
	
	
			//����ԭ��̬Ajax�������󣬷�������ʵʱ����
			var xmlHttpRequest = null  ;
			var branchId = null ;
			var pid = null ;
			var ftype =	null ;
			var fno =	null ;
			
			//����xmlhttprequest  ����
			function createXMLHttpRequest(){
				 if (window.XMLHttpRequest) { 
     			   		xmlHttpRequest = new XMLHttpRequest();  // Mozilla��Firefox��Safari 
  				  }else if (window.ActiveXObject) { 
      				  xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer
  				  }		
  				  	
			}
			
			//��ȡ�����·��
			function getURL(){
				
				var url = "realref.jsp?projectId="+pid+"&floorType="+ftype+"&floorNo="+fno+"&branchId="+branchId+"&time="+new Date().getTime(); 
				return url ;
			}
			
			
			
			//����״̬�����ı�ʱ������
			function statusChangeHandler(){
				//��ʾ���������Ѿ��������
				if(xmlHttpRequest.readyState==4 ){
					if(xmlHttpRequest.status==200){
						var r = xmlHttpRequest.responseText ;
						document.getElementById("redDataContainer").innerHTML = "" ;
						document.getElementById("redDataContainer").innerHTML = r  ;
						document.getElementById('waitingDiv').style.display = "none" ;
				    }
			    }
			}
			
			
			
			//ÿ��10����õķ���
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
    	<li class="tab_b"><a href="#"><img src="../images/canku/icon_a.gif" width="22" height="17"  class="right"/>�ֿ�ϵͳ���</a></li>
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
  <a href="#"><img src="../images/chezai/icon_c.gif" width="16" height="15"  class="tb4"/><strong>λ��:��ҳ</strong>&lt;�����ڲ鿴�Ĳֿ�ʵʱ����</a>
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
				//��ȡ¥���Ӧ�������Ϣ
				List<TbccRefInfo> refList = realrefBiz.getRefByFloorInfo(projectId, new Integer(floorType), new Integer(floorNo));
				if(refList==null || refList.size()==0){
					out.print("<h5 style=\"color='red'\">��ȡʵʱ����ʧ��,û��������Ӧ�����...</h5>");
					return  ;
				}
					
				//��ȡ����Ӧ��̽ͷ��Ϣ
				List<TbccAiInfo> aiList = realrefBiz.getAiByRef(refList);
				if(aiList==null || aiList.size()==0){
					out.print("<h5 style=\"color='red'\">��ȡʵʱ����ʧ��,û��������Ӧ��̽ͷ...</h5>");
					return  ;
				}
				
				//��ȡ�ֿ��Ӧ��ʵʱ����
				List<TbccBaseRealRef> baseRealList = realrefBiz.getRealRefData(projectId);
				
				int count = 0 ;		//����ͳ���������ı���
				
				int maxAiStr = 0;	//����һ������̽ͷ�����ַ�������ֽ���
				int aiStr = 0;
				
				StringBuffer sb_0;//������߱���һ�е��ַ���
				StringBuffer sb0;//������߱������������ַ���
				
				StringBuffer sb1;//���弤��״̬������ַ���
				
				StringBuffer sb2;//����ʵʱ����������ַ����е�һ��
				StringBuffer sb3;//���弤��״̬������ַ����е�����
				StringBuffer sb4;//����ʵʱ����������ַ����еڶ���
				StringBuffer sb5;//����ʵʱ����������ַ����е�����
				
				//��ѭ���������е����
				for (TbccRefInfo tbccRefInfo : refList) {
					
					int count1 = 0 ;   //����ͳ��ÿ������Ӧ̽ͷʵʱ���ݵ���-300�ĸ���
					
					maxAiStr = 0;		//ÿ�����̽ͷ�����ַ�����ֽ�����ʼ��Ϊ0
					
					sb1 = new StringBuffer("");
					//��������е�ǰ����
					out.println("<table id='tb' style='border: none;margin-top: 2px;'>");
					out.println("<tr><td style='border: none;' valign='bottom'>");
					out.println("<table width='270' style='border: none;' border='0' cellspacing='0' cellpadding='0'>");				
					//ÿһ����⣬��������
					sb2 = new StringBuffer("</tr>");
					sb2.append("</table>");
					sb2.append("</td>");
					sb2.append("<td style='border: none;' valign='top'>");
					//����̽ͷ�б��ϱ��浱ǰ���̽ͷ
					List<Integer> 	portList = new ArrayList<Integer>();
					sb2.append("<table width='515' style='border: none;padding-top: 0px;margin-top: 0px;' border='0' cellspacing='0' cellpadding='0'>");
					sb2.append("<tr class='altrow' style='height:23px;'>");
					int i = 0;
					sb3 = new StringBuffer("");
					for (TbccAiInfo tbccAiInfo : aiList) {
						//���̽ͷ���ڵ�ǰ��⡢����ӵ�������
						if(tbccRefInfo.getId().equals(tbccAiInfo.getRid())){
							aiStr = 0;
							aiStr = tbccAiInfo.getPortName().getBytes().length;		//��ȡ̽ͷ�����ַ����ֽ���
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
					
					//����ͷ����Ŀհ�Ĭ��һ�����12��̽ͷ
					for(int n=0;n<12-portList.size();n++){
						sb2.append("<td width='42'>&nbsp;&nbsp;</td>");
					}
					
					sb_0 = new StringBuffer("<tr class='altrow' style='height:"+(((maxAiStr/6)+(maxAiStr%6==0?0:1))*23)+"px;'>");
					
					sb_0.append("<td width='30'>���</td>");
					sb_0.append("<td width='120'>�������</td>");
					sb_0.append("<td width='60'>����״̬</td>");
					sb_0.append("<td width='60'>����״̬</td>");
					sb_0.append("</tr>");
					
					
					//��߱���б��������ϣ��ڶ�����ʾ����
					sb0 = new StringBuffer("");
					
//					sb0.append("<tr class='tb2' "+(portList.size()>12?"style='height:75px;'":"")+">");
					sb0.append("<tr class='tb2' style='height:"+(((portList.size()/12)*(portList.size()%12==0?1:2)+(portList.size()%12==0?0:1))*25-2)+"px;'>");
					
					sb0.append("<td width='30'>"+(++count)+"</td>");
					sb0.append("<td width='120'>"+tbccRefInfo.getRefName()+"</td>");
					
					//����һ�������������棬�Ƿ��ҵ�ʵʱ����
					boolean isFind0 = false ;
					
					for (TbccBaseRealRef tbccBaseRealRef : baseRealList) {
						
						//�жϵ�ǰ�����豸id�Ƿ���ʵʱ�����豸id��ͬ
						if(tbccRefInfo.getNetid().equals(tbccBaseRealRef.getNeiId())){
							isFind0 = true ;			//ƥ�䵽��ʵʱ����
							//��ȡ����״̬				
							Integer alarmState = tbccBaseRealRef.getAllRefAlarmStatus()[tbccRefInfo.getRefid()-1];
							
							
							if(tbccBaseRealRef.getConnectStatus().equals(RealRefBiz.CONNECTION)){
								if(alarmState.equals(RealRefBiz.ALARM)){				//����
									sb0.append("<td width='60' ><img src='../img/menu/win/red.gif' title='��ʾ���ڱ���״̬' /></td>");						
									
								}else if(alarmState.equals(RealRefBiz.NORMAL)){		   //����
									sb0.append("<td  width='60'><img src='../img/menu/win/blue.gif' title='��ʾ��������״̬'/></td>");						
								}else if (alarmState.equals(RealRefBiz.PREALARM)){		//Ԥ��
									sb0.append("<td width='60' ><img src='../img/menu/win/orange.gif' title='��ʾ����Ԥ��״̬' /></td>");
								}else													//�Ƿ�״ֵ̬
									sb0.append("<td width='60'>* * *</td>");
							}else{													//�Ͽ�������
								sb0.append("<td width='60'>* * *</td>");
							}
							
							
							//��ȡ��⼤��״̬
							
							Integer runstate = tbccBaseRealRef.getAllRefRunStatus()[tbccRefInfo.getRefid()-1];
							
							if(tbccBaseRealRef.getConnectStatus().equals(RealRefBiz.CONNECTION)){
								if(runstate.equals(RealRefBiz.STOP))  				//ֹͣ
									sb1.append("<td width='60' ><img src='../img/menu/msie_doc_mo.gif' title='��ʾ��⴦��δ����״̬'  /></td>");						
								else if (runstate.equals(RealRefBiz.RUN))			//����
									sb1.append("<td width='60'><img src='../img/menu/msie_doc.GIF' title='��ʾ��⴦�ڼ���״̬'  /></td>");
								else												
									sb1.append("<td width='60'>* * *</td>");
							}else{													//�Ͽ�������
								sb1.append("<td width='60'>* * *</td>");
							}
						}
					}
					//���û��ƥ�䵽��̽ͷ��ʵʱ���ݡ������****���
					if(!isFind0){
						for(int k = 0 ;k<2;k++)
							sb0.append("<td width='60'>* * *</td>");
					}
					
					
				
					
					
					sb4 = new StringBuffer("</tr>");
					sb4.append("<tr class='tb2'>");
					//����һ�������������棬�Ƿ��ҵ�ʵʱ����
					boolean isFind = false ;
					sb5 = new StringBuffer("");
					for (TbccBaseRealRef tbccBaseRealRef : baseRealList) {
						
						//�жϵ�ǰ�����豸id�Ƿ���ʵʱ�����豸id��ͬ
						if(tbccRefInfo.getNetid().equals(tbccBaseRealRef.getNeiId())){
							
							isFind = true ;			//ƥ�䵽��ʵʱ����
							
							int ii = 0;
							//��ȡ̽ͷʵʱ����
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
							//ֻҪ������豸����NetId����ˣ���Ⱦ�����ѭ����OK				
							break ;  					
							
						}
					}
					
					//���û��ƥ�䵽��̽ͷ��ʵʱ���ݡ������****���
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
					
					//ÿһ����⣬��������
						
					sb5.append("</tr>");
					sb5.append("</table>");
					sb5.append("</td>");
					sb5.append("</tr>");
					sb5.append("</table>");
					
					
					if(isFind0){
						if(count1==portList.size()){
							out.println(sb_0);
							out.println(sb0+"<td width='60' ><img src='img/menu/msie_doc_mo.gif' title='��ʾ��⴦��δ����״̬'  /></td>"+sb2+sb4+sb3+sb5);
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