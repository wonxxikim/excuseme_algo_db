<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/mytour.css" />

    <style>
    /* 폰트 설정 start */
    /* 만약 폰트 크기를 키웠는데 적용이 안된다면 ? font-weight 크기 100단위로 조절해주기 */
    *{
        font-family: 'Pretendard-Regular';
        margin:0;
        padding:0;
    }
    main{
        min-height: 100vh;
    }
    .container-fluid{
        max-width:1280px;
        display: flex;
        
    }
    /* 폰트 설정 end */
</style>
    <title>저기요 EXCUSE ME</title>
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

    <main class="map_wrap">
        <div id="map" style="width:100%;height:100%;margin:auto;position:relative;overflow:hidden;"></div>

        <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                        <button type="submit">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr>
            <ul id="placesList">
            </ul>
            <div id="pagination"></div>
        </div>

        <div id="placesListContainer" class="bg_white">
            <ul id="clickedPlacesList"></ul>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=acd23fc0b913a085a3ad102649e3b5dc&libraries=services"></script>
<script type="text/javascript" src="./js/mytour.js"></script>
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F    7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
</script>
<script type = "module" src = "./js/main.js"></script>
<script>
    AOS.init();
</script>
</html>

