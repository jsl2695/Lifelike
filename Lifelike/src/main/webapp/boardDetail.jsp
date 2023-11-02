<%@page import="java.util.ArrayList"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.smhrd.domain.BoardDAO"%>
<%@page import="com.smhrd.domain.BoardDTO"%>
<%@page import="com.smhrd.domain.userInfo"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
session.getAttribute("loginMember");
%>
<%
	userInfo loginMember = null;
	if (session.getAttribute("loginMember") != null) {
  	loginMember = (userInfo)session.getAttribute("loginMember");}
	
	int boardNum = 0;
	if (request.getParameter("boardNum") != null) {
		boardNum = Integer.parseInt(request.getParameter("boardNum"));//게시글 번호 받아오기
}
	if (boardNum == 0) {//번호가 반드시 존재하는지 확인
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href = 'board.jsp'"); // 다시 게시글 페이지로 이동
		script.println("</script>");
}		
	BoardDTO BoardDTO = new BoardDAO().getBoardDTO(boardNum);
%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Title -->
    <title>Lifelike</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/bike.png">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
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
                        <a href="메인info.jsp" class="nav-brand">Lifelike</a>

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
                                            <li><a href="./국토종주/국토자전거길/01.아라자전거길.jsp">국토종주자전거길 정보</a></li>
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
                                            <li><a href="#">자전거 안전 교육</a>
                                                <ul class="dropdown">
                                                    <li><a href="./자전거 안전 정보/자전거 안전 교육.jsp">자전거 안전 교육</a></li>
                                                    <li><a href="./자전거 안전 정보/자전거 안전사고 사례.jsp">자전거 안전 사고 사례</a></li>
                                                    <li><a href="/02폴리곤검색test.html" onclick="openac(); return false;">사고 다발 구간</a></li>
                                                </ul>
                                            </li>
                                            
                                        </ul>
                                    </li>
                                    <li><a href="boardList.jsp">자유게시판</a></li>
                                    <li><a href="/0선택위치현재날씨(진짜).jsp" onclick="openwth(); return false;">날씨</a></li>
                                    <li><a href="https://www.bike.go.kr/map/roadMap.do?roadSn=1&roadType=1&xp=37.570595&yp=126.699981&key=2008148358544&zm=12" onclick="openmap(); return false;">자전거지도</a></li>

                                </ul>

                                <!-- Login/Register & Cart Button -->
                                <div class="login-register-cart-button d-flex align-items-center">
                                    <!-- Login/Register -->
                                    <c:choose>
                                		<c:when test="${empty loginMember}">   
                                			<a href="login.jsp">로그인</a>                             	
                                		</c:when>	
	                                	<c:otherwise>
	                                		<h4 style="color: rgb(255, 255, 255);">${loginMember.id}&nbsp;&nbsp;</h4>
	                                		<a href="LogoutCon">로그아웃/</a>
	                                		
	                                		<a href="update.jsp">/개인정보수정</a>
	                                	</c:otherwise> 
                                	</c:choose>
                                </div>
                            </div>
                            <!-- Nav End -->

                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <!-- ##### Latest Albums Area Start #####-->
        <!-- <section class="breadcumb-area bg-img bg-overlay" 상단 이상발생시 수정 -->
	<%
	BoardDAO dao = new BoardDAO();
	ArrayList<BoardDTO> boardList = dao.getList();
	pageContext.setAttribute("boardList", boardList);
	%>
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/상단배경2.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>자유게시판</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->
    <!-- ##### board_list_wrap Start ##### -->
    <section class="elements-area mt-30 section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="board_view_wrap">
                    <div class="board_view">
                    	<table>
                    		<tr>
	                        	<td>글번호 : <%= BoardDTO.getBoardNum() %></td>
							</tr>
							<tr>
								<td>제목 : <%= BoardDTO.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>;") %> </td>
							</tr>
							<tr>
								<td>작성자 : <%= BoardDTO.getId() %></td>
							</tr>
							<tr>
								<td>내용 : </td>
							</tr>	
							<tr>
								<td colspan="4"><td colspan="2" style="min-height: 200px; text-align: left;"><%= BoardDTO.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>;") %></td>
							</tr>
							<tr>
								<td>작성일 : <%= BoardDTO.getCreateDate() %></td>
							</tr>
						</table> 
						<button onclick="likePost(${board.boardNum})" class="" style="margin-right: 2px;">👍</button>
						<input type="button" data-boardNum="${board.boardNum}" value="삭제하기" onclick="location.href='delete.do?boardNum=${board.boardNum }';">
						<!-- 어떤걸 삭제할건지 보드 번호를 가져가야해서 ?뒤에 문장이나옴. -->
						<input type="button" data-boardNum="${board.boardNum}" data-title="${board.title}" data-boardFile="${board.boardFile}" data-content="${board.content}" value="수정" onclick="location.href='updateBoardForm.do?boardNum=${board.boardNum }';">
						<!-- 상세보기 페이지로 넘어갈때도 글번호 데이터를 넘겨서 가져가야해서 ?뒤에 문장을쓴다. -->
                    </div>
                </div>
            </div>
        </div>
     </section>       
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
                            <li><a href="maininfo.jsp">홈</a></li>
                            <li><a href="./추천자전거길/아름다운길info.jsp">추천 자전거길</a></li>
                            <li><a href="./국토종주/국토종주 자전거길 소개.jsp">국토종주 자전거길</a></li>
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
    <!-- jQery -->
	<script src="js/jquery-3.4.1.min.js"></script>
	<!-- popper js -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
	</script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.js"></script>
	<!-- owl slider -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
	</script>
	<!--  OwlCarousel 2 - Filter -->
	<script src="https://huynhhuynh.github.io/owlcarousel2-filter/dist/owlcarousel2-filter.min.js"></script>
	<!-- custom js -->
	<script src="js/custom.js"></script>
	<script src="./js/main.js"></script>
	<script src="js/placeholders.min.js"></script>
	
	<!-- 수정 삭제 기능 -->
	<script>
	const editButtons = document.querySelectorAll(".edit-btn");
	const deleteButtons = document.querySelectorAll(".delete-btn");
	
	editButtons.forEach(button => {
	    button.addEventListener("click", () => {
	        const boardNum = button.getAttribute("data-boardNum");
	        const title = button.getAttribute("data-title");
	        const boardFile = button.getAttribute("data-boardFile");
	        const content = button.getAttribute("data-content");
	        
	        const newTitle = prompt("제목을 수정해주세요:", title); 
	        const newBoardFile = prompt("파일을 수정해주세요:", boardFile); 
	        const newContent = prompt("내용을 수정해주세요:", content);
	
	        if (newTitle !== null && newContent !== null) {
	            const form = document.createElement("form");
	            form.method = "POST";
	            form.action = "BoardDTO";
	            const actionInput = document.createElement("input");
	            actionInput.type = "hidden";
	            actionInput.name = "action";
	            actionInput.value = "update";
	            const boardNumInput = document.createElement("input");
	            wbSeqInput.type = "hidden";
	            wbSeqInput.name = "boardNum";
	            wbSeqInput.value = boardNum;
	            const titleInput = document.createElement("input");
	            wbTitleInput.type = "hidden";
	            wbTitleInput.name = "title";
	            wbTitleInput.value = newTitle;
	            const contentInput = document.createElement("input");
	            contentInput.type = "hidden";
	            contentInput.name = "content";
	            contentInput.value = newContent;
	            form.appendChild(actionInput);
	            form.appendChild(boardNumInput);
	            form.appendChild(titleInput);
	            form.appendChild(boardFileInput);
	            form.appendChild(contentInput);
	            document.body.appendChild(form);
	            form.submit();
	        }
	    });
	});
	
	deleteButtons.forEach(button => {
	    button.addEventListener("click", () => {
	        const confirmDelete = confirm("정말 삭제하시겠습니까?");
	        const boardNum = button.getAttribute("data-boardNum");
	
	        if (confirmDelete) {
	            const form = document.createElement("form");
	            form.method = "POST";
	            form.action = "BoardDTO";
	            const actionInput = document.createElement("input");
	            actionInput.type = "hidden";
	            actionInput.name = "action";
	            actionInput.value = "delete";
	            const wbSeqInput = document.createElement("input");
	            wbSeqInput.type = "hidden";
	            wbSeqInput.name = "boardNum";
	            wbSeqInput.value = boardNum;
	            form.appendChild(actionInput);
	            form.appendChild(boardNumInput);
	            document.body.appendChild(form);
	            form.submit();
	        }
	    });
	});
	</script>
	
	<!-- 좋아요 기능 -->
	<script>
	function likePost(boardNum) {
	    if (confirm("추천하시겠습니까?")) {
	        window.location.href = "BoardDTO?action=like&boardNum=" + boardNum;
	    }
	}
	</script>
