<%@ page language="java"  pageEncoding="gbk" import="java.util.*"%>
<%@page import="org.tbcc.util.MySpringFactory"%>
<%@page import="org.tbcc.biz.ProjectBiz"%>
<%@page import="org.tbcc.biz.RealRefBiz"%>
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
  </head>
  <%-- show project image for fdap  --%>
  <body oncontextmenu="window.event.returnValue=false" >

    <%
    	 String projectId = request.getParameter("projectId");
    	 if (projectId == null || "".equals(projectId)|| !"1260".equals(projectId)) {
    	 		out.println("bad request");
    	 		response.setStatus(400);
    	 		return;
    	 }
	           String branchId=91+"";
	           
				ProjectBiz projectBiz = (ProjectBiz)MySpringFactory.getInstance().getBean("projectBiz");
				RealRefBiz realrefBiz = (RealRefBiz)MySpringFactory.getInstance().getBean("realrefBiz");
				//获取仓库工程
	
				List<TbccPrjType> refprojectList = projectBiz.getRefProjListBybId(new Long(branchId));
				 out.println("refprojectList=="+refprojectList.size());
				//获取楼层信息
				List<Map<String, Object>> maplist = realrefBiz.getRefFloorInfo(refprojectList);	
					
				request.setAttribute("floorName", "地面F1层");
				request.setAttribute("floorType", "1");
				request.setAttribute("floorNo", "1");
				request.getSession().setAttribute("refPrjList", refprojectList);
				request.setAttribute("floorList", maplist);
	            request.setAttribute("projectId", projectId);
	           
	            request.setAttribute("branchId", branchId);
				request.getRequestDispatcher("torefreal.jsp").forward(request,response);
				
     %>
  </body>
</html>
