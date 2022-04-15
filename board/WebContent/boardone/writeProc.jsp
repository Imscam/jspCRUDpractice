<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "boardone.BoardDao" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@ page import = "com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" scope="page" class="boardone.BoardFileDto">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	// ServletContext context = getServletContext();
	String uploadFilePath = "C:/dev2/WorkspaceJSP/board/WebContent/fileUpload";
	article.setRegdate( new Timestamp( System.currentTimeMillis() ) );
	article.setIp( request.getRemoteAddr() );
	BoardDao dbPro = BoardDao.getInstance();
	//dbPro.insertArticle(article);
	MultipartRequest multi = new MultipartRequest(
			request,
			uploadFilePath,
			1024*1024*3,
			"utf-8",
			new DefaultFileRenamePolicy());
	dbPro.setArticleWithFile(multi, article);
	response.sendRedirect("list.jsp");
%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>

</body>
</html>