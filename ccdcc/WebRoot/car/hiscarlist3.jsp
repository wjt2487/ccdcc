<%@ page language="java" import="java.util.*,org.tbcc.entity.TbccBaseHisCar,java.text.DecimalFormat" pageEncoding="gbk"%>
<%@include file="taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>�ƶ�������ʷ���ݲ鿴</title>
<link rel="Shortcut Icon" href="img/add/logo.ico" />
<link href="css/chezai/tcd.css" rel="stylesheet" type="text/css" />
<link href="css/chezai/input5.css" rel="stylesheet" type="text/css" />
<script src="DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="script/cExcel.js"></script>
<script src="script/common.js"></script>
<script type="text/javascript" src="http://app.mapabc.com/apis?t=flashmap&v=2.4.1&key=30d03c0ba5c60850be655229ede0f001c17751ecce42fb81df6077eaa1031fb01a4a18c4a07047f0"></script>
<script type="text/javascript" src="script/jquery.min.js"></script>

<script type="text/javascript">

	function golist(url,operate){
		document.myform.time1.value = document.getElementById('t1').value ;
		document.myform.time2.value = document.getElementById('t2').value ;
		document.getElementById('ope').value = operate ;
		document.getElementById('myform').action = url ;
		document.myform.submit();
	}
	
		function query(){
			
				var val = document.getElementById("timevalue").value;
				var inter = document.getElementById("interval").value;
				
				if(val=="" || val ==0)
				{
					window.alert("��ѡ����ʼ����!");
					document.getElementById("timevalue").focus() ;
					return  ;
				}
				
				document.getElementById('myform').action = 'hiscar.do' ;
				document.getElementById('ope').value = 'doHisCarByStart' ;
				document.myform.submit() ;
			}
		
			/**
			*	��ʾ��ѯ�������Ϣ
			**/
			function showInfo(obj){
				var intervalValue = document.getElementById("interval").value ;
				var total = obj.value * intervalValue ;
				var str = "�� "+total+"(S)��ѯ"
				document.getElementById("Queryinfo").innerHTML = str ;
				document.getElementById("queryinfoTip").value = str ;
			}
	$(function() {
	
	if($("input#isShowAddress").val()==1){//��¼���˻��Ƿ���ʾ���ص���λ����Ϣ
	   $(".address").show();
	}
	
    $('.latlng').each(function(){
      //console.log($(this).text());

      var xy = $(this).text(); //'116.334,39.9872';
      var coor=xy.split(",");

      // 2  ����gps��ʵ��γ��
      var lnglatXY=new MLngLat(coor[0],coor[1], 2)
       if (coor[0] == -300 || coor[1] == -300) { return $('.latlng').next().html('--');;} 
      var mls =new MReGeoCodeSearch();

      var opt= new MReGeoCodeSearchOptions();

      opt.poiNumber=10;;//�����ܱߵ�POI����,Ĭ��10

      opt.range=3000;//�޶��ܱ��ȵ�POI�͵�·�ľ��뷶Χ

      opt.pattern=1;//�������ݵ�ģʽ,0��ʾ���صر���POI,1��ʾ����ȫ��POI

      opt.exkey="";//�ų��Ĺؼ���

      mls.setCallbackFunction((function(elem) {

        return function poiToAddressSearch_CallBack(data){

          var resultStr="";

          if(data.error_message != null) {

            console.log("error", data.error_message);
          } else{
            if (data.message == 'ok' && data.SpatialBean && data.SpatialBean.Province && data.SpatialBean.District && data.SpatialBean.roadList && data.SpatialBean.roadList[0]) {
              var address = data.SpatialBean.Province.name + data.SpatialBean.District.name + data.SpatialBean.roadList[0].name;
              $(elem).next().html(address);
              console.log("callback", elem, data);
            }
          }

        }
      })($(this)));


      mls.poiToAddress(lnglatXY,opt);

    });
  });
	
</script>

</head>
<body>
<div>
  <iframe scrolling="no" src="common/header2.jsp" width=100% height=126 frameborder=0></iframe >
