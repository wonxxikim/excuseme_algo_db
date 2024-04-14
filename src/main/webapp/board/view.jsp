<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" import="com.ssafy.trip.board.model.BoardDto"%>
<%
String root = request.getContextPath();
int num = Integer.parseInt(request.getParameter("articleno"));
BoardDto boardDto = (BoardDto) request.getAttribute("article");
String userId = (String)session.getAttribute("userId");

if(boardDto != null) {
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
             <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <script type ="text/javascript" src="apikey.js">
  </script>
    <link href="<%= root %>/assets/css/app.css" rel="stylesheet" />
    <title>SSAFY</title>
  </head>
  <body>
    <header class="navbar navbar-expand-lg bg-body-tertiary shadow-sm ps-5 pe-5" >
        <div class = "container-fluid">
            <a href="<%=root %>/index.jsp"><img class = 'col-4 ms-4' src = './img/nav_logo.png'></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <nav class="collapse navbar-collapse mr-1" id="navbarNav">
                <ul class="navbar-nav ms-auto me-2 grid gap-4">
                    <li class = "navbar-item">
                        <!-- 여기서 지도 html 추가해주세요!!!-->
                        <a href = "./mytour.jsp" class="nav-link active fs-5" aria-current="page" href="#">나만의 여행계획</a>
                    </li>
                    <li class = "navbar-item">
                        <a href = "<%=root %>/article?action=list" class="nav-link active fs-5" aria-current="page" href="#">게시판</a>
                    </li>
                    <li id = 'nav-login' class = "navbar-item">
                        <a href = "<%=root %>/user?action=mvlogin" class="nav-link active fs-5" aria-current="page" href="#">로그인</a>
                    </li>
                    <li id = 'nav-signup' class = "navbar-item">
                        <a href = "<%=root %>/user?action=mvsignup" class="nav-link active fs-5" aria-current="page" href="#">회원가입</a>
                    </li>
                    <!--로그인 하면 display 변경해주기-->
                    <li id = 'nav-logout' class = "navbar-item">
                        <a href = "<%=root %>/user?action=logout" class="nav-link active fs-5" aria-current="page" href="#" >로그아웃</a>
                    </li>
                    <li id = 'nav-mypage' class = "navbar-item">
                        <a href = "<%=root %>/user?action=mypage" class="nav-link active fs-5" aria-current="page" href="#" >마이페이지</a>
                    </li>
                </ul> 
            </nav>
        </div>
    </header>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3 shadow-sm bg-light text-center">
            <mark class="sky">글보기</mark>
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <div class="row my-2">
            <h2 class="text-secondary px-5"><%= boardDto.getArticleNo() %>. <%= boardDto.getSubject() %></h2>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="clearfix align-content-center">
                <img
                  class="avatar me-2 float-md-start bg-light p-2"
                  src="https://raw.githubusercontent.com/twbs/icons/main/icons/person-fill.svg"
                />
                <p>
                  <span class="fw-bold"><%= boardDto.getUserId() %></span> <br />
                  <span class="text-secondary fw-light"> <%= boardDto.getRegisterTime() %> 조회 : <%= boardDto.getHit() %> </span>
                </p>
              </div>
            </div>
            <div class="col-md-4 align-self-center text-end">댓글 : 17</div>
            <div class="divider mb-3"></div>
            <div class="text-secondary">
              <%= boardDto.getContent() %>
            </div>
            <div class="divider mt-3 mb-3"></div>
            <div class="d-flex justify-content-end">
              <button type="button" id="btn-list" class="btn btn-outline-primary mb-3">
                글목록
              </button>
              <button type="button" id="btn-mv-modify" class="btn btn-outline-success mb-3 ms-1">
                글수정
              </button>
              <button type="button" id="btn-delete" class="btn btn-outline-danger mb-3 ms-1">
                글삭제
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
    <script>
      document.querySelector("#btn-list").addEventListener("click", function () {
        location.href = "<%= root %>/article?action=list";
      });
      document.querySelector("#btn-mv-modify").addEventListener("click", function () {
        alert("글수정하자!!!");
        location.href = "<%= root %>/article?action=mvmodify&articleno=<%=num%>";
      });
      document.querySelector("#btn-delete").addEventListener("click", function () {
        alert("글삭제하자!!!");
        location.href = "<%= root %>/article?action=delete&articleno=<%=num%>";
      });
    </script>
  </body>
</html>
<%
} else {
%>
<script>
alert("글이 삭제되었거나 부적절한 URL 접근입니다.");
location.href = "<%=root%>/article?action=list";
</script>
<%	
}
%>
