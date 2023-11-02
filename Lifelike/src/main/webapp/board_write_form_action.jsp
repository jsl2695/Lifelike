<%@page import="com.smhrd.domain.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.smhrd.domain.userInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="BoardDTO" class="com.smhrd.domain.BoardDTO" scope="page" />
<jsp:setProperty name="BoardDTO" property="title" />
<jsp:setProperty name="BoardDTO" property="boardFile" />
<jsp:setProperty name="BoardDTO" property="content" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	userInfo loginMember = null;
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String boardFile = request.getParameter("boardFile");
	String createDate = request.getParameter("createDate");
	if (session.getAttribute("loginMember") != null) {
		loginMember = (userInfo)session.getAttribute("loginMember");
			
	
         if (title == null || content == null) {
         	System.out.print("title"+title+"content"+content);
             	PrintWriter script = response.getWriter();
             	script.println("<script>");
             	script.println("alert('입력이 안 된 사항이 있습니다.')");
             	script.println("history.back()");
             	script.println("</script>");
         } else {
        	 BoardDAO BoardDAO = new BoardDAO();
		     int result = BoardDAO.write(title, content, boardFile, loginMember.getId(), createDate);
		     if (result == -1) { // -1일 경우 데이터베이스 오류
		         PrintWriter script = response.getWriter();
		         script.println("<script>");
		         script.println("alert('글쓰기에 실패했습니다.')");
		         script.println("history.back()");
		         script.println("</script>");
		     } else { // 입력성공
		         PrintWriter script = response.getWriter();
		         script.println("<script>");
		         script.println("location.href = 'boardDetail.jsp'");
		         script.println("</script>");
		     }
		
		
		}

	}


		if(loginMember==null)  { //로그인 안되있으면 로그인하라고 안내
        		PrintWriter script = response.getWriter();
        		script.println("<script>");
        		script.println("alert('로그인을 하세요.')");
        		script.println("location.href = 'LoginCon'");
        		script.println("</script>");
    } 

%>
</body>
</html>