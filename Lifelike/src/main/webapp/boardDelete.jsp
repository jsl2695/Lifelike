<%@page import="com.smhrd.domain.userInfo"%>
<%@page import="com.smhrd.domain.BoardDAO"%>
<%@page import="com.smhrd.domain.BoardDTO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = null;
	if(session.getAttribute("id") != null) { //user가 접속이 되어있다면 세션값이 할당되어 있다면
	    id = (String) session.getAttribute("id");
	} 
	if (id == null) { //로그인 안되있으면 로그인하라고 안내
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('로그인을 하세요.')");
	    script.println("location.href = 'LoginCon.java");
	    script.println("</script>");
	} 

	//글을 수정할 권한이 있는지 확인
	int boardNum = 0; // 게시글 번호
	if (request.getParameter("boardNum") != null) {
		boardNum = Integer.parseInt(request.getParameter("boardNum"));//게시글 번호 받아오기
	}
	if (boardNum == 0) {//게시글이 존재하지 않는 다는 얘기
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('유효하지 않은 글입니다.')");
	    script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
	    script.println("</script>");
	}
	
	
	//현재 작성한 글이 작성한 본인이 한건지 확인, 수정권한 확인
	BoardDTO BoardDTO = new BoardDAO().getBoardDTO(boardNum);
	    if (!id.equals(BoardDTO.getId())) { // !userID세션값과 bbs.getUserID 작성한사람 동일한지
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('권한이 업습니다.')");
	        script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
	        script.println("</script>");
	    } else { 
	    	BoardDAO BoardDAO = new BoardDAO();
	    	BoardDAO.delete(boardNum);
	    	PrintWriter script = response.getWriter();
	    	script.println("<script>");
	    	script.println("location.href = 'board.jsp'");
	    	script.println("</script>");
		}
%>
</body>
</html>