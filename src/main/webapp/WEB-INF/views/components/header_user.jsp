<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <link rel="icon" href="../../../resources/assets/favicon.ico" />
    <link rel="apple-touch-icon" href="../../../resources/assets/favicon.ico" />
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>KCC정보통신 도서관</title>

    <style>
      @font-face {
        font-family: "TMON";
        src: url("./SB_M.ttf");
      }

      .nav {
        border: 1px solid black;
        width: 100%;
        height: 181px;
      }

      .nav-inner {
        margin-left: 225px;
        margin-right: 225px;
        padding-top: 20px;
        padding-bottom: 20px;
      }

      .nav-title {
        border: 1px solid black;
        width: 1220px;
        height: 60px;
        display: flex;
        justify-content: space-between;
      }

      .nav-menu {
        border: 1px solid black;
        margin-top: 35px;
        width: 1240px;
        height: 45px;
      }
      .logo {
        display: flex;
      }

      .logo .logo-image {
        width: 60px;
        height: 55px;
      }

      .logo .logo-title {
        font-family: "TMON";
        font-weight: bold;
        font-size: 24px;
        margin-left: 10px;
        margin-top: 10px;
        color: #0a4494;
      }

      .login-signup {
        margin-top: 18px;
      }
      .login-signup a {
        color: #959795;
        text-decoration: none;
        transition: color 0.3s ease; /* 색깔 변화를 부드럽게 하기 위한 트랜지션 */
      }

      .login-signup a:hover {
        color: #000;
        text-decoration: underline;
      }
    </style>

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

    <script>
      // js
      document.addEventListener("DOMContentLoaded", function () {
        const paragraph = document.querySelector("p");
        paragraph.textContent = "JavaScript가 내장되어 있습니다.";
        paragraph.style.color = "green";
      });
    </script>
  </head>
  <body>
    <div class="nav">
      <div class="nav-inner">
        <div class="nav-title">
          <div class="logo">
            <div class="logo-image">
              <img
                src="../../../resources/assets/kcc_library_logo.png"
                style="width: 60px"
              />
            </div>
            <div class="logo-title">KCC정보통신 작은도서관</div>
          </div>
          <div class="login-signup">
            <a href="/signup">회원가입</a>
            <a href="/login">로그인</a>
          </div>
        </div>

        <div class="nav-menu">
          <div></div>
        </div>
      </div>
    </div>
  </body>
</html>
