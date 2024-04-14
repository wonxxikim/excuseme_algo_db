<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String root = request.getContextPath();
%>
<%String pwd = (String)request.getAttribute("userPwd"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="userInfo">
        <div class="border shadow rounded mt-5 p-5 col-sm-6 col-md-6 col-lg-4 container centered">
            <div class="justify-content-center">
                <p>비밀번호는  : <%=pwd %> 입니다.</p>
            </div>
        </div>
        <div class="rounded-top p-0 col-sm-6 col-md-6 col-lg-4 container centered mt-5">
            <div class="row justify-content-center ms-auto me-auto">
                <a href = "<%= root %>/user?action=main" class="btn btn-primary" id="findbtn">메인으로 가기</a>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="./js/findpw.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>