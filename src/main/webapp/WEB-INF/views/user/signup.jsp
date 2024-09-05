<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/components/header_user.jsp" />
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
    <title>KCC정보통신 작은도서관 | 회원가입</title>
    <style>
      body {
        margin-top: 100px;
        background-color: #f8f9fa;
        font-family: "Poppins", sans-serif;
      }

      .signup-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
      }

      .signup-box {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 500px;
      }

      .signup-box h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #343a40;
        font-weight: 600;
      }

      .signup-box .form-control {
        margin-bottom: 15px;
        padding: 10px;
        height: 50px;
        font-size: 16px;
      }

      .signup-box .btn-primary {
        width: 100%;
        height: 50px;
        font-size: 18px;
        font-weight: 600;
        background: linear-gradient(to right, #6a11cb, #2575fc);
        border: none;
        transition: all 0.3s ease;
      }

      .signup-box .btn-primary:hover {
        background: linear-gradient(to right, #2575fc, #6a11cb);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      }

      .signup-box .form-check-label {
        margin-top: 300px;
        font-size: 14px;
      }


    </style>
  </head>
  <body>
    <div class="signup-container mt-5">
      <div class="signup-box mt-5">
        <h2>회원가입</h2>
        <form method="post" action="/signup" id="signup-form">
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
          <div class="mb-3">
            <input
              type="text"
              name="name"
              class="form-control"
              placeholder="이름"
              required
            />
          </div>
          <div class="mb-3">
            <input
              type="email"
              name="email"
              class="form-control"
              placeholder="이메일 주소"
              required
            />
          </div>
          <div class="mb-3">
            <input
              type="text"
              name="birth"
              class="form-control"
              placeholder="생년월일 (YYYY-MM-DD)"
              required
            />
          </div>
          <div class="mb-3">
            <input
              type="text"
              name="address"
              class="form-control"
              placeholder="주소"
              required
            />
          </div>
          <div class="mb-3">
            <input
              type="text"
              name="phone"
              class="form-control"
              placeholder="전화번호"
              required
            />
          </div>
          <div class="form-check mb-3">

          </div>
          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
          />

          <button type="submit" class="btn btn-primary">회원가입</button>
        </form>
      </div>
    </div>

    <script>
      document.addEventListener("DOMContentLoaded", function () {
        document
          .getElementById("signup-form")
          .addEventListener("submit", function (event) {
            event.preventDefault();

            const form = event.target;
            const formData = new FormData(form);

            fetch(form.action, {
              method: "POST",
              body: formData,
            })
              .then((response) => {
                if (response.ok) {
                  return response.text(); 
                } else {
                  throw new Error("회원가입에 실패했습니다.");
                }
              })
              .then((data) => {
                Swal.fire({
                  icon: "success",
                  title: "회원가입 완료",
                  text: "회원가입이 정상적으로 완료되었습니다.",
                }).then(() => {
                  // 알림이 닫힌 후 홈페이지로 리디렉션
                  window.location.href = "/";
                });
              })
              .catch((error) => {
                Swal.fire({
                  icon: "error",
                  title: "회원가입 실패",
                  text: error.message,
                });
              });
          });
      });
    </script>
  </body>
  <jsp:include page="/WEB-INF/views/components/footer.jsp" />

</html>