<script>
        function openmap() {
          var width = 1500; // 새 창의 가로 크기
          var height = 800; // 새 창의 세로 크기
          var left = (window.innerWidth - width) / 2; // 새 창의 가로 위치
          var top = (window.innerHeight - height) / 2; // 새 창의 세로 위치
        
          window.open("https://www.bike.go.kr/map/roadMap.do?roadSn=1&roadType=1&xp=37.570595&yp=126.699981&key=2008148358544&zm=12", "_blank", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top);
        }
        </script>
    <script>
        function openwth() {
        var width = 830; // 새 창의 가로 크기
        var height = 830; // 새 창의 세로 크기
        var left = (window.innerWidth - width) / 2; // 새 창의 가로 위치
        var top = (window.innerHeight - height) / 2; // 새 창의 세로 위치
        var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top;
        window.open("0선택위치현재날씨(진짜).html", "_blank", options);
        }
    </script>  
    
    <script>
        function openac() {
        var width = 830; // 새 창의 가로 크기
        var height = 830; // 새 창의 세로 크기
        var left = (window.innerWidth - width) / 2; // 새 창의 가로 위치
        var top = (window.innerHeight - height) / 2; // 새 창의 세로 위치
        var options = "width=" + width + ",height=" + height + ",left=" + left + ",top=" + top;
        window.open("02폴리곤검색test.html", "_blank", options);
        }
    </script> 
    
    <script>
        function infoa() {
      window.location.href = "./추천자전거길/아름다운길info.jsp";
    }
    function infob() {
      window.location.href = "./국토종주/국토종주 자전거길 소개.jsp";
    }
    function infoc() {
      window.location.href = "./자전거정보/자전거 개요.jsp";
    }
    </script>
</body>

</html>