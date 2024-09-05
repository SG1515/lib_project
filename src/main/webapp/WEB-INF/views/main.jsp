<%@ page language="java" contentType="text/html; charset=UTF-8" %> <%@taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
      rel="stylesheet"
    />

    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <style>
      html,
      body {
        position: relative;
        height: 100%;
      }

      body {
        background: #ffffff;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
        font-family: "Noto Sans KR";
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
        /* margin: 20px; */
        background-color: #f5f7ff;
      }

      .containerBanner {
        margin-top: 200px;
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

      .subBox {
        margin: 60px 30px 0px 30px;
        padding-bottom: 20px;
      }

      .announceTitle p {
        font-size: 20px;
        font-weight: bold;
      }

      .subBoxGroup > div {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
      }

      .carouselGroup > div {
        background-color: white;
        padding: 15px;
        border-radius: 10px;
      }

      .boxTitle {
        margin-bottom: 20px;
        padding-bottom: 10px;
        font-size: 24px;
        font-weight: 700;
        color: #333;
        border-bottom: 2px solid #000;
      }

      .noticeGroup {
        border: 1px solid #e8e8e8;
      }

      @font-face {
        font-family: "SDSamliphopangche_Outline";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }

      .tag {
        background-color: #f5f7ff;
        color: #56c8d8;
        border-radius: 10px;
        padding: 5px 10px;
        font-size: 15px;
        font-weight: bold;
        justify-content: center; /* 수평 중앙 정렬 */
        align-items: center; /* 수직 중앙 정렬 */
        display: flex;
      }

      .book-swiper img {
        width: 200px !important ; /* 원하는 너비 */
        height: 300px !important ; /* 원하는 높이 */
        overflow: hidden; /* 이미지가 컨테이너를 넘어가지 않도록 */
      }

      .book-swiper img {
        width: 100%; /* 컨테이너 너비에 맞춤 */
        height: 100%; /* 컨테이너 높이에 맞춤 */
        object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 완전히 채움 */
      }

      .swiper-slide {
        display: flex;
        flex-direction: column; /* 요소를 세로 방향으로 정렬 */
        align-items: center; /* 중앙 정렬 */
        text-align: center;
      }

      .swiper-slide .slide-image img {
        width: 100%; /* 이미지 너비를 슬라이드에 맞춤 */
        height: auto; /* 이미지 높이를 자동으로 설정 */
      }

      .swiper-slide .slide-title p {
        margin-top: 15px; /* 이미지와 제목 사이의 간격 증가 */
        font-size: 18px; /* 필요한 경우 제목의 글꼴 크기 조정 */
        font-weight: bold; /* 제목의 글꼴 굵기 */
        color: #333; /* 제목의 글꼴 색상 */
      }

      .swiper-slide .slide-details {
        margin-top: 10px; /* 제목과 상세 목록 사이의 간격 증가 */
        font-size: 14px; /* 상세 목록의 글꼴 크기 조정 */
      }

    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <div class="containerBanner">
        <div class="row carousel">
          <div class="swiper mySwiperMain">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <img
                  src="https://hwaseong.egentouch.com/media/banner_pool/1037/1037007/4d1b2f9d-62ae-4501-8903-da2bae0b30d1.png"
                  alt=""
                />
              </div>
              <div class="swiper-slide">
                <img
                  src="https://hwaseong.egentouch.com/media/banner_pool/1037/1037007/a3ef9f7c-3787-4645-bbd4-3647dd05f66c.jpg"
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
      </div>
      <div class="containerBody">
        <div class="searchBox">
          <div class="row">
            <div class="col-md-8 offset-md-2">
              <div class="input-group">
                <button class="custom-button" disabled>통합검색</button>
                <input
                  type="text"
                  class="form-control"
                  id="searchInput"
                  placeholder="검색어를 입력하세요"
                />
              </div>
            </div>
            <div class="col-2">
              <button
                class="btn btn-outline-secondary"
                type="button"
                id="searchButton"
              >
                <i class="bi bi-search"></i>
              </button>
            </div>
          </div>
        </div>
        <div class="bookCarousel">
          <div class="row d-flex justify-content-between carouselGroup">
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
                    <a
                      href="/search?keyword=&page=1&type=최신순"
                      class="details carouselBoxWord"
                      >더보기</a
                    >
                  </div>
                </div>
              </div>
              <div class="row carousel">
                <div class="swiper mySwiper">
                  <div class="swiper-wrapper book-swiper">
                    <c:forEach
                      items="${topTenBooks.bookRecentlyTopTenDtos}"
                      var="book"
                    >
                      <div class="swiper-slide">
                        <div class="slide-image">
                          <a href="/search/${book.callNumber}">
                            <img src="${book.imageUrl}" alt="${book.title}" />
                          </a>
                        </div>
                        <div class="slide-title">
                          <p>${book.title}</p>
                        </div>
                      </div>
                    </c:forEach>
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
            </div>
            <div class="col-5 carouselBox">
              <div class="row carouselTitle">
                <div class="col-4">
                  <h3>인기 도서</h3>
                </div>
                <div class="col-8 d-flex justify-content-between">
                  <div class="d-flex align-items-end">
                    <p class="carouselBoxWord">단행본</p>
                  </div>
                  <div class="d-flex align-items-end">
                    <a
                      href="/search?keyword=&page=1&type=인기순"
                      class="details carouselBoxWord"
                      >더보기</a
                    >
                  </div>
                </div>
              </div>
              <div class="row carousel">
                <div class="swiper mySwiper">
                  <div class="swiper-wrapper book-swiper">
                    <c:forEach
                      items="${topTenBooks.bookPopularTopTenDtos}"
                      var="book"
                    >
                      <div class="swiper-slide">
                        <div class="slide-image">
                          <a href="/search/${book.callNumber}">
                            <img src="${book.imageUrl}" alt="${book.title}" />
                          </a>
                        </div>
                        <div class="slide-title">
                          <p>${book.title}</p>
                        </div>
                      </div>
                    </c:forEach>
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
            </div>
          </div>
        </div>

        <div class="subBox">
          <div class="row d-flex justify-content-between subBoxGroup">
            <div class="col-5 announcementBox">
              <div class="announceTitle">
                <p class="boxTitle">공지사항</p>
              </div>
              <div class="row justify-content-between">
                <div class="col-6 noticeGroup">
                  <div class="row">
                    <div class="col-12">
                      <div class="date">
                        <p>2024-08-27</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="author">
                        <p>관리자</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="announceContent">
                        <p>숲 체험 모집을 시작합니다. 여러분 모두 모이세요~</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-6 noticeGroup">
                  <div class="row">
                    <div class="col-12">
                      <div class="date">
                        <p>2024-08-24</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="author">
                        <p>관리자</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="announceContent">
                        <p>숲 체험 모집을 시작합니다. 여러분 모두 모이세요~</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-5 announcementBox">
              <div class="announceTitle">
                <p class="boxTitle">KCC정보통신 작은도서관 일정</p>
              </div>
              <div class="row justify-content-between">
                <div class="col-6 noticeGroup">
                  <div class="row">
                    <div class="col-12">
                      <div class="date">
                        <p>2024-09-05</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="author">
                        <p>정상 운영</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="announceContent">
                        <p>09:00 AM ~ 20:00 PM</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-6 noticeGroup">
                  <div class="row">
                    <div class="col-12">
                      <div class="date">
                        <p>2024-09-06</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="author">
                        <p style="color: red">휴무일</p>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="announceContent">
                        <p>매주 토요일은 휴무일 입니다.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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

      var swiper = new Swiper(".mySwiperMain", {
        spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 5000,
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

      document
        .getElementById("searchButton")
        .addEventListener("click", function () {
          let inputKeyword = document.getElementById("searchInput").value; // 입력 필드로부터 검색어를 가져옴
          let currentUrl = new URL(window.location.href); // 현재 페이지의 URL을 가져옴
          currentUrl.pathname += "search";
          let searchParams = currentUrl.searchParams; // URL의 검색 파라미터 객체를 가져옴

          // 검색 파라미터에 keyword 값을 추가하거나 변경
          searchParams.set("keyword", inputKeyword);
          searchParams.set("page", 1); // 검색어를 변경하면 페이지를 1로 초기화
          searchParams.set("type", "인기순");

          // 변경된 URL로 페이지를 이동
          window.location.href = currentUrl.toString();
        });
    </script>
  </body>
  <jsp:include page="/WEB-INF/views/components/footer.jsp" />
</html>
