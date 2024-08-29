<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta
      name="viewport"
      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
    />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>KCC정보통신 도서관_관리자 페이지</title>

    <style>
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
      }

      .nav-menu {
        border: 1px solid black;
        margin-top: 35px;
        width: 1240px;
        height: 45px;
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
        <div class="nav-title"></div>

        <div class="nav-menu"></div>
      </div>
    </div>
  </body>
</html>
