<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,com.ssafy.trip.board.model.BoardDto, com.ssafy.trip.board.model.dao.BoardDaoImpl"%>
<%
String root = request.getContextPath();
String userId = (String) session.getAttribute("userId");
List<BoardDto> list = (List<BoardDto>) request.getAttribute("articles");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous" />

<title>board</title>
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<script type="text/javascript" src="apikey.js">
  </script>

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
				<h2 class="my-3 py-3  text-center" style="color: rgb(119, 76, 12)">
					<span>여행 계획 </span>게시판
				</h2>
			</div>
			<div class="col-lg-8 col-md-10 col-sm-12">
				<div class="row align-self-center mb-2">
					<div class="col-md-2 text-start">
						<button type="button" id="btn-mv-register"
							class="btn btn-outline-primary btn-sm">+</button>
					</div>
					<div class="col-md-7 offset-3">
					<select id="key-sort"
								class="form-select form-select-sm ms-5 me-1 w-50"
								aria-label="최신순">
								<option value="latest" selected>최신순</option>
								<option value="popular">조회순</option>
							</select>
						<form class="d-flex">
							 <select id="key"
								class="form-select form-select-sm ms-5 me-1 w-50"
								aria-label="검색조건">
								<option selected>검색조건</option>
								<option value="articleno">글번호</option>
								<option value="subject">제목</option>
								<option value="userid">작성자</option>
							</select>
							<div class="input-group input-group-sm">
								<input type="text" class="form-control" placeholder="검색어..." />
								<button class="btn" style="background: burlywood; color: #fff"
									" type="button">search</button>
							</div>
						</form>
					</div>
				</div>
				<table class="table table-hover">
					<thead>
						<tr class="text-center">
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">조회수</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<%
						for (BoardDto boardDto : list) {
						%>
						<tr class="text-center">
							<th scope="row"><%=boardDto.getArticleNo()%></th>
							<td class="text-start"><a href="#"
								class="article-title link-dark"
								data-no="<%=boardDto.getArticleNo()%>"
								style="text-decoration: none"> <%=boardDto.getSubject()%>
							</a></td>
							<td><%=boardDto.getUserId()%></td>
							<td><%=boardDto.getHit()%></td>
							<td><%=boardDto.getRegisterTime()%></td>
						</tr>
						<%
}
%>
					</tbody>
				</table>
			</div>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
    </script>
    
    
    
	<script>
	// 퀵 정렬 함수
	  function quickSort(arr, compareFunc) {
	    if (arr.length <= 1) {
	      return arr;
	    }

	    const pivot = arr[0];
	    const left = [];
	    const right = [];

	    for (let i = 1; i < arr.length; i++) {
	      if (compareFunc(arr[i], pivot) < 0) {
	        left.push(arr[i]);
	      } else {
	        right.push(arr[i]);
	      }
	    }

	    return quickSort(left, compareFunc).concat(pivot, quickSort(right, compareFunc));
	  }
// 비교 함수: 최신순으로 정렬
function compareByLatest(a, b) {
  let dateA = new Date(a.cells[4].innerText);
  let dateB = new Date(b.cells[4].innerText);
  return dateB - dateA;
}

// 비교 함수: 조회순으로 정렬
function compareByPopularity(a, b) {
  let hitA = parseInt(a.cells[3].innerText);
  let hitB = parseInt(b.cells[3].innerText);
  return hitB - hitA;
}
// 최신순 정렬 함수
function sortByLatest() {
  let list = document.querySelector("tbody");
  let sortedList = quickSort(Array.from(list.children), compareByLatest);
  list.innerHTML = "";
  sortedList.forEach(item => list.appendChild(item));
}

// 조회순 정렬 함수
function sortByPopularity() {
  let list = document.querySelector("tbody");
  let sortedList = quickSort(Array.from(list.children), compareByPopularity);
  list.innerHTML = "";
  sortedList.forEach(item => list.appendChild(item));
}
  // key-sort 변경 시 정렬 함수 호출
  document.querySelector("#key-sort").addEventListener("change", function () {
    let sortBy = this.value;
    if (sortBy === "latest") {
      sortByLatest();
    } else if (sortBy === "popular") {
      sortByPopularity();
    }
  });

  
  
  
  // 글 제목 클릭 시 이벤트 핸들러
  let titles = document.querySelectorAll(".article-title");
  titles.forEach(function (title) {
    title.addEventListener("click", function () {
      console.log(this.getAttribute("data-no"));
      location.href = "<%=root%>/article?action=view&articleno=" + this.getAttribute("data-no");
    });
  });

  
  
  
  // 글 작성 페이지로 이동 버튼 클릭 시 이벤트 핸들러
  document.querySelector("#btn-mv-register").addEventListener("click", function () {
    location.href = "<%=root%>/article?action=mvwrite";
  });
</script>

</body>
</html>
