<%@ page import="java.util.Enumeration" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%

  String sessionId = (String) session.getAttribute("id");
  System.out.println("Session ID: " + sessionId);

%>
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
    <title>KCC정보통신 도서관_관리자페이지</title>

    <link href="../style.css" rel="stylesheet" type="text/css" />
    <style>
      @font-face {
        font-family: "TMON";
        src: url("https://cdn.jsdelivr.net/gh/websfont/tmon/tmon.eot");
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
        font-family: "Tmon몬소리 Black";
        font-weight: bold;
        font-size: 24px;
        margin-left: 10px;
        margin-top: 15px;
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
        margin-left: 150px;
        display: flex;
        justify-content: center;
      }

      .nav-menu-all > li {
        margin-left: 100px;
      }
      .nav-menu-all > li > a {
        display: block;
        width: 100%;
        font-weight: bold;
        color: #000;
        margin-top: 5px;
        font-size: 1.1rem;
        text-decoration: none;
        transition: all 0.3s ease;
        position: relative;
        text-align: center;
      }

      .nav-menu-all > li > a:hover {
        color: #000;
      }

      .nav-menu-all > li > a:after {
        content: "";
        position: absolute;
        border-bottom: 2px solid #000;
        width: 0;
        left: 50%;
        top: 25px; /*밑줄 위치 */
        transition: all 0.3s;
      }

      .nav-menu-all > li > a:hover:after {
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

      /* .search ul {
        display: none;
      }

      .search:hover ul {
        display: block;
      } */

      .search > ul {
        list-style-type: none;
        padding-left: 0;
      }

      .search > ul > li {
        list-style-type: none;
        margin-left: 0;
      }

      .search-back {
        width: 100%;
      }

      .search-back ul li {
        margin-top: 5px;
        margin-bottom: 5px;
        font-size: 0.8rem;
        list-style-type: none;
      }

      .search-back ul li:hover {
        color: #4bb8b3;
      }

      .search-back ul li a:hover {
        color: #4bb8b3;
      }

      /*상단바 고정*/
      .top-bar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        background-color: white;
        z-index: 1000;
      }

      /* 컨텐츠 나중에 지울 것임*/
      .contents {
        margin-top: 180px;
        background-color: gray;
        height: 2000px;
      }

      .search-back ul {
        background-color: white;
        list-style-type: none;
        width: 100%;
        margin-bottom: 10px;
        padding-left: 0;
      }

      .search-back {
        display: none;
      }

      .nav-menu-all > li:hover .search-back {
        display: block;
      }

      .search-back > ul > li {
        margin-top: 10px;
        margin-bottom: 10px;
        margin-left: 10px;
        margin-right: 10px;
      }

      .search-back > ul > li > a {
        color: #000;
        font-weight: bold;
        text-decoration: none;
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
                <a href="/">KCC정보통신 작은도서관 관리자페이지</a>
              </div>
            </div>
            <div class="login-signup">
              <sec:authorize access="isAnonymous()">
                <a href="/admin/login">관리자 로그인</a>
              </sec:authorize>

              <sec:authorize access="isAuthenticated()">
                <a href="/logout">로그아웃</a>
              </sec:authorize>
            </div>
          </div>

          <div class="nav-menu">
            <ul class="nav-menu-all">
              <li>
                <a class="search" href=""
                  >자료 찾기
                  <div class="search-back">
                    <ul>
                      <li><a href="/search">도서 조회</a></li>
                      <li><a href="#">신규 도서</a></li>
                      <li><a href="#">인기 도서</a></li>
                    </ul>
                  </div>
                </a>
              </li>
              <li>
                <a href=""
                  >참여마당
                  <div class="search-back">
                    <ul>
                      <li><a href="#">공지사항</a></li>
                      <li><a href="#">행사일정</a></li>
                      <li><a href="/books/wishbook">희망도서 신청</a></li>
                    </ul>
                  </div>
                </a>
              </li>
              <li>
                <a href=""
                  >도서관소개
                  <div class="search-back">
                    <ul>
                      <li><a href="#">인사말</a></li>
                      <li><a href="#">휴관일</a></li>
                    </ul>
                  </div>
                </a>
              </li>
              <li>
                <a href=""
                  >도서관 관리
                  <div class="search-back">
                    <ul>
                      <li><a href="/admin/failure">분실 / 파손</a></li>
                      <li><a href="/admin/books/newbook">신규 도서 등록</a></li>
                      <li><a href="/admin/books">도서 관리</a></li>
                      <li><a href="/admin/owner">이용자 권한 승인</a></li>
                      <li><a href="/admin/books/loan">도서 대여 신청</a></li>
                      <li><a href="/admin/profile">관리자 정보관리</a></li>
                    </ul>
                  </div>
                </a>
              </li>
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
  </body>
</html>
