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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
    <script src="/src/main/webapp/WEB-INF/views/book/js/book.js"></script>

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
        font-family: "Noto Sans KR";
      }

      .containerBody {
        /* margin: 20px; */

        background-color: #f5f7ff;
      }

      .location {
        margin-top: 100px;
      }

      .row {
        margin: 0 0 10px 0;
      }

      .nowPageFont {
        color: #4bb8b3;
      }

      .topArea {
        padding: 50px;
      }

      .searchIcon {
        font-size: 24px;
        position: absolute;
      }

      .search {
        margin-top: 42px;
      }

      .boxTitle {
        margin-bottom: 20px;
        padding-bottom: 10px;
        font-size: 24px;
        font-weight: 700;
        color: #333;
        border-bottom: 2px solid #000;
      }

      @font-face {
        font-family: "SDSamliphopangche_Outline";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }

      .totalSearchCnt {
        font-size: 24px;
        color: red;
      }

      .bookTitleArea > a {
        font-size: 24px;
        font-weight: 700;
        color: #333;
      }

      .summaryButtonArea {
        margin-top: 20px;
      }

      .summaryButtonArea button {
        background-color: #333;
        font-size: 15px;
        font-weight: 700;
        color: #f5f7ff;
      }

      .bookCover {
        width: 200px; /* 원하는 너비 */
        height: 250px; /* 원하는 높이 */
        overflow: hidden; /* 이미지가 컨테이너를 넘어가지 않도록 */
      }

      .bookCover img {
        width: 100%; /* 컨테이너 너비에 맞춤 */
        height: 100%; /* 컨테이너 높이에 맞춤 */
        object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 완전히 채움 */
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <div class="location">
        <div class="row d-flex justify-content-end">
          <div class="col-4 location">
            <span>* Home > 자료 찾기 > </span>
            <span class="nowPageFont">통합검색</span>
          </div>
        </div>
      </div>
      <div class="containerBody">
        <div class="topArea">
          <div class="row">
            <div class="categoryTitle col-4">
              <h2>통합검색</h2>
            </div>
          </div>
          <div class="row search d-flex justify-content-start">
            <div class="col-10 px-0">
              <input
                type="text"
                class="form-control"
                placeholder="검색어를 입력하세요"
              />
            </div>
            <div class="col-2">
              <button class="btn btn-outline-secondary" type="button">
                <i class="bi bi-search"></i>
              </button>
            </div>
          </div>
          <div class="row filter">
            <div class="form-check col-1">
              <input
                class="form-check-input"
                type="radio"
                name="flexRadioDefault"
                id="flexRadioDefault1"
              />
              <label class="form-check-label" for="flexRadioDefault1">
                인기순
              </label>
            </div>
            <div class="form-check col-1">
              <input
                class="form-check-input"
                type="radio"
                name="flexRadioDefault"
                id="flexRadioDefault2"
                checked
              />
              <label class="form-check-label" for="flexRadioDefault2">
                최신순
              </label>
            </div>
          </div>
          <div class="row">
            <div class="col-10 announceTitle">
              <p class="boxTitle">
                총 검색결과 (<span class="totalSearchCnt">200</span>)
              </p>
            </div>
          </div>
          <div class="bookList">
            <div class="row">
              <div class="col-12">
                <div class="row">
                  <div class="col-1">1</div>
                  <div class="col-4 bookCover">
                    <img
                      src="https://image.aladin.co.kr/product/1354/64/cover/8958781432_1.jpg"
                      alt="강산"
                      onerror="this.src='/common/image/noimage.png'"
                    />
                  </div>
                  <div class="col-6 ms-5">
                    <div class="row">
                      <div class="col-12 bookTitleArea">
                        <a href="">[레이크펜레디움 작은도서관] 강산</a>
                      </div>
                      <div class="col-12">재미난책보</div>
                      <div class="col-12">어린이아현</div>
                      <div class="col-12">2020/12/12</div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                          data-dismiss="modal"
                          data-title="초록"
                        >
                          초록
                        </button>
                      </div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                          data-title="목차"
                        >
                          목차
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-1">1</div>
                  <div class="col-4 bookCover">
                    <img
                      src="https://image.aladin.co.kr/product/1581/37/cover/896142744x_1.jpg"
                      alt="강산"
                      onerror="this.src='/common/image/noimage.png'"
                    />
                  </div>
                  <div class="col-6 ms-5">
                    <div class="row">
                      <div class="col-12 bookTitleArea">
                        <a href="">[레이크펜레디움 작은도서관] 강산</a>
                      </div>
                      <div class="col-12">재미난책보</div>
                      <div class="col-12">어린이아현</div>
                      <div class="col-12">2020/12/12</div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                          data-dismiss="modal"
                        >
                          초록
                        </button>
                      </div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                        >
                          목차
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-1">1</div>
                  <div class="col-4 bookCover">
                    <img
                      src="https://image.aladin.co.kr/product/1354/64/cover/8958781432_1.jpg"
                      alt="강산"
                      onerror="this.src='/common/image/noimage.png'"
                    />
                  </div>
                  <div class="col-6 ms-5">
                    <div class="row">
                      <div class="col-12 bookTitleArea">
                        <a href="">[레이크펜레디움 작은도서관] 강산</a>
                      </div>
                      <div class="col-12">재미난책보</div>
                      <div class="col-12">어린이아현</div>
                      <div class="col-12">2020/12/12</div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                          data-dismiss="modal"
                        >
                          초록
                        </button>
                      </div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                        >
                          목차
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-1">1</div>
                  <div class="col-4 bookCover">
                    <img
                      src="https://image.aladin.co.kr/product/1354/64/cover/8958781432_1.jpg"
                      alt="강산"
                      onerror="this.src='/common/image/noimage.png'"
                    />
                  </div>
                  <div class="col-6 ms-5">
                    <div class="row">
                      <div class="col-12 bookTitleArea">
                        <a href="">[레이크펜레디움 작은도서관] 강산</a>
                      </div>
                      <div class="col-12">재미난책보</div>
                      <div class="col-12">어린이아현</div>
                      <div class="col-12">2020/12/12</div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                          data-dismiss="modal"
                        >
                          초록
                        </button>
                      </div>
                      <div class="col-2 summaryButtonArea">
                        <button
                          class="btn btn-outline-secondary btn-sm"
                          type="button"
                        >
                          목차
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row page">
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <li class="page-item disabled">
                  <a
                    class="page-link"
                    href="#"
                    tabindex="-1"
                    aria-disabled="true"
                    >Previous</a
                  >
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">6</a></li>
                <li class="page-item"><a class="page-link" href="#">7</a></li>
                <li class="page-item"><a class="page-link" href="#">8</a></li>
                <li class="page-item"><a class="page-link" href="#">9</a></li>
                <li class="page-item"><a class="page-link" href="#">10</a></li>
                <li class="page-item">
                  <a class="page-link" href="#">Next</a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
    <div
      class="modal fade"
      id="summaryModal"
      tabindex="-1"
      aria-labelledby="summaryModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="summaryModalLabel">초록</h5>
          </div>
          <div class="modal-body">어쩌구 저쩌구</div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-dismiss="modal"
            >
              닫기
            </button>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
      $(document).ready(function () {
        $(".summaryButtonArea button").click(function () {
          var title = $(this).data("title"); // 버튼에서 data-title 값을 가져옴
          $("#summaryModalLabel").text(title); // 모달의 제목을 업데이트
          $("#summaryModal").modal("show"); // 모달 표시
        });

        $('.btn-secondary[data-dismiss="modal"]').on("click", function () {
          $("#summaryModal").modal("hide"); // 모달 숨기기
        });
      });
    </script>
  </body>
</html>
