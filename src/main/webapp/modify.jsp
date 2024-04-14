<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.ssafy.trip.member.model.MemberDto"%>
<%
String root = request.getContextPath();
MemberDto member = (MemberDto)request.getAttribute("userInfo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
</head>
<body>
    <header class="navbar navbar-expand-lg bg-body-tertiary shadow-sm ps-5 pe-5" >
        <div class = "container-fluid">
            <!-- <a><img class = 'col-4 ms-4' src = '../img/nav_logo.png'></a> -->
            <div class="container centered">
                <div class="row justify-content-center h1 text-primary fw-bolder text-center">My page</div>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <nav class="collapse navbar-collapse mr-1" id="navbarNav">
                <ul class="navbar-nav ms-auto me-2 grid gap-4">
                    <li class = "navbar-item">
                        <a href = "../html/main.html" class="nav-link active fs-5" aria-current="page" href="#">Ȩ</a>
                    </li>
                    <li class = "navbar-item">
                        <a href = "" class="nav-link active fs-5" aria-current="page" href="#">������ ã��</a>
                    </li>
                    <li class = "navbar-item">
                        <a href = "" class="nav-link active fs-5" aria-current="page" href="#">�Խ���</a>
                    </li>
                    <li id = 'nav-logout' class = "navbar-item">
                        <a href = "" class="nav-link active fs-5" aria-current="page" href="#">�α׾ƿ�</a>
                    </li>
                </ul> 
            </nav>
        </div>
    </header>
    <main>
           <form id="form-info" method="POST" action="">
            <input type="hidden" name="action" value="modify">
                <div class="border shadow rounded mt-5 p-5 col-sm-6 col-md-6 col-lg-4 container centered">
                    <div class="justify-content-center">
                        <label for="newPassword" class="form-label">�� ��й�ȣ</label> <span class="text-warning">*</span>
                        <input type="password" class="form-control mb-2" id="newPassword" name = "userPassword" placeholder="�� ��й�ȣ �Է�" required>
                    </div>
                    <div class="justify-content-center">
                        <label for="newEmail" class="form-label">�� �̸���</label> <span class="text-warning">*</span>
                        <input type="text" class="form-control mb-2" id="newEmail" name = "email" placeholder="user@domain.com" required>
                    </div>
                    <div class="justify-content-center">
                    <!-- <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck">
                        <label class="form-check-label" for="gridCheck">
                        Check me out
                        </label>
                    </div> -->
                    </div>
                </div>
                <div class="rounded-top p-0 col-sm-6 col-md-6 col-lg-4 container centered mt-5">
                    <div class="row justify-content-center ms-auto me-auto">
                        <button type="button" class="btn btn-primary" id="updatebtn">���� �����ϱ�</button>
                    </div>
                </div>
            </form>
    </main>
    <div class="d-none d-sm-none d-md-block navbar fixed-bottom navbar-expand navbar-dark bg-white container-fluid justify-content-center p-3">
        <div class="row">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link text-primary fw-bolder fs-4 text-center mt-0" href="#">Excuse Me</a>
            </li>
            <li class="nav-item ">
              <a class="nav-link text-dark text-center mt-2" href="#">��������ó����ħ</a>
            </li>
            <li class="nav-item">
              <a class="nav-link text-dark text-center mt-2" href="#">�̿���</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-muted text-center mt-2" href="#">&copy;SSAFY ���� 4�� ����� ������ �Źΰ� ����ǥ</a>
            </li>
          </ul>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.getElementById("updatebtn").addEventListener('click',function(){
    	let form = document.getElementById("form-info");
    	console.log(form);
        form.setAttribute("action", "<%= root%>/user");
        form.submit();
    });
    </script>
</body>
</html>