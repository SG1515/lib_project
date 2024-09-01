<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/components/header_user.jsp" />
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />

    <title>KCC정보통신 작은도서관 | 회원가입</title>
    <style>
      body {
        margin-top: 200px;
      }

      .location {
        display: flex;
        height: 100%;
        justify-content: center;
        align-items: center;
      }

      .login-box {
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        width: 300px;
        height: 300px;
        padding-left: 3%;
        box-sizing: border-box;
        border: 1px solid black;
      }

      #login-form > input {
        margin-top: 10px;
      }
    </style>
  </head>
  <body>
    <div class="location">
      <div class="login-box">
        <form method="post" action="/login" id="login-form">
          <h2>로그인</h2>
          <input type="text" name="username" placeholder="username" />
          <input type="password" name="password" placeholder="password" />
          <label for="remember-check">
            <input type="checkbox" id="remember-check" />아이디 저장하기
          </label>
          <input type="submit" value="Login" />
        </form>
      </div>
    </div>
  </body>
</html>
