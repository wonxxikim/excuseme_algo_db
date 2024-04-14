<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
String root = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7aeaed0280ba9bbc884537104a02177&libraries=services"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/map.css">
    <title>저기요 EXCUSE ME</title>
</head>
<style>
    
</style>
<body>
    <header class="navbar navbar-expand-lg bg-body-tertiary shadow-sm ps-5 pe-5" >
        <div class = "container-fluid">
            <a href = "<%=root %>/user?action=main"><img class = 'col-4 ms-4' src = './img/nav_logo.png'></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <nav class="collapse navbar-collapse mr-1" id="navbarNav">
                <ul class="navbar-nav ms-auto me-2 grid gap-4">
                    <li class = "navbar-item">
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
    <main>
        <div class = 'container-1'>
            <div class = 'container-1-div'>
                <div class = 'container-1-left'>
                    <p><span class = 'text-impact'>저기요 Excuse me</span>에서<br> 대한민국에 숨겨진 관광지를<br>찾아보세요!</p>
                    <div class = 'container-1-buttons'>
                        <a class = 'btn-1' id="mapBtn">관광지 찾으러가기 ></a>
                        <a href="<%=root %>/article?action=list" class = 'btn-2'>후기 보러 가기 ></a>
                    </div>
                </div>
                <img class = "container-1-img"  src ='./img/main1.png'>
            </div>
        </div>
        <div class = 'container-3'>
            <div class = 'container-3-div'>
                <img src="./img/nav_logo.png">
                <p class = 'explain-light'><span class = 'explain-bold'>‘저기요 EXCUSE ME’</span>는<br>
                    마치 여행지 현지인들에게 관광지 안내를 받는 것처럼<br>
                    숨겨진 관광지에 대한 정보를 얻을 수 있는 플랫폼<br>
                    이라는 뜻을 가지고 있습니다.</p>
            </div>

        </div>
        <div class = 'container-2'>
            <div class = 'explain-container1-div'>
                <div class = 'explain-container1'>
                    <div class = 'explain-text'>
                        <div class = 'explain-bold'>
                            <p>어느 지역으로 여행을 가시나요?</p>
                            <p>지역 기반으로 관광지를 추천해드려요</p>
                        </div>
                        <div class = 'explain-light'>
                            <p>여행을 계획 중인 지역을 입력해주세요</p>
                            <p>편하게 이동 시간을 계획할 수 있도록</p>
                            <p>지도와 함께 관광지에 대한 정보를 제공하고 있어요</p>
                        </div>
                    </div>
                    <img src = './img/main2.png'>
                </div>
            </div>
            <div class = 'explain-container1-div'>
                <div class = 'explain-container1'>
                    <div class = 'explain-text'>
                        <div class = 'explain-bold'>
                            <p>관광지에 대한 후기를 바로 확인할 수 있어요</p>
                        </div>
                        <div class = 'explain-light'>
                            <p>관광지에 대한 평가가 궁금하신가요?</p>
                            <p>먼저 여행을 다녀온 사람들의 후기를 바로 확인해보세요 !</p>
                        </div>
                    </div>
                    <img src = './img/main3.png'>
                </div>
                
            </div>
        </div>
        <div id="myModal">
            <!-- Modal content -->
            <div id="myModal-content">
                <span class="close">&times;</span>
                <div id="search">
                    <select id="areaCode">
                        <option value="none">🗺지역</option>
                        <option value="1">서울</option>
                        <option value="2">인천</option>
                        <option value="3">대전</option>
                        <option value="4">대구</option>
                        <option value="5">광주</option>
                        <option value="6">부산</option>
                        <option value="7">울산</option>
                        <option value="8">세종특별자치시</option>
                        <option value="31">경기도</option>
                        <option value="32">강원도</option>
                        <option value="33">충청북도</option>
                        <option value="34">충청남도</option>
                        <option value="35">경상북도</option>
                        <option value="36">경상남도</option>
                        <option value="37">전라북도</option>
                        <option value="38">전라남도</option>
                        <option value="39">제주도</option>
                    </select>
                    <select id="contentTypeId">
                        <option value="none">🏂관광타입</option>
                        <option value="12">관광지</option>
                        <option value="14">문화시설</option>
                        <option value="15">축제공연행사</option>
                        <option value="25">여행코스</option>
                        <option value="28">레포츠</option>
                        <option value="32">숙박</option>
                        <option value="38">쇼핑</option>
                        <option value="39">음식점</option>
                    </select>
                    <button onclick="searchTouristSpots()">검색</button>
                </div>
                <div id="container">
                    <div id="map"></div>
                    <div id="sidebar"></div>
                </div>
            </div>
        </div>
    </main>
    <footer class="navbar bg-dark nav justify-content-center pt-4 pb-4" data-bs-theme="dark">
        <p class = "text-light">© SSAFY 광주_4반 김민주 박지훈 신민경 이지표</p>
    </footer>
</body>
<script>

document.addEventListener("DOMContentLoaded", function () {
	 var uid = '<%=session.getAttribute("userId")%>';
	 console.log(uid);
    if (uid!='null') loginMode();
    else unloginMode();
});

function unloginMode() {
    document.getElementById('nav-login').style.display = 'initial';
    document.getElementById('nav-signup').style.display = 'initial';
    document.getElementById('nav-logout').style.display = 'none';
    document.getElementById('nav-mypage').style.display = 'none';
}
function loginMode() {
    document.getElementById('nav-login').style.display = 'none';
    document.getElementById('nav-signup').style.display = 'none';
    document.getElementById('nav-logout').style.display = 'initial';
    document.getElementById('nav-mypage').style.display = 'initial';
}

document.getElementById("nav-logout").addEventListener("click", function () {
    localStorage.removeItem('login');
    alert('로그아웃 되었습니다.')
    window.onload();
})
</script>
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
</script>
<%@include file="./map.jsp" %>
<script>
    AOS.init();
</script>
</html>