</div>
<form action="" method="post" name="myform" id="myform">	
<input type="hidden" name="branchId" id="branchId" value="${param.branchId }" />
<input type="hidden" id="ope" name="ope" value =""/>
<%-- 
<input type="hidden" id="isExportPdf" name="isExportPdf" value =""/>
--%>
<input type="hidden" name="isShowAddress" id="isShowAddress" value="${isShowAddress}"/>
<input type="hidden" name="t1" id="t1" value="${param.t1 }"/>
<input type="hidden" name="t2" id="t2"  value="${param.t2 }"/>
<input type="hidden" id="sid" name="sid" value="${param.sid}"/>
<input type="hidden" id="proId" name="proId" value="${project==null?param.proId:project.projectId }"/>

<div id="right">
  <div id="top"><a href="#"><img src="images/chezai/icon_c.gif" width="16" height="15"  class="tb4"/>
  <strong>λ��:��ҳ</strong>&lt;�����ڲ鿴�ƶ�������ʷ���ݲ鿴</a>
  <img src="images/chezai/back.gif" width="48" height="20" class="tb3"/>
  <img src="img/util/back.gif" width="48" height="20"  class="tb3" style="cursor: pointer;" onclick="javascript:golist('startup.do','doStartUpCar');"/>
  <img src="images/chezai/chaxun.gif" width="58" height="21"  class="tb5" style="cursor: pointer;" onclick="javascript:query();" />
  <%-- 
  <img src="images/chezai/chaxun.gif" width="58" height="21"   style="cursor: pointer; display:${hiscarList==null?'none':'inline' }" onclick="javascript:exportpdf();" />
  --%>  
  <img src="images/chezai/da_confirm.gif" width="58" height="21"  class="tb6" style="cursor: pointer; display:${hiscarList==null?'none':'inline' }" onclick="printData(time1.value,time2.value);"/></div>
  <div id="center"></div>
  <div id="center">
    <table width="100%" id="bd3">
      <tr>
        <td width="65" style="width:65px;">
        <h3 style="text-align:left; font-size:12px;padding-left:0px; padding-right:0px; width:65px; color:#454343;">�������ƣ�</h3></td>
        <td style="width:160px;">
         <input type="text"  id="proName" name="proName" value="${project==null?param.proName:project.projectName }" readonly="readonly" />
        </td>
									
        <td width="63" style="width:65px;">
        <h3 style="text-align:left; font-size:12px;padding-left:0px; padding-right:0px; width:65px; color:#454343;">��ʼʱ�䣺</h3></td>
        <td style="width:160px;">
        <input  name="time1" id="d4311" value="${startup==null?param.time1:startup.btimeStr}"  class="Wdate" type="text"
									 readonly="readonly"/> 
          
          </td>
        <td width="65" style="width:65px;">
        <h3 style="text-align:left; font-size:12px;padding-left:0px; padding-right:0px; width:65px; color:#454343;">��ֹʱ�䣺</h3></td>
        <td style="width:160px;">
       		<input name ="time2" id="d4312" value="${startup==null?param.time2:startup.etimeDisplay}" class="Wdate" type="text"
									 readonly="readonly"/>
          </td>
        <td style="width:85px;"><h3 style="text-align:left; font-size:12px; padding-left:0px; padding-right:0px; width:95px; color:#454343;">��ѯ���������</h3></td>
        <td width="183"><span style="float:left;">
         <input id="timevalue" name="timevalue" type="text" size="4"  onblur="showInfo(this);"
										value="${param.timevalue==null?1:param.timevalue }" onKeyPress="return isNumber(event)"/>
		 <input type="hidden" name="queryinfoTip" id="queryinfoTip" value="${param.queryinfoTip }"/>
						<span id="Queryinfo">
										${param.queryinfoTip }
									</span>			
          </span></td>
      </tr>
    </table>
  </div>
  <div id="center">
    <table width="100%" id="bd3">
      <tr>
        <td width="65" style="width:65px;"><h3 style="text-align:left; font-size:12px;padding-left:0px; padding-right:0px; width:65px; color:#454343;">�����أ�</h3></td>
        <td style="width:160px;">
        
        <input name="beginaddr" id="beginaddr" value="${startup==null?param.beginaddr:startup.beginAddress }" readonly="readonly"/>
        
        </td>
        <td width="63" style="width:65px;"><h3 style="text-align:left; font-size:12px;padding-left:0px; padding-right:0px; width:65px; color:#454343;">Ŀ�ĵأ�</h3></td>
        <td style="width:160px;">
        <input name="endaddr" id="endaddr" value="${startup==null?param.endaddr:startup.endAddress }" readonly="readonly" />
          </td>
          
        <td width="65" style="width:65px;"><h3 style="text-align:left; font-size:12px;padding-left:0px; padding-right:0px; width:65px; color:#454343;">�����ˣ�</h3></td>
        <td style="width:160px;">
        
        <input name="carrier" id="carrier" value="${startup==null?param.carrier:startup.carrier }" readonly="readonly" />
          
          </td>
        <td style="width:85px;"><h3 style="text-align:left; font-size:12px; padding-left:0px; padding-right:0px; width:95px; color:#454343;">��ͣ�����</h3></td>
        <td width="163"><span style="float:left;">
          <input id="interval" name="interval" value="${startup==null?param.interval:startup.recordInterval}" 
												readonly="readonly"  size="3" />(S)
          </span></td>
      </tr>
    </table>
  </div>
  <div id="bottom">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" id="tb"  >
      <tr id="tb1">
        <td width="120">ʱ�� </td>
        <td width="60">T1</td>
        <td width="60">T2</td>
        <td width="60">T3</td>
        <td width="60">RH1 </td>
        
        <td width="65">��С�¶� </td>
        <td width="65">����¶�</td>
        <td width="65">ƽ���¶� </td>
        <td width="65">��Сʪ�� </td>
        <td width="65">���ʪ�� </td>
        <td width="65">ƽ��ʪ�� </td>
        <td width="65">����״̬ </td>
        <td width="65">����״̬</td>
        <!-- 
        <td width="65">γ��ֵ </td>
        <td width="65">����ֵ </td>
         -->
		<c:if test="${isShowAddress==1}"> 
        <td style="display:none" width="65">��γ��ֵ </td>
        <td class="address" style="display:none" width="65">ʵ��λ�� </td>
		</c:if>
      </tr>
      <logic:notEmpty name="hiscarList">
				<logic:iterate id="hiscar" name="hiscarList" indexId="irow">
				
					<tr ${irow%2==0?"class='altrow'":"" }>
						<td align="center"  nowrap="nowrap">
							<bean:write name="hiscar" property="updateTime" format="yyyy-MM-dd HH:mm:ss"/>
						</td>
						
						<td align="center" nowrap>	
							<c:if test="${hiscar.ai1==-300}">--</c:if>
							<c:if test="${hiscar.ai1!=-300&&fn:substring(hiscar.histAlarmDataStr,7,8)==fn:substring(hiscar.histAlarmDataStr,6,7)}">${hiscar.ai1}</c:if>
							<c:if test="${hiscar.ai1!=-300&&fn:substring(hiscar.histAlarmDataStr,7,8)==0}"><font color='red'>${hiscar.ai1}��</font></c:if>
							<c:if test="${hiscar.ai1!=-300&&fn:substring(hiscar.histAlarmDataStr,6,7)==0}"><font color='blue'>${hiscar.ai1}��</font></c:if>
						</td>
						
						<td align="center" nowrap="nowrap">
							<c:if test="${hiscar.ai2==-300}">--</c:if>
							<c:if test="${hiscar.ai2!=-300&&fn:substring(hiscar.histAlarmDataStr,5,6)==fn:substring(hiscar.histAlarmDataStr,4,5)}">${hiscar.ai2}</c:if>
							<c:if test="${hiscar.ai2!=-300&&fn:substring(hiscar.histAlarmDataStr,5,6)==0}"><font color='red'>${hiscar.ai2}��</font></c:if>
							<c:if test="${hiscar.ai2!=-300&&fn:substring(hiscar.histAlarmDataStr,4,5)==0}"><font color='blue'>${hiscar.ai2}��</font></c:if>
						</td>
						
						<td align="center"  nowrap="nowrap">
							<c:if test="${hiscar.ai3==-300}">--</c:if>
							<c:if test="${hiscar.ai3!=-300&&fn:substring(hiscar.histAlarmDataStr,3,4)==fn:substring(hiscar.histAlarmDataStr,2,3)}">${hiscar.ai3}</c:if>
							<c:if test="${hiscar.ai3!=-300&&fn:substring(hiscar.histAlarmDataStr,3,4)==0}"><font color='red'>${hiscar.ai3}��</font></c:if>
							<c:if test="${hiscar.ai3!=-300&&fn:substring(hiscar.histAlarmDataStr,2,3)==0}"><font color='blue'>${hiscar.ai3}��</font></c:if>
						</td>
						
						<td align="center"  nowrap="nowrap">
							<c:if test="${hiscar.ai4==-300}">--</c:if>
							<c:if test="${hiscar.ai4!=-300&&fn:substring(hiscar.histAlarmDataStr,1,2)==fn:substring(hiscar.histAlarmDataStr,0,1)}">${hiscar.ai4}</c:if>
							<c:if test="${hiscar.ai4!=-300&&fn:substring(hiscar.histAlarmDataStr,1,2)==0}"><font color='red'>${hiscar.ai4}��</font></c:if>
							<c:if test="${hiscar.ai4!=-300&&fn:substring(hiscar.histAlarmDataStr,0,1)==0}"><font color='blue'>${hiscar.ai4}��</font></c:if>
						</td>
						
						<td align="center" nowrap>
							${hiscar.minAi==-300?"--":hiscar.minAi }
						</td>
						<td align="center" nowrap>
							${hiscar.maxAi==-300?"--":hiscar.maxAi }
						</td>
						
						<td align="center" nowrap>
							<logic:equal value="-300" name="hiscar" property="avgAi" >
								--
							</logic:equal>
							<logic:notEqual value="-300" name="hiscar" property="avgAi" >
								<bean:write name="hiscar" property="avgAi" format="#.##"/>
							</logic:notEqual>
						</td>
						<td align="center" nowrap>
							${hiscar.ai4==-300?"--":hiscar.ai4 }						
						</td>
						<td align="center" nowrap>
							${hiscar.ai4==-300?"--":hiscar.ai4 }
						</td>
						<td align="center" nowrap>
							${hiscar.ai4==-300?"--":hiscar.ai4 }
						</td>
						<td align="center" nowrap>
							<c:if test="${hiscar.unloadStatus==-1}">--</c:if>
							<c:if test="${hiscar.unloadStatus==1}">����</c:if>
							<c:if test="${hiscar.unloadStatus==0}"><font color="green">ж��</font></c:if>
						</td>
						<td align="center" nowrap>
							${hiscar.alarmStatusStr}
						</td>
						<!-- 
						<td align="center" nowrap="nowrap">
						  ${hiscar.latitudeStr }
						</td>
						
						<td align="center" nowrap="nowrap">
						   ${hiscar.longitudeStr }				
						</td>
						 -->
						<c:if test="${isShowAddress==1}"> 
						<td style="display:none"align="center" nowrap="nowrap" class="latlng">
						   ${hiscar.address}			
						</td>
						<td class="address" style="display:none;" align="center" nowrap="nowrap" title="${hiscar.latitudeStr },${hiscar.longitudeStr }">
						  <img src="images/chezai/loading.png"	/>		
						</td>
						</c:if>
					</tr>
				</logic:iterate>			
				<!-- ����������ͳ�Ƶ����� -->		
				<%

					double avg[] = null  ;
					if(request.getAttribute("avg") != null)
					   avg = (double[])(request.getAttribute("avg"));
				 %>	
				<tr>
				   <c:if test="${isShowAddress==1}">
					<td colspan="14"><hr color="pink"></td>
				   </c:if>
				   <c:if test="${isShowAddress==0}">
					<td colspan="13"><hr color="pink"></td>
				   </c:if>
				</tr>
				
				<TR >
					
					<TD align="center" nowrap> 
						<font color="blue" size="4">ͳ��</font>
					</TD>
					<TD align="center" nowrap > 
						<font color="blue" size="3">T1</font>
					</TD>
					<TD align="center" nowrap > 
						<font color="blue" size="3">T2</font>
					</TD>
					<TD align="center" nowrap>
						<font color="blue" size="3">T3</font>
					</TD>
					<TD align="center" nowrap>
						<font color="blue" size="3">RH1</font>
					</TD>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					
				    <c:if test="${isShowAddress==1}">
					<td ></td>
				    </c:if>
				</TR>
				
				
					<tr >
						<td align="center" nowrap>
							<font color="blue" size="2">���</font>
						</td>
						<td align="center" nowrap>
							${max[0]==-300?"--":max[0]}
						</td>
						<td align="center" nowrap>
							${max[1]==-300?"--":max[1]}
						</td>
						<td align="center" nowrap>
							${max[2]==-300?"--":max[2]}
						</td>
						<td align="center" nowrap>
							${max[3]==-300?"--":max[3]}
						</td>
						<td></td>
					    <td></td>
					    <td></td>
					    <td></td>
					    <td></td>
					    <td></td>
					    <td></td>
					    <td></td>
						
						<c:if test="${isShowAddress==1}">
					     <td ></td>
				        </c:if>
					</tr>
					<tr >
						<td align="center" nowrap>
							<font color="blue" size="2">��С</font>
						</td>
						<td align="center" nowrap>
							${min[0]==-300?"--":min[0]}
						</td>
						<td align="center" nowrap>
							${min[1]==-300?"--":min[1]}
						</td>
						<td align="center" nowrap>
							${min[2]==-300?"--":min[2]}
						</td>
						<td align="center" nowrap>
							${min[3]==-300?"--":min[3]}
						</td>
						<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					
					<c:if test="${isShowAddress==1}">
					<td ></td>
				    </c:if>
					</tr>
					<tr >
					
						<td align="center" nowrap>
							<font color="blue" size="2">ƽ��</font>
						</td>
						
						<td align="center" nowrap>
							<%=avg[0]==-300?"--": new DecimalFormat("#.##").format(avg[0]) %>
						</td>
						<td align="center" nowrap>
							<%= avg[1]==-300?"--":new DecimalFormat("#.##").format(avg[1]) %>
						</td>
						<td align="center" nowrap>
							<%= avg[2]==-300?"--":new DecimalFormat("#.##").format(avg[2]) %>
						</td>
						<td align="center" nowrap>
							<%= avg[3]==-300?"--":new DecimalFormat("#.##").format(avg[3]) %>
						</td>
						<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					
					<c:if test="${isShowAddress==1}">
					<td ></td>
				    </c:if>
					</tr>
			</logic:notEmpty>		
    </table>
    <div>
    		<logic:empty name="hiscarList">
    			<div style="height: 450px">&nbsp;</div>
			</logic:empty>
			
				<%--Ϊ��Ҳû���ͳһ�����ݼ�¼���������и� --%>
			    <logic:notEmpty name="hiscarList">
			    	<bean:size id="rheight" name="hiscarList" />
			    	
			    	<c:if test="${rheight lt 10}">
			    		<div style="height: 250px">&nbsp;</div>
			    	</c:if>
			    	
			    	<c:if test="${rheight ge 10 }">
			    		<div style="height: 110px">&nbsp;</div>
			    	</c:if>
			    	
			    </logic:notEmpty>
    </div>
  
  </div>
</div>
<%-- 
<div style="align:center;display:none;"><span id="pdfcar">${pdfcar }</span></div>
--%>
</form>
<div class="clear"></div>
<div>
  <iframe scrolling="no" src="common/footer2.jsp" width=100% height=43 frameborder=0></iframe >
</div>
</body>
</html>
