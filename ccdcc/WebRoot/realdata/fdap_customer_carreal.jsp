<%@ page language="java"  pageEncoding="gbk" import="java.util.*"%>
<%@page import="org.tbcc.util.MySpringFactory"%>

<%@page import="org.tbcc.entity.TbccBranchType"%>
<%@page import="org.tbcc.biz.BranchBiz"%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>ok</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <%-- show project image for fdap  --%>
  <body oncontextmenu="window.event.returnValue=false" >

    <%
    	String branchId = 91+"" ;
		String projectId = request.getParameter("projectId");
    	 if (projectId == null || "".equals(projectId)|| !"1262".equals(projectId)) {
    	 		out.println("bad request");
    	 		response.setStatus(400);
    	 		return;
    	 }
		
		
		    
			   
				request.setAttribute("branchId", branchId);
				request.getRequestDispatcher("torealcar.jsp").forward(request,response);
			
		   
     %>
  </body>
</html>
