<%@ page language="java"pageEncoding="gbk"%>
<%@page import="org.tbcc.biz.ProjectBiz"%>
<%@page import="org.tbcc.util.MySpringFactory"%>
<%@page import="org.tbcc.entity.TbccPrjType"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>ok</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<%--这个jsp页面是为了客户端软件而开发出来的页面,为了不需要登录系统、需要验证
		工程参数的合法性、这个jsp页面起一个控制作用类似与action
	 --%>

  </head>
  
  <body oncontextmenu="window.event.returnValue=false">
   <%
   		String projectId = request.getParameter("projectId") ;
   		String code = request.getParameter("code") ;
   		String sid = request.getParameter("sid");
   		if(projectId==null || projectId.equals("") || code==null || code.equals("")||sid==null || sid.equals("")){
   			out.println("传递了非法的参数!");
   			return ;
   		}
   		
   		try{
   			 Integer.parseInt(sid);
   		}catch(Exception e){
   			out.println("传递了非法的参数！");
   			return ;
   		}
   		
   		ProjectBiz projectBiz = (ProjectBiz)MySpringFactory.getInstance().getBean("projectBiz");
   		
   		TbccPrjType prjType =  projectBiz.getByProId(projectId) ;
   		
   		
   		if(prjType==null || prjType.getProjectAuthCode()==null || !prjType.getProjectAuthCode().equals(code)){
   			out.println("工程参数验证失败 ！");
   			return  ;
   		}
   		
   		request.setAttribute("projectName",prjType.getProjectName());
   		request.getRequestDispatcher("customer_hismap2.jsp").forward(request,response);
    %>
  </body>
</html>
