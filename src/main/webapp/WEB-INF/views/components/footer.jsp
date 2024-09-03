<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body {
            background-color: #fff; /* 페이지 배경을 흰색으로 설정 */
            color: #000; /* 기본 글자 색상을 검정색으로 설정 */
        }
        #footer {
            height: 180px;
            font-family: Arial, sans-serif;
            background-color: #fff; /* footer 배경을 흰색으로 설정 */
            border: 1px solid #ccc; /* footer 테두리 색상 및 두께 설정 */
            border-radius: 5px; /* 선택 사항: 테두리 둥글기 설정 */
            color: #000; /* footer 내의 글자 색상 설정 */
        }
        .content-all {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            height: 100%;
        }
        .contents1, .contents2 {
            flex: 1;
        }
        .contents1 {
            margin-right: 10px; /* 선택 사항: contents1과 contents2 사이의 간격 조정 */
        }
        .contents2 {
            margin-left: 10px; /* 선택 사항: contents1과 contents2 사이의 간격 조정 */
        }
        .footer-menu a {
            text-decoration: none; /* 기본 링크 스타일 제거 */
            color: #000; /* 링크 색상을 검정색으로 설정 */
        }
        .footer-menu a:hover {
            text-decoration: underline; /* 호버 시 밑줄 추가 */
        }
        .footer-menu > li {
            margin-top: 5px;
        }

        .right-contents li {
            color: #000; /* i 태그의 색상을 검정색으로 설정 */
        }
        .right-contents a {
            color: #000000;
        }
        .last-message {
            color: #000000;
        }
    </style>
</head>
<body>
<footer id="footer" class="text-white pt-2 pb-2">
    <div class="container">
        <h2 class="sr-only">사이트 정보 안내</h2>
        <div class="row">
            <div class="col-md-12 content-all">
                <div class="contents1">
                    <h3 class="sr-only">하단 바로가기 메뉴</h3>
                    <ul class="footer-menu list-unstyled mb-1">
                        <li><a href="#">이용안내</a></li>
                        <li><a href="#">휴관일</a></li>
                        <li><a href="#" class="font-weight-bold text-danger">개인정보처리방침</a></li>
                        <li><a href="#">이메일주소 무단수집거부</a></li>
                        <li><a href="/admin/login" class="font-weight-bold">관리자 로그인</a></li>
                    </ul>
                </div>

                <div class="contents2">
                    <div class="footer-address mt-2">
                        <h3 class="sr-only">사이트 정보</h3>
                        <div class="address-list">
                            <ul class="list-unstyled mb-1 right-contents">
                                <li><i class="fa fa-map-marker"></i> [05717] 서울시 송파구 중대로 135 (가락동) KCC정보통신 작은도서관</li>
                                <li><i class="fa fa-phone-square"></i> <span>Tel</span> 02-2188-6980</li>
                                <li><i class="fa fa-envelope-o"></i> <a href="mailto:bandoivy1@gmail.com">kosaLibrary@gmail.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="footer-copyright mt-2 last-message">
                        Copyright (C) 2024 KOSA Library All Right Reserved
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
