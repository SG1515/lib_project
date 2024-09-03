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

      .location {
        margin-top: 100px;
      }

      .containerBody {
        /* margin: 20px; */
        padding: 50px;
        background-color: #f5f7ff;
      }

      .row {
        margin: 0 0 10px 0;
      }

      .nowPageFont {
        color: #4bb8b3;
      }
      @font-face {
        font-family: "SDSamliphopangche_Outline";
        src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff")
          format("woff");
        font-weight: normal;
        font-style: normal;
      }

      .boxTitle {
        margin-bottom: 20px;
        padding-bottom: 10px;
        font-size: 24px;
        font-weight: 700;
        color: #333;
        border-bottom: 2px solid #000;
      }

      .announceTitle {
        margin-top: 42px;
      }

      .bookCover {
        width: 300px; /* 원하는 너비 */
        height: 400px; /* 원하는 높이 */
        overflow: hidden; /* 이미지가 컨테이너를 넘어가지 않도록 */
      }

      .bookCover img {
        width: 100%; /* 컨테이너 너비에 맞춤 */
        height: 100%; /* 컨테이너 높이에 맞춤 */
        object-fit: cover; /* 이미지 비율을 유지하면서 컨테이너를 완전히 채움 */
      }

      .summary {
        background-color: #f5f5f5;
        padding: 12;
      }

      .summaryBody {
        background-color: white;
      }

      .summary span {
        font-weight: bold;
        font-size: 20px;
      }

      .index {
        background-color: #f5f5f5;
        padding: 12;
      }

      .indexBody {
        background-color: white;
      }

      .index span {
        font-weight: bold;
        font-size: 20px;
      }

      .indexArea {
        margin-top: 30px;
      }
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <div class="location">
        <div class="row d-flex justify-content-end">
          <div class="col-4 location">
            <span>* Home > 자료 찾기 > 통합검색 > </span>
            <span class="nowPageFont">상세 보기</span>
          </div>
        </div>
      </div>
      <div class="containerBody">
        <div class="titleArea">
          <div class="row">
            <div class="categoryTitle col-4">
              <h2>상세정보</h2>
            </div>
          </div>
          <div class="row">
            <div class="col-12 announceTitle">
              <p class="boxTitle">도서정보</p>
            </div>
          </div>
        </div>
        <div class="bookDetailArea">
          <div class="row d-flex justify-content-around">
            <div class="col-4 bookCover">
              <img
                src="${bookDetailDto.imageUrl}"
                alt="bookImage"
                style="width: 100%; height: auto"
              />
            </div>
            <div class="col-6 bookDetail">
              <div class="row">
                <div class="col-4">
                  <p>도서명</p>
                </div>
                <div class="col-8">
                  <p>${bookDetailDto.title}</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>저자</p>
                </div>
                <div class="col-8">
                  <p>${bookDetailDto.author}</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>출판사</p>
                </div>
                <div class="col-8">
                  <p>${bookDetailDto.publisher}</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>출판일</p>
                </div>
                <div class="col-8">
                  <p>${bookDetailDto.publicationYear}</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>페이지수</p>
                </div>
                <div class="col-8">
                  <p>${bookDetailDto.pageSize}</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>ISBN</p>
                </div>
                <div class="col-8">
                  <p>${bookDetailDto.isbn}</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row collectionInformation">
          <div class="col-12 announceTitle">
            <p class="boxTitle">소장정보</p>
          </div>
          <div class="col-12">
            <table
              id="accesionList"
              class="table table-striped"
              width="100%"
              cellpadding="0"
              cellspacing="0"
              summary="소장정보"
            >
              <thead>
                <tr
                  id="detailTh"
                  data-accessionno="등록번호"
                  data-placeno="소장처"
                  data-callno="청구기호"
                  data-materialtype="자료상태"
                  data-returnplandt="반납예정일"
                >
                  <th width="120" scope="col" class="hidden-xs hidden-sm tac">
                    입고일
                  </th>
                  <th width="120" scope="col" class="tac">소장처</th>
                  <th width="*" scope="col" class="tal">청구기호</th>
                  <th width="180" scope="col" class="tac">자료상태</th>
                  <th width="120" scope="col" class="hidden-xs tac">
                    반납예정일
                  </th>
                </tr>
              </thead>

              <tbody>
                <tr>
                  <td width="120" class="hidden-xs hidden-sm">
                    ${bookDetailDto.receiptAt}&nbsp;
                  </td>
                  <td width="120" class="tal">자료실&nbsp;</td>
                  <td width="*" class="tal">${bookDetailDto.callNumber}</td>

                  <td width="120" style="color: blue">
                    ${bookDetailDto.status}
                  </td>

                  <td width="120" class="hidden-xs">
                    ${bookDetailDto.loanEndedAt}
                  </td>
                </tr>
              </tbody>
              <tfoot style="visibility: hidden"></tfoot>
            </table>
          </div>
        </div>
        <div class="summaryArea">
          <div class="row">
            <div class="col-12 announceTitle">
              <p class="boxTitle">관련정보</p>
            </div>
          </div>
          <div class="row d-flex justify-content-center detail">
            <div class="col-11 summary">
              <div class="ms-3">
                <span>초록</span>
              </div>
            </div>
            <div class="col-11 summaryBody">${bookDetailDto.contents}</div>
          </div>
          <div class="row d-flex justify-content-center indexArea">
            <div class="col-11 index">
              <div class="ms-3">
                <span>목차</span>
              </div>
            </div>
            <div class="col-11 indexBody">${bookDetailDto.bookIndex}</div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript"></script>
  </body>
</html>
