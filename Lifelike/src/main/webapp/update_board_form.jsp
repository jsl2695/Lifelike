<%@page import="com.smhrd.domain.BoardDTO"%>
<%@page import="com.smhrd.domain.BoardDAO"%>

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>BLUE WHEEL</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/bike.png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
 <%
	String id = null;
	if(session.getAttribute("id") != null) {
	    id = (String) session.getAttribute("id"); //로그인한 사람들은 해당아이디가 userID에 저장
	}
	
	if (id == null) {//로그인이 안됐을 경우
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('로그인을 하세요.')");
	    script.println("location.href = 'kakaologin.html'"); // 다시 게시글 페이지로 이동
	    script.println("</script>");
	}
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
	//현재 작성한 글이 작성한 본인이 한건지 확인
	BoardDTO BoardDTO = new BoardDAO().getBoardDTO(boardNum);
	if (!id.equals(BoardDTO.getId())) { // !userID세션값과 bbs.getUserID 작성한사람 동일한지
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('권한이 업습니다.')");
	    script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
	    script.println("</script>");
	}
%>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis"></div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        <!-- Navbar Area -->
        <div class="oneMusic-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="oneMusicNav">

                        <!-- Nav brand -->
                        <a href="index.jsp" class="nav-brand">블루힐</a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            <div class="classynav">
                                <ul>
                                    
                                    <li><a href="#">추천 자전거 여행길</a>
                                        <ul class="dropdown">
                                            <li><a href="./추천자전거길/아름다운길info.jsp">아름다운 자전거길 100선</a></li>
                                            <li><a href="./추천자전거길/지자체명품info.jsp">지자체 명품 자전거길</a></li>
                                            <li><a href="./추천자전거길/바다를 품은 섬 자전거길 23선/01.강화군(지붕 없는 박물관) 자전거길.jsp">바다를 품은 자전거길</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">국토종주</a>
                                        <ul class="dropdown">
                                            <li><a href="./국토종주/국토종주 자전거길 소개.jsp">소개</a></li>
                                            <li><a href="./국토종주/국토자전거길/아라자전거길.jsp">국토종주자전거길 정보</a></li>
                                            <li><a href="./국토종주/국토종주인증info.jsp">종주인증</a>
                                        </ul>
                                    </li>
                                    <li><a href="#">유용한정보</a>
                                        <ul class="dropdown">
                                            <li><a href="#">자전거정보</a>
                                                <ul class="dropdown">
                                                    <li><a href="./자전거정보/자전거 개요.jsp">자전거 개요</a></li>
                                                    <li><a href="./자전거정보/전기자전거.jsp">전기자전거</a></li>
                                                    <li><a href="./자전거정보/공유자전거.jsp">지자체별 공유 자전거</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">자전거 안전정책</a>
                                                <ul class="dropdown">
                                                    <li><a href="./자전거안전정책/자전거 안전 교육.jsp">자전거안전 교육</a></li>
                                                    <li><a href="#">통계/관련법령</a></li>
                                                    <li><a href="#">사고 다발 구간</a></li>
                                                </ul>
                                            </li>
                                            
                                        </ul>
                                    </li>
                                    <li><a href="freeboardList.jsp">자유게시판</a></li>
                                    <li><a href="/0선택위치현재날씨(진짜).jsp" onclick="openwth(); return false;">날씨</a></li>
                                    <li><a href="https://www.bike.go.kr/map/roadMap.do?roadSn=1&roadType=1&xp=37.570595&yp=126.699981&key=2008148358544&zm=12" onclick="openmap(); return false;">자전거지도</a></li>

                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                   
                               		<h4></h4>
                               		<a href="LogoutCon">로그아웃</a>
                               		<a href="update.jsp">개인정보수정</a>

                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>게시글 수정</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->
    <!-- ##### board_list_wrap Start ##### -->
    <div class="board_write_wrap">
        <!-- Contact Form Area -->
        <div class="board_write">
            <form action="updateAction.jsp?boardNum=<%=boardNum%> method="post">
                <div class="top">
                    <div class="form-group">
                        <input type="text" class="form-control" id="title" placeholder="제목" value="<%=BoardDTO.getTitle() %>">
                    </div>
                    <div class="form-group">
                        <input type="file" multiple='multiple' accept='image/*' class="form-control" id="file" placeholder="File" value="<%=BoardDTO.getBoardFile() %>">
                    </div>
                    <div class="form-group">
                        <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="내용 입력"><%=BoardDTO.getContent() %></textarea>
                    </div>

                    <div class="oneMusic-buttons-area mb-100">
                        <div class="load-more-btn text-center">
                            <a href="#" class="btn oneMusic-btn btn-2 m-2">글수정</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>       
        <!-- ##### board_list_wrap End ##### -->
    <!-- ##### Elements Area Start ##### -->
    
    <!-- ***** Elements Area End ***** -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row d-flex flex-wrap align-items-center">
                <div class="col-12 col-md-6">
                    <a href="#"><img src="img/core-img/logo.png" alt=""></a>
                    <p class="copywrite-text"><a href="#"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                </div>

                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <ul>
                            <li><a href="#">홈</a></li>
                            <li><a href="#">Albums</a></li>
                            <li><a href="#">Events</a></li>
                            <li><a href="#">News</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>

