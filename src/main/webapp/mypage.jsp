<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.ssafy.trip.member.model.MemberDto"%>
<%
String root = request.getContextPath();
MemberDto member = (MemberDto)request.getAttribute("userInfo");
%>
<%
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
    <link rel="stylesheet" href="./css/mypage.css">
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
        <!-- <div class="invisible container p-5">
            div.
        </div> -->
        <div class="container centered pt-5 mt-5">
            <div class="row justify-content-center pt-5 mt-5 ms-3">
                <span class="h2 text-center text-dark fw-bolder">�� ���� Ȯ��</span>
                <table class="rounded shadow w-50 table table-bordered border-dark" id="userinfo">
                    <tbody>
                      <tr>
                        <th class="w-25 table-primary" scope="row">ID</th>
                        <td id="userid"><%=member.getUserId() %></td>
                      </tr>
                      <tr>
                        <th class="table-primary" scope="row">�̸�</th>
                        <td id="name"><%=member.getUserName() %></td>
                      </tr>
                      <tr>
                        <th class="table-primary" scope="row">e-mail</th>
                        <td id="email"><%=member.getEmail() %></td>
                      </tr>
                    </tbody>
                  </table>
            </div>
            <div class="container centered">
                <div class="row justify-content-center p-0 ">
                    <a href = "<%=root%>/user?action=mvmodify" class="w-25 bg-warning" id="updateuser">�� ���� ����</button>
                    <a href = "<%=root%>/user?action=resign" class="w-25 bg-danger" id="deleteuser">�� ���� ����</button>
                </div>
            </div>
        </div>

    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>