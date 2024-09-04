<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/components/header_user.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KCC정보통신 도서관 | 사용자 정보</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .user-info {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 40rem;
            height: 45rem;
            margin: 200px auto;
            padding: 2rem;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .user-info-inner {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            width: 100%;
        }

        .user-info h3 {
            margin-bottom: 1rem;
            color: #333;
        }

        .icon-size img {
            height: 5rem;
            width: 5rem;
            border-radius: 50%;
            border: 2px solid #ddd;
        }

        form {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        form div {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        form label {
            flex: 1;
            color: #555;
            text-align: left;
        }

        form input[type="text"],
        form input[type="password"] {
            box-sizing: border-box;
            flex: 2;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .password-container {
            display: flex;
            align-items: center;
            position: relative;
        }


        .password-container .toggle-password {
            right: 10px;
            background: none;
            border: none;
            font-size: 1.2rem;
            color: #007bff;
        }

        button[type="submit"] {
            padding: 0.7rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            margin-top: 1rem;
            color: #28a745;
        }

        label {
            font-weight: bold;
        }

        .checkPassowrd{
            margin-left: 200px;
        }

        .user-info h3 {
            margin-bottom: 1rem;
            color: #333;
            font-weight: 800;
        }
    </style>
</head>
<body>
<div class="user-info">
    <div class="user-info-inner">
        <h3 class="mt-3 ">사용자 정보</h3>
        <div class="icon-size"><img src="../../../resources/assets/icon.png" alt="Icon"></div>
        <p>${username}</p>
        <form action="/user/profile/update" method="post" id="modify-user">
            <div>
                <label for="newPassword">비밀번호:</label>
                <div class="password-container">
                    <input type="password" id="newPassword" name="password" placeholder="비밀번호를 입력해주세요." required />
                    <button type="button" class="toggle-password" onclick="togglePassword('newPassword')">&#128065;</button>
                </div>
            </div>
            <div>
                <label for="confirmPassword">비밀번호 확인:</label>
                <div class="password-container">
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호를 다시 입력해주세요." required />
                    <button type="button" class="toggle-password" onclick="togglePassword('confirmPassword')">&#128065;</button>
                </div>
            </div>
            <div>
                <div id="message" class="message checkPassowrd"></div>
                <button type="button" class="btn btn-secondary" onclick="checkPasswords()">비밀번호 확인</button>
            </div>
            <div>
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" value="${name}">
            </div>
            <div>
                <label for="email">이메일:</label>
                <input type="text" id="email" name="email" value="${email}">
            </div>
            <div>
                <label for="birth">생년월일:</label>
                <input type="text" id="birth" name="birth" value="${birth}">
            </div>
            <div>
                <label for="address">주소:</label>
                <input type="text" id="address" name="address" value="${address}">
            </div>
            <div>
                <label for="phone">전화번호:</label>
                <input type="text" id="phone" name="phone" value="${phone}">
            </div>
            <button type="submit" id="submitBtn" class="btn btn-secondary btn-disabled" disabled>수정</button>
        </form>
        <p>${message}</p>
    </div>
</div>

<script>
    function togglePassword(fieldId) {
        const field = document.getElementById(fieldId);
        const type = field.getAttribute('type') === 'password' ? 'text' : 'password';
        field.setAttribute('type', type);
    }

    function checkPasswords() {
        const password = document.getElementById('newPassword').value;
        const confirmPassword = document.getElementById('confirmPassword').value;
        const message = document.getElementById('message');
        const submitBtn = document.getElementById('submitBtn');

        if (password === confirmPassword) {
            message.textContent = '비밀번호가 일치합니다.';
            message.style.color = 'green';
            submitBtn.classList.remove('btn-disabled');
            submitBtn.disabled = false;
        } else {
            message.textContent = '비밀번호가 일치하지 않습니다.';
            message.style.color = 'red';
            submitBtn.classList.add('btn-disabled');
            submitBtn.disabled = true;
        }
    }


</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document
            .getElementById("modify-user")
            .addEventListener("submit", function (event) {

                // 서버로 폼 데이터를 전송합니다.
                const form = event.target;
                const formData = new FormData(form);

                fetch(form.action, {
                    method: "POST",
                    body: formData,
                })
                    .then((response) => {
                        if (response.ok) {
                            return response.text(); // 응답 텍스트를 받아옵니다.
                        } else {
                            throw new Error("이메일, 생년월일, 주소의 형식이 맞지 않습니다.");
                        }
                    })
                    .then((data) => {
                        Swal.fire({
                            icon: "success",
                            title: "회원정보 수정완료",
                            text: "회원정보 수정이 정상적으로 완료되었습니다.",
                        }).then(() => {
                            // 알림이 닫힌 후 홈페이지로 리디렉션합니다.
                            window.location.href = "/";
                        });
                    })
                    .catch((error) => {
                        Swal.fire({
                            icon: "error",
                            title: "정보수정 실패",
                            text: error.message,
                        });
                    });
            });
    });
</script>
</body>

<jsp:include page="/WEB-INF/views/components/footer.jsp" />

</html>
