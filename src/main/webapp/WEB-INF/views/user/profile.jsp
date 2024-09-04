<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/components/header_user.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Info</title>
    <style>
        .user-info {
            display: flex;
            justify-content: center;
            height: 40rem;
            margin-top: 200px;
            width: 40rem;
            border: 1px solid black;
            align-items: center;
            margin-left: 34rem;
        }

        .icon-size {
            height: 5rem;
            width: 5rem;
        }

        .icon-size img {
            max-height: 100%;
            max-width: 100%;
            height: auto;
            width: auto;
        }

        .user-info-inner {
            display: flex;
            flex-direction: column;
            align-items: center; /* 수평 가운데 정렬 */
            justify-content: center; /* 수직 가운데 정렬 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }
    </style>
</head>
<body>
<div class="user-info">
    <div class="user-info-inner">
        <h3>회원 정보</h3>
        <div class="icon-size"><img src="../../../resources/assets/icon.png" alt="Icon"></div>
        <p>${username}</p>
        <!-- 사용자 정보를 수정할 수 있는 폼 -->
        <form action="/user/profile/update" method="post">
            <div>현재 비밀번호 : ${password}}</div>

            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required />
            <button type="submit">Update Profile</button>
        </form>
        <p>${message}</p>
    </div>
</div>
</body>

<jsp:include page="/WEB-INF/views/components/footer.jsp" />

</html>
