<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.FileOutputStream,
 java.io.IOException,
 java.util.List,
 org.tbcc.biz.HisCarBiz,
 org.tbcc.entity.TbccBaseHisCar,
 com.lowagie.text.Document,
 com.lowagie.text.DocumentException,
 com.lowagie.text.Element,
 com.lowagie.text.Font,
 com.lowagie.text.HeaderFooter,
 com.lowagie.text.Image,
 com.lowagie.text.PageSize,
 com.lowagie.text.Paragraph,
 com.lowagie.text.Phrase,
 com.lowagie.text.pdf.BaseFont,
 com.lowagie.text.pdf.PdfPCell,
 com.lowagie.text.pdf.PdfPTable,
 com.lowagie.text.pdf.PdfWriter,
 org.tbcc.util.MySpringFactory,
 org.tbcc.biz.ProjectBiz,
 org.tbcc.entity.TbccPrjType,
 java.awt.Color,
 java.text.DecimalFormat
 "
 %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  String proId=request.getParameter("proId");
  String startTime=request.getParameter("startTime");
  String endTime=request.getParameter("endTime");
  String interval=request.getParameter("interval");
  Integer sid_int=Integer.parseInt(request.getParameter("sid_int"));
  Long timevalue_long=Long.valueOf(request.getParameter("timevalue_long"));

  HisCarBiz hiscarBiz=(HisCarBiz)MySpringFactory.getInstance().getBean("hiscarBiz");
  ProjectBiz proBiz=(ProjectBiz)MySpringFactory.getInstance().getBean("projectBiz");
  //List<FdapCarHisData> carhisall=carhisbiz.getCarHisAll(tablename, startupid,"1");
  //获取历史数据
  List<TbccBaseHisCar> carhisall =hiscarBiz.getHisCarBySidAndTime(proId, startTime, endTime, interval,sid_int,timevalue_long);
 
  TbccPrjType project = proBiz.getByProId(proId);		//获取要查询的项目  为了得到车载的名字
 // List<Object> listMMA=hiscarBiz.getCarHisMMA(tablename, sid);
  
            Document document = new Document();//建立一个Document对象
		    document.setPageSize(PageSize.A4);//设置页面大小
		    try{
		     PdfWriter.getInstance(document,new FileOutputStream("d:\\"+project.getProjectName()+"历史数据.pdf"));//建立一个PdfWriter对象
		   
		     BaseFont bfChinese = BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);//设置中文字体
		      Font headFont = new Font(bfChinese, 10, Font.BOLD);//设置字体大小 
		     // Font headFont3 = new Font(bfChinese, 10, Font.NORMAL,new Color(255, 0, 0));//设置字体大小
		      Font headFont2 = new Font(bfChinese, 10, Font.NORMAL);//设置字体大小
		      Font headFont3 = new Font(bfChinese, 10, Font.NORMAL,new Color(255, 0, 0));//设置字体大小
/*//设置页眉
		      Image img1 = Image.getInstance("LOGO.jpg");
		      HeaderFooter header=new HeaderFooter(new Phrase("这仅仅是个页眉，页码在页脚处",headFont2),false);  
              
	            //设置是否有边框等  
	           header.setBorder(Rectangle.NO_BORDER);  
	            header.setBorder(Rectangle.BOTTOM);  
	            header.setAlignment(1);  
	            header.setBorderColor(Color.red);  
	            document.setHeader(header); */
//设置页脚 
		      HeaderFooter footer=new HeaderFooter(new Phrase("-",headFont2),new Phrase("-",headFont2));  
	            /** 
	             * 0是靠左 
	             * 1是居中 
	             * 2是居右 
	             */  
	            footer.setAlignment(1); 
	            footer.setBorder(0);
	            // footer.setBorderColor(Color.red);  
	            //footer.setBorder(Rectangle.BOX);  
	            document.setFooter(footer);          
	            /** 
	             * 页眉页脚的设置一定要在open前设置好 
	             */    
		      float[] widths = {260f,120f, 120f, 120f, 140f};//设置表格的列宽
		      document.open(); 
		      PdfPTable table = new PdfPTable(widths);//建立一个pdf表格
		      table.setSpacingBefore(120f);//设置表格上面空白宽度
		      
		   table.setTotalWidth(535);//设置表格的宽度             
		   table.setLockedWidth(true);//设置表格的宽度固定
		   //table.getDefaultCell().setBorder(0);//设置表格默认为无边框
		      PdfPCell cell;
	 //设置表头的公司标志
		      Image img = Image.getInstance("LOGO.jpg");
		      
		       cell = new PdfPCell(img, true);//建立一个单元格
			   cell.setBorder(0);//设置单元格无边框
			   cell.setColspan(5);//设置合并单元格的列数
			   //cell.setFixedHeight(20);//设置内容距离表格的高度
			   cell.setHorizontalAlignment(Element.ALIGN_LEFT);//设置内容水平居中显示
			   cell.setVerticalAlignment(Element.ALIGN_TOP);//设置内容垂直居中显示
			   cell.setFixedHeight(44f);//设置单元格固定高度
			   table.addCell(cell);//增加单元格
			   table.setHeaderRows(1); 
	//添加数据的基本信息	      
			   cell = new PdfPCell(new Paragraph("仓库名:"+project.getProjectName()+"    起始时间:"+startTime+"    结束时间:"+endTime,headFont));//建立一个单元格
			  // cell.setBorder(0);//设置单元格无边框
			   cell.setColspan(5);//设置合并单元格的列数
			   //cell.setFixedHeight(20);//设置内容距离表格的高度
			   cell.setHorizontalAlignment(Element.ALIGN_CENTER);//设置内容水平居左显示
			   cell.setVerticalAlignment(Element.ALIGN_MIDDLE);//设置内容垂直居中显示
			   cell.setFixedHeight(25f);//设置单元格固定高度
			   table.addCell(cell);//增加单元格 
