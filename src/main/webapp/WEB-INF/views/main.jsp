<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<jsp:include page="/WEB-INF/views/components/header_user.jsp" />
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
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
    />
    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .autoplay-progress {
        position: absolute;
        right: 16px;
        bottom: 16px;
        z-index: 10;
        width: 48px;
        height: 48px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        color: var(--swiper-theme-color);
      }

      .autoplay-progress svg {
        --progress: 0;
        position: absolute;
        left: 0;
        top: 0px;
        z-index: 10;
        width: 100%;
        height: 100%;
        stroke-width: 4px;
        stroke: var(--swiper-theme-color);
        fill: none;
        stroke-dashoffset: calc(125.6px * (1 - var(--progress)));
        stroke-dasharray: 125.6;
        transform: rotate(-90deg);
      }
      .containerBody {
        margin: 20px;
        background-color: #f5f7ff;
      }
      .details {
        color: gray;
      }
      .carouselBoxWord {
        font-size: 15px;
        margin-bottom: 0;
      }
      .carouselBox {
        margin: 20px;
      }

      .carousel-inner img {
        width: 100%;
        height: 150px;
        object-fit: contain;
      }

      .bookCarousel {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
      }

      .bookTitle p {
        font-size: 20px;
        font-weight: bold;
      }

      .bookTitle {
        margin-top: 10px;
      }

      .containerBody {
        margin-top: 200px;
      }

      .custom-button {
        background-color: #56c8d8; /* 기본 배경색 */
        background-image: linear-gradient(
          to bottom,
          #56c8d8,
          #34a4a8
        ); /* 위에서 아래로 향하는 그라데이션 */
        border: none; /* 테두리 없음 */
        color: white; /* 글자 색상 */
        padding: 10px 20px; /* 내부 여백 */
        font-size: 16px; /* 글자 크기 */
        border-radius: 20px; /* 둥근 모서리 */
        cursor: pointer; /* 마우스 오버 시 커서 변경 */
        text-align: center; /* 텍스트 가운데 정렬 */
        display: inline-block; /* 블록 수준 요소로 표시 */
      }

      .form-control {
        border-top-right-radius: 20px; /* 오른쪽 상단 모서리 둥글게 */
        border-bottom-right-radius: 20px; /* 오른쪽 하단 모서리 둥글게 */
        box-shadow: none; /* 입력 필드의 그림자 제거 */
      }

      .input-group-text {
        background: transparent; /* 배경 투명하게 */
        border: none; /* 테두리 제거 */
        padding: 0; /* 패딩 제거 */
      }

      .row {
        margin: 0 0 10px 0;
      }

      .searchBox {
        padding-top: 60px;
      }

      .contents {
        margin-top: 180px;
        background-color: gray;
        height: 2000px;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <div class="containerBody">
        <div class="bookCarousel">
          <div class="row d-flex justify-content-between">
            <div class="col-5 carouselBox">
              <div class="row carouselTitle">
                <div class="col-4">
                  <h3>신규 도서</h3>
                </div>
                <div class="col-8 d-flex justify-content-between">
                  <div class="d-flex align-items-end">
                    <p class="carouselBoxWord">단행본</p>
                  </div>
                  <div class="d-flex align-items-end">
                    <a href="/book/1" class="details carouselBoxWord"
                      >상세보기</a
                    >
                  </div>
                </div>
              </div>
              <div class="row carousel">
                <div class="swiper mySwiper">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <div class="swiper-pagination"></div>
                  <div class="autoplay-progress">
                    <svg viewBox="0 0 48 48" hidden>
                      <circle cx="24" cy="24" r="20" hidden></circle>
                    </svg>
                    <span hidden></span>
                  </div>
                </div>
              </div>
              <div class="row bookTitle">
                <div class="col-12 d-flex justify-content-center">
                  <p>책 제목</p>
                </div>
              </div>
            </div>
            <div class="col-5 carouselBox">
              <div class="row carouselTitle">
                <div class="col-4">
                  <h3>인기 도서</h3>
                </div>
                <div class="col-8 d-flex justify-content-between">
                  <div class="d-flex align-items-end">
                    <p class="carouselBoxWord">책 소개</p>
                  </div>
                  <div class="d-flex align-items-end">
                    <a href="/book/1" class="details carouselBoxWord"
                      >상세보기</a
                    >
                  </div>
                </div>
              </div>
              <div class="row carousel">
                <div class="swiper mySwiper">
                  <div class="swiper-wrapper">
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                    <div class="swiper-slide">
                      <img
                        src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
                        alt=""
                      />
                    </div>
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                  <div class="swiper-pagination"></div>
                  <div class="autoplay-progress">
                    <svg viewBox="0 0 48 48" hidden>
                      <circle cx="24" cy="24" r="20" hidden></circle>
                    </svg>
                    <span hidden></span>
                  </div>
                </div>
              </div>
              <div class="row bookTitle">
                <div class="col-12 d-flex justify-content-center">
                  <p>책 제목</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="searchBox">
          <div class="row">
            <div class="col-md-8 offset-md-2">
              <div class="input-group">
                <button class="custom-button" disabled>통합검색</button>
                <input
                  type="text"
                  class="form-control"
                  placeholder="검색어를 입력하세요"
                />
                <i class="bi bi-search"></i>
                <!-- Bootstrap Icons 사용 -->
              </div>
            </div>
          </div>
        </div>
        <div class="contents">111</div>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script>
      const progressCircle = document.querySelector(".autoplay-progress svg");
      const progressContent = document.querySelector(".autoplay-progress span");
      var swiper = new Swiper(".mySwiper", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        on: {
          autoplayTimeLeft(s, time, progress) {
            progressCircle.style.setProperty("--progress", 1 - progress);
            progressContent.textContent = `${Math.ceil(time / 1000)}s`;
          },
        },
      });
    </script>
  </body>
</html>
