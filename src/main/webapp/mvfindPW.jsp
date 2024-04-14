<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>��й�ȣ ã��</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="userInfo">
        <div class="border shadow rounded mt-5 p-5 col-sm-6 col-md-6 col-lg-4 container centered">
            <div class="justify-content-center">
                <label for="findpwid" class="form-label">���̵�� ��й�ȣ ã��</label>
                <input type="id" class="form-control mb-2" id="findpwid" placeholder="���̵� �Է��ϼ���." required>
            </div>
        </div>
        <div class="rounded-top p-0 col-sm-6 col-md-6 col-lg-4 container centered mt-5">
            <div class="row justify-content-center ms-auto me-auto">
                <button type="button" class="btn btn-primary" id="findbtn">��й�ȣ ã��</button>
            </div>
        </div>
    </form>
    <script type="text/javascript" src="./js/findpw.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>