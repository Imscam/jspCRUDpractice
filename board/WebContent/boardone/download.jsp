<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import = "boardone.BoardDao" %>
<%@ page import = "boardone.BoardFileDto" %>

<%
	String root = request.getSession().getServletContext().getRealPath("/");
 	BoardDao dbPro = BoardDao.getInstance();
 	BoardFileDto result = dbPro.getDownloadFileInfo(Integer.parseInt(request.getParameter("num")));
 	
 	String savePath = root + result.getFilePath();
 	InputStream is = null;
 	OutputStream os = null;	
 	File file = null;
 	
 	try {
 		file = new File(result.getFilePath(), result.getFileName());
 		is = new FileInputStream(file);
 		
 		response.reset();
 		response.setContentType("application/octet-stream; charset=utf-8");
 		
 		response.setHeader("Content-Length", ""+file.length());
 		
 		os = response.getOutputStream();
 		byte b[] = new byte[(int)file.length()];
 		
 		int leng = 0;
 		
 		while((leng = is.read(b)) > 0) {
 			os.write(b,0,leng);
 		}
 	} catch (Exception e) {
 		e.printStackTrace();
 	} finally {
 		if(is != null) is.close();
 		if(os != null) os.close();
 	}
 	response.sendRedirect("content.jsp?num="+request.getParameter("num"));
 	%>
 	
 	
	
