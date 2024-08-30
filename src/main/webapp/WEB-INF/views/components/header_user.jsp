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
        
    <link href="../style.css" rel="stylesheet" type="text/css" />
    <style>
      @font-face {
        font-family: "TMON";
        src: url("./SB_M.ttf");
      }

      .nav {
        width: 100%;
        height: 181px;
      }

      .logo-title a {
        text-decoration: none;
        text-decoration-line: none;
        color: #0a4494;
      }

      .nav-inner {
        margin-left: 225px;
        margin-right: 225px;
        padding-top: 20px;
        padding-bottom: 20px;
      }

      .nav-title {
        width: 1220px;
        height: 60px;
        display: flex;
        justify-content: space-between;
      }

      .nav-menu {
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
      }

      .login-signup {
        margin-top: 18px;
      }
      .login-signup a {
        color: #959795;
        text-decoration: none;
        transition: color 0.3s ease; /* 색깔 변화를 부드럽게 하기 위한 트랜지션 */
        font-size: 0.8rem;
      }

      .login-signup a:hover {
        color: #000;
        text-decoration: underline;
      }

      .nav-menu {
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: space-between;
      }

      .nav-menu-all {
        margin-left: 280px;
        display: flex;
        justify-content: center;
      }

      .nav-menu-all li {
        margin-left: 50px;
      }
      .nav-menu-all a {
        display: block;
        width: 100%;
        font-weight: bold;
        color: #543333;
        margin-top: 5px;
        font-size: 1.1rem;
        text-decoration: none;
        transition: all 0.3s ease;
        /* padding: 10px; */
        position: relative;
        text-align: center;
      }

      .nav-menu-all a:hover {
        color: #000;
      }

      .nav-menu-all a:after {
        content: "";
        position: absolute;
        border-bottom: 3px solid #000;
        width: 0;
        left: 0;
        left: 50%;
        top: 25px; /*밑줄 위치 */
        transition: all 0.3s;
      }

      .nav-menu-all a:hover:after {
        color: #000;
        width: 100%;
        left: 0;
      }

      .nav-menu-all li {
        list-style-type: none;
      }

      .nav-menu-button img {
        width: 40px;
        height: 40px;
      }

      .search ul {
        display: none;
      }

      .search:hover ul {
        display: block;
      }

      .search ul {
        list-style-type: none;
        padding-left: 0;
      }

      .search li {
        list-style-type: none;
        margin-left: 0;
      }

      .search-back {
        width: 100%;
      }

      .search-back ul {
        background-color: white;
      }

      .search-back ul li {
        margin-top: 5px;
        margin-bottom: 5px;
        font-size: 0.8rem;
      }

      .search-back ul li:hover {
        color: #4bb8b3;
      }

      /*상단바 고정*/
      .top-bar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background-color: white;
      }

      /* 컨텐츠 나중에 지울 것임*/
      .contents {
        margin-top: 155px;
        background-color: gray;
        height: 2000px;
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
    <div class="top-bar">
      <div class="nav">
        <div class="nav-inner">
          <div class="nav-title">
            <div class="logo">
              <div class="logo-image">
                <a href="/">
                  <img
                    src="../../../resources/assets/kcc_library_logo.png"
                    style="width: 60px"
                  />
                </a>
              </div>
              <div class="logo-title">
                <a href="/">KCC정보통신 작은도서관</a>
              </div>
            </div>
            <div class="login-signup">
              <a href="/signup">회원가입</a>
              <a href="/login">로그인</a>
            </div>
          </div>

          <div class="nav-menu">
            <ul class="nav-menu-all">
              <li>
                <a class="search" href=""
                  >자료 찾기
                  <div class="search-back">
                    <ul>
                      <li>1번자료</li>
                      <li>1번자료</li>
                      <li>1번자료</li>
                    </ul>
                  </div>
                </a>
              </li>
              <li><a href="">참여마당</a></li>
              <li><a href="">도서관소개</a></li>
              <li><a href="">My Library</a></li>
            </ul>
            <div class="nav-menu-button">
              <a href="">
                <img
                  class="button-m"
                  src="../../../resources/assets/menu-button.JPG"
                  alt=""
                />
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="contents">111</div>
  </body>
</html>