//添加数据的表头部分	   
		   cell = new PdfPCell(new Paragraph("更新时间",headFont));//建立一个单元格
		   //cell.setBorder(0);//设置单元格无边框
		   //cell.setColspan(7);//设置合并单元格的列数
		   //cell.setFixedHeight(20);//设置内容距离表格的高度
		   cell.setHorizontalAlignment(Element.ALIGN_CENTER);//设置内容水平居中显示
		   cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		   table.addCell(cell);//增加单元格
		   
		   cell = new PdfPCell(new Paragraph("T1",headFont));
		   cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		   cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		   table.addCell(cell);
		   
		   cell = new PdfPCell(new Paragraph("T2",headFont));	     	  
		   cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		   cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		   table.addCell(cell);
		   
		   cell = new PdfPCell(new Paragraph("T3",headFont));	     	  
		   cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		   cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		   table.addCell(cell);
		   
		   cell = new PdfPCell(new Paragraph("报警状态",headFont));	     	  
		   cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		   cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		   table.addCell(cell);
		   
		 //  table.setHeaderRows(1);    
		    
		   for (int i =0; i < carhisall.size(); i++){
			   if(carhisall.get(i).getAlarmStatus()==2){
				   String[] bogusData = {carhisall.get(i).getUpdateTime().toString(),
			                 carhisall.get(i).getAi1().toString(),
			                 carhisall.get(i).getAi2().toString(),
			                 carhisall.get(i).getAi3().toString(),
			                 "正常" 
			                 };
	               for (int x = 0; x < 5; x++) {   
	    	            cell = new PdfPCell(new Paragraph(bogusData[x],headFont2));	     	  
			            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    	            table.addCell(cell);   
	               }   
			   }else{
				   String[] bogusData = {carhisall.get(i).getUpdateTime().toString(),
			                 carhisall.get(i).getAi1().toString(),
			                 carhisall.get(i).getAi2().toString(),
			                 carhisall.get(i).getAi3().toString(),
			                 "报警" 
			                 };
	               for (int x = 0; x < 4; x++) {   
	    	            cell = new PdfPCell(new Paragraph(bogusData[x],headFont2));	     	  
			            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
			            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	    	            table.addCell(cell);   
	               }  
	                cell = new PdfPCell(new Paragraph(bogusData[4],headFont3));	     	  
		            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
   	                table.addCell(cell); 
				   
			   }
			  
			}   
		
			
			 //显示 最大值  最小值 平均值	
          	Object[] calc = hiscarBiz.getCalcValue(carhisall);
           //最大值
         
            double[] info=(double[])calc[1];
          
            cell = new PdfPCell(new Paragraph("最大值：",headFont));	     	  
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setBackgroundColor(Color.gray); 
            table.addCell(cell);//增加单元格
            for(int i=0;i<3;i++){
          	 if(info[i]==-300){
          		   cell = new PdfPCell(new Paragraph("--",headFont2));	     	  
	               cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	               cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	               cell.setBackgroundColor(Color.gray); 
	               table.addCell(cell);//增加单元格
          	 }else{
          		   cell = new PdfPCell(new Paragraph((info[i]+"").toString(),headFont2));	     	  
	               cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	               cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	               cell.setBackgroundColor(Color.gray); 
	               table.addCell(cell);//增加单元格
          	 } 
            }
            cell = new PdfPCell(new Paragraph("",headFont2));	     	  
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setBackgroundColor(Color.gray); 
            table.addCell(cell);//增加单元格
           //最小值
           
            double[] info1=(double[])calc[0];
            cell = new PdfPCell(new Paragraph("最小值：",headFont));	     	  
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setBackgroundColor(Color.gray); 
            table.addCell(cell);//增加单元格
            for(int i=0;i<3;i++){
          	  if(info1[i]==-300){
          		   cell = new PdfPCell(new Paragraph("--",headFont2));	     	  
	               cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	               cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	               cell.setBackgroundColor(Color.gray); 
	               table.addCell(cell);//增加单元格
           	 }else{
           		   cell = new PdfPCell(new Paragraph((info1[i]+"").toString(),headFont2));	     	  
	               cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	               cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	               cell.setBackgroundColor(Color.gray);
	               table.addCell(cell);//增加单元格
           	 } 
           }
            cell = new PdfPCell(new Paragraph("",headFont2));	     	  
            cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
            cell.setBackgroundColor(Color.gray); 
            table.addCell(cell);//增加单元格
            //平均值
          
           double[] info2=(double[])calc[2];
     
           cell = new PdfPCell(new Paragraph("平均值：",headFont));	     	  
           cell.setHorizontalAlignment(Element.ALIGN_CENTER);
           cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
           cell.setBackgroundColor(Color.gray);
           table.addCell(cell);//增加单元格
           for(int i=0;i<4;i++){
          	 if(info1[i]==-300){
          		   cell = new PdfPCell(new Paragraph("--",headFont2));	     	  
	               cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	               cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	               cell.setBackgroundColor(Color.gray);
	               table.addCell(cell);//增加单元格
           	 }else{
           		   cell = new PdfPCell(new Paragraph(new DecimalFormat("#.##").format(info2[i]),headFont2));	     	  
	               cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	               cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	               cell.setBackgroundColor(Color.gray); 
	               table.addCell(cell);//增加单元格
           	 } 
          }
           cell = new PdfPCell(new Paragraph("",headFont2));	     	  
           cell.setHorizontalAlignment(Element.ALIGN_CENTER);
           cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
           cell.setBackgroundColor(Color.gray); 
           table.addCell(cell);//增加单元格
		   document.add(table);

		     } catch (DocumentException de) {
		     System.err.println(de.getMessage());
		           
		     } 
		     catch (IOException ioe) {
		     System.err.println(ioe.getMessage());
		           
		      }
		    document.close();
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <br>
  </body>
</html>
