<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/components/header_admin.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Google Fonts -->
    <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap"
    />
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

    <title>KCC정보통신 작은도서관 | 관리자로그인</title>
    <style>
        body {
            margin-top: 100px;
            background-color: #f8f9fa;
            font-family: "Poppins", sans-serif;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-box {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
            font-weight: 600;
        }

        .login-box .form-control {
            margin-bottom: 15px;
            padding: 10px;
            height: 50px;
            font-size: 16px;
        }

        .login-box .btn-primary {
            width: 100%;
            height: 50px;
            font-size: 18px;
            font-weight: 600;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            border: none;
            transition: all 0.3s ease;
        }

        .login-box .btn-primary:hover {
            background: linear-gradient(to right, #2575fc, #6a11cb);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .login-box .form-check-label {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h2>관리자 로그인</h2>
        <form method="post" action="/login" id="login-form">
            <div class="mb-3">
                <input
                        type="text"
                        name="id"
                        class="form-control"
                        placeholder="아이디"
                        required
                />
            </div>
            <div class="mb-3">
                <input
                        type="password"
                        name="password"
                        class="form-control"
                        placeholder="비밀번호"
                        required
                />
            </div>
            <div class="form-check mb-3">
                <input
                        type="checkbox"
                        class="form-check-input"
                        id="remember-check"
                        name="remember-me"
                />
                아이디 저장하기
            </div>
            <input
                    type="hidden"
                    name="${_csrf.parameterName}"
                    value="${_csrf.token}"
            />

            <button type="submit" class="btn btn-primary">로그인</button>
        </form>
    </div>
</div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const loginForm = document.getElementById("login-form");
        const rememberCheck = document.getElementById("remember-check");
        const userIdField = loginForm.querySelector('input[name="id"]');

        // 페이지 로드 시 저장된 아이디가 있으면 입력 필드에 채우기
        const savedUserId = localStorage.getItem("savedUserId");
        if (savedUserId) {
            userIdField.value = savedUserId;
            rememberCheck.checked = true; // 저장된 아이디가 있다면 체크박스도 체크 상태로 설정
        }

        loginForm.addEventListener("submit", function (event) {
            event.preventDefault();

            const formData = new FormData(loginForm);

            // remember-me 체크박스가 체크되어 있으면 아이디를 저장합니다.
            if (rememberCheck.checked) {
                localStorage.setItem("savedUserId", formData.get("id"));
            } else {
                localStorage.removeItem("savedUserId");
            }

            // 서버로 폼 데이터를 전송합니다.
            fetch(loginForm.action, {
                method: "POST",
                body: formData,
            })
                .then((response) => {
                    if (response.ok) {
                        return response.text();
                    } else {
                        throw new Error("로그인 실패");
                    }
                })
                .then((data) => {
                    Swal.fire({
                        icon: "success",
                        title: "로그인 완료",
                        text: "홈페이지로 이동합니다.",
                    }).then(() => {
                        // 알림이 닫힌 후 홈페이지로 리디렉션합니다.
                        window.location.href = "/";
                    });
                })
                .catch((error) => {
                    Swal.fire({
                        icon: "error",
                        title: "비밀번호나 아이디가 틀립니다.",
                        text: error.message,
                    });
                });
        });
    });
</script>
<jsp:include page="/WEB-INF/views/components/footer.jsp" />

</html>
