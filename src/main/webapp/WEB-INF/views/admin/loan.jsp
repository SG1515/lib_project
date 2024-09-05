<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/components/header_admin.jsp" />

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <title>KCC정보통신 도서관 | 도서반납이력</title>
    <style>
        .for-flex {
            margin-top: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .main-box {
            border: 1px solid #555555;
            padding: 20px;
            width: 80%;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .submit-button {
            display: flex;
            justify-content: center;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .for-flex2 {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .title{
            font-family: "Tmon몬소리 Black";
        }

    </style>
</head>
<body>

<div class="container">
    <div class="for-flex">
        <div class="main-box">
            <h3 style="font-weight: bold" class="title">회원 정보 조회</h3>
            <div class="mb-3">
                <input type="text" class="form-control" id="memberId" placeholder="회원 ID 입력">
            </div>
            <button class="btn btn-primary" id="memberSearchBtn">회원 정보 조회</button>
            <div id="memberInfo" class="mt-3">
                <!-- 회원 정보가 여기에 표시됩니다 -->
            </div>
        </div>
    </div>

    <div class="for-flex2">
        <div class="main-box">
            <h3 style="font-weight: bold" class="title">도서 정보 조회</h3>
            <div class="mb-3">
                <input type="text" class="form-control" id="bookId" placeholder="도서 청구기호 입력">
            </div>
            <button class="btn btn-primary" id="bookSearchBtn">도서 정보 조회</button>
            <div id="bookInfo" class="mt-3">
                <!-- 도서 정보가 여기에 표시됩니다 -->
            </div>
        </div>
    </div>

    <div class="submit-button">
        <button class="btn btn-success btn-lg" id="rentRequestBtn">대여 신청</button>
    </div>
</div>

<jsp:include page="/WEB-INF/views/components/footer.jsp" />

<script>
    $(document).ready(function() {
        $('#memberSearchBtn').click(function() {
            var memberId = $('#memberId').val();
            if (memberId) {
                $.ajax({
                    url: '/getMemberInfo',  // 서버의 회원 정보 조회 엔드포인트
                    type: 'GET',
                    data: { id: memberId },  // id
                    success: function(responseUser) {
                        // responseUser.name이 undefined이면 에러 메시지 출력
                        if (responseUser.name === undefined || responseUser.name === null) {
                            $('#memberInfo').html('<p class="text-danger">일치하는 회원정보가 없습니다.</p>');
                        } else {
                            // 서버에서 받아온 데이터를 이용해 정보를 화면에 표시
                            $('#memberInfo').html(
                                '<p><strong>이름:</strong> ' + responseUser.name + '</p>' +  // name
                                '<p><strong>주소:</strong> ' + responseUser.address + '</p>' +  // address
                                '<p><strong>이메일:</strong> ' + responseUser.email + '</p>'  // email
                            );
                        }
                    },
                    error: function() {
                        $('#memberInfo').html('<p class="text-danger">일치하는 회원정보가 없습니다.</p>');
                    }
                });
            } else {
                alert('회원 ID를 입력해주세요.');
            }
        });

        $('#bookSearchBtn').click(function() {
            var callNumber = $('#bookId').val();  // 도서의 청구기호
            if (callNumber) {
                $.ajax({
                    url: '/getBookInfo',  // 서버의 도서 정보 조회 엔드포인트
                    type: 'GET',
                    data: { callNumber: callNumber },  // 수정된 필드명: call_number
                    success: function(response) {
                        if(response.title === null || response.title === undefined) {
                            $('#bookInfo').html('<p class="text-danger">해당 도서가 없거나 도서가 이미 대여중이거나 예약중입니다.</p>');
                        } else {
                            $('#bookInfo').html(
                                '<p><strong>제목:</strong> ' + response.title + '</p>' +  // title
                                '<p><strong>출판사:</strong> ' + response.publisher + '</p>' +  // publisher
                                '<p><strong>출판년도:</strong> ' + response.publicationYear + '</p>'  // publication_year
                            );
                        }
                    },
                    error: function() {
                        $('#bookInfo').html('<p class="text-danger">해당 도서가 없거나 도서가 이미 대여중이거나 예약중입니다.</p>');
                    }
                });
            } else {
                alert('도서 청구기호를 입력해주세요.');
            }
        });

        $('#rentRequestBtn').click(function() {
            var memberId = $('#memberId').val();
            var callNumber = $('#bookId').val();
            if (memberId && callNumber) {
                $.ajax({
                    url: '/rentBook',  // 서버의 대여 신청 처리 엔드포인트
                    type: 'POST',
                    data: {
                        id: memberId,
                        callNumber: callNumber
                    },
                    success: function(response) {
                        // 대여 신청이 성공하면 페이지 리다이렉트
                        window.location.href = '/admin/main';
                    },
                    error: function() {
                        alert('대여 신청에 실패했습니다.');
                    }
                });
            } else {
                alert('회원 ID와 도서 청구기호를 입력해주세요.');
            }
        });
    });

</script>

</body>
</html>
