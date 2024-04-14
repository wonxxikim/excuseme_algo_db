<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container">
        <p class="text-end small">�̹� ������ �����Ű���?<a href="./login.html" class="text-decoration-none text-primary"> �α���</a></p>
    </div>
    <div class="rounded-top p-0 col-sm-6 col-md-6 col-lg-4 container centered mt-5">
        <a class="text-decoration-none  fw-bolder fs-3 text-start mt-0" href="#">�����</a>
    </div>
   <form id="form-signup" method="POST" action="">
   <input type="hidden" name="action" value="signup">
      <div class="border shadow rounded p-3 col-sm-6 col-md-6 col-lg-4 container centered mt-3 mb-3">
          <div class="justify-content-center">
              <label for="inputUsername" class="form-label">���̵�</label> <span class="text-warning">*</span>
              <input type="id" name = "userId" class="form-control mb-2" id="inputUsername" placeholder="���̵� �Է�" required>
            </div>
            <div class="justify-content-center">
              <label for="inputPassword" class="form-label">��й�ȣ</label> <span class="text-warning">*</span>
              <input type="password" name = "userPassword" class="form-control mb-2" id="inputPassword" placeholder="��й�ȣ �Է�" required>
            </div>
            <div class="justify-content-center">
              <label for="inputPassword2" class="form-label">��й�ȣ Ȯ��</label> <span class="text-warning">*</span>
              <input type="password" class="form-control" id="inputPassword2" placeholder="��й�ȣ ���Է�" required>
            </div>
      </div>
      <div class="border shadow rounded p-3 col-sm-6 col-md-6 col-lg-4 container centered">
          <div class="justify-content-center">
              <label for="name" class="form-label">�̸�</label> <span class="text-warning">*</span>
              <input type="text" name = "userName" class="form-control mb-2" id="name" placeholder="�� �̸�" required>
          </div>
          <div class="justify-content-center">
            <label for="inputEmail" class="form-label">�̸���</label> <span class="text-warning">*</span>
            <input type="text" name = "email" class="form-control mb-2" id="inputEmail" placeholder="user@domain.com" required>
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
            <button type="button" class="btn btn-primary">�����ϱ�</button>
        </div>
    </div>
  </form>
    <div class="navbar fixed-bottom navbar-expand navbar-dark bg-white container-fluid justify-content-center p-3">
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
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<script>
function makeObj() {

    let User = {};
    let infos = ['userid', 'password', 'name', 'email'];
    
    let userId = document.querySelector('#inputUsername');
    let passWord = document.querySelector('#inputPassword');
    let name = document.querySelector('#name');
    let email = document.querySelector('#inputEmail');

    
    User['userid'] = userId.value;
    User['password'] = passWord.value;
    User['name'] = name.value;
    User['email'] = email.value;

    return User;
}

const signup = document.querySelector(".btn");
signup.addEventListener('click', function () {
    let flag = 1;
    let userObj = makeObj();
    console.log(userObj)
    Object.keys(userObj).forEach(k => {
        if (userObj[k] == '') {
            alert(k + "��(��) �Է����ּ���.");
            flag = 0;
        }
    });
    if (flag == 1) {
    	let form = document.querySelector("#form-signup");
        form.setAttribute("action", "<%= root%>/user");
        form.submit();
    }
})


</script>