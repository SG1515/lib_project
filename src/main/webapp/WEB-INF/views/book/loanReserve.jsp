<%@ page language="java" contentType="text/html; charset=UTF-8" %> <%@taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions"%>
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
        margin-bottom: 20px;
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

      <style>
       html, body {
         position: relative;
         height: 100%;
         font-family: "Noto Sans KR", sans-serif;
         background-color: #f8f9fa;
       }
      .container {
        padding: 2rem 0;
      }
      .boxTitle, .announceTitle {
        margin-top: 1rem;
        padding: 0.5rem;
        background-color: #e9ecef;
        border-radius: 0.25rem;
        color: #495057;
        font-weight: bold;
      }
      .table {
        margin-top: 1rem;
        box-shadow: 0 .125rem .25rem rgba(0,0,0,.075);
      }
      .form-control, .form-select {
        height: calc(2.25rem + 2px);
        padding: .375rem .75rem;
        font-size: 1rem;
        font-weight: 400;
        line-height: 1.5;
        color: #495057;
        background-color: #fff;
        background-clip: padding-box;
        border: 1px solid #ced4da;
        border-radius: .25rem;
        transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
      }
      .btn-outline-secondary {
        color: #495057;
        border-color: #ced4da;
      }
      .btn-outline-secondary:hover {
        color: #fff;
        background-color: #495057;
        border-color: #495057;
      }
    </style>
    </style>
    <title>Document</title>
  </head>
  <body>
    <div class="container">
      <div class="location">
        <div class="row d-flex justify-content-end">
          <div class="col-4 location">
            <span>* Home > My Library > </span>
            <span class="nowPageFont">대출/예약 이력 조회</span>
          </div>
        </div>
      </div>
      <div class="containerBody">
        <div class="boxArea">
          <div class="topArea">
            <div class="row">
              <div class="categoryTitle col-4">
                <h2>대출 이력 조회</h2>
              </div>
            </div>
          </div>
          <div class="searchArea">
            <div class="row search d-flex justify-content-center">
              <div class="col-2">
                <select class="form-select" id="loanTypeSelect" aria-label="Default select example">
                  <option value="title">자료명</option>
                  <option value="author">작가</option>
                  <option value="callNumber">청구번호</option>
                </select>
              </div>
              <div class="col-8">
                <input
                  type="text"
                  class="form-control"
                  id="searchLoanInput"
                  placeholder="검색어를 입력하세요"
                />
              </div>
              <div class="col-2">
                <button
                  class="btn btn-outline-secondary"
                  type="button"
                  id="searchLoanButton"
                >
                  <i class="bi bi-search"></i>
                </button>
              </div>
            </div>
          </div>
          <div class="reserveListArea">
            <div class="row">
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

                    <th width="120" scope="col" class="tac">대출일</th>
                    <th width="120" scope="col" class="tal">청구번호</th>
                    <th width="120" scope="col" class="tal">작가</th>
                    <th width="*" scope="col" class="tal">자료명</th>
                    <th width="180" scope="col" class="tac">반납예정일</th>
                    <th width="120" scope="col" class="hidden-xs tac">
                      반납 여부
                    </th>
                  </tr>
                  </thead>

                  <tbody id="dataBody">
                  <c:forEach items="${bookLoanReserveInfoDto.loanInfoDtos}" var="loan">
                    <tr>
                      <td>${loan.startedAt}</td>
                      <td>${loan.callNumber}</td>
                      <td>${loan.author}</td>
                      <td>${loan.title}</td>
                      <td>${loan.endedAt}</td>
                      <td>
                        <c:choose>
                          <c:when test="${loan.isReturned == true}">
                            반납 완료
                          </c:when>
                          <c:otherwise>
                            미반납
                          </c:otherwise>
                        </c:choose>
                      </td>

                    </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot style="visibility: hidden"></tfoot>
                </table>
              </div>
            </div>
          </div>
          <div class="row page loanPage">
            <nav aria-label="Page navigation example" id="reservePageNav">
              <ul class="pagination justify-content-center">
                <li
                        class="page-item ${bookLoanReserveInfoDto.loanCurrentPage == 1 ? 'disabled' : ''}"
                >
                  <a
                          class="page-link loanPageLink"
                          href="?page=${(bookLoanReserveInfoDto.loanCurrentPage - 1)}"
                  >Previous</a
                  >
                </li>

                <c:forEach
                        var="pageNum"
                        begin="${bookLoanReserveInfoDto.loanStartPage}"
                        end="${bookLoanReserveInfoDto.loanEndPage}"
                >
                  <li
                          class="page-item ${pageNum == bookLoanReserveInfoDto.loanCurrentPage ? 'active' : ''}"
                  >
                    <c:url var="reservePageUrl" value="/books/history/loan/reserve">
                      <c:param name="reservePage" value="${pageNum}" />
                      <c:param name="loanPage" value="${bookLoanReserveInfoDto.loanCurrentPage}" />
                      <c:param name="loanType" value="${param.loanType}" />
                      <c:param name="loanKeyword" value="${fn:escapeXml(param.loanKeyword)}" />
                      <c:param name="reserveType" value="${param.reserveType}" />
                      <c:param name="reserveKeyword" value="${fn:escapeXml(param.reserveKeyword)}" />
                    </c:url>
                    <a class="page-link loanPageLink" href="${pageUrl}">${pageNum}</a>
                  </li>
                </c:forEach>

                <li
                        class="page-item ${bookLoanReserveInfoDto.loanCurrentPage == bookLoanReserveInfoDto.loanRealEndPage ? 'disabled' : ''}"
                >
                  <a
                          class="page-link loanPageLink"
                          href="?page=${(bookLoanReserveInfoDto.loanCurrentPage + 1)}"
                  >Next</a
                  >
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
      <div class="containerBody">
        <div class="boxArea">
          <div class="topArea">
            <div class="row">
              <div class="categoryTitle col-4">
                <h2>예약 이력 조회</h2>
              </div>
            </div>
          </div>
          <div class="reserveListArea">
            <div class="row search d-flex justify-content-center">
              <div class="col-2">
                <select class="form-select" id="reserveTypeSelect" aria-label="Default select example">
                  <option value="title">자료명</option>
                  <option value="author">작가</option>
                  <option value="callNumber">청구번호</option>
                </select>
              </div>
              <div class="col-8">
                <input
                        type="text"
                        class="form-control"
                        id="searchReserveInput"
                        placeholder="검색어를 입력하세요"
                />
              </div>
              <div class="col-2">
                <button
                        class="btn btn-outline-secondary"
                        type="button"
                        id="searchReserveButton"
                >
                  <i class="bi bi-search"></i>
                </button>
              </div>
            </div>
            <div class="row">
              <div class="col-12">
                <table
                  id="reserveList"
                  class="table table-striped"
                  width="100%"
                  cellpadding="0"
                  cellspacing="0"
                  summary="소장정보"
                >
                  <thead>
                    <tr
                      id="reserveDetailTh"
                      data-accessionno="등록번호"
                      data-placeno="소장처"
                      data-callno="청구기호"
                      data-materialtype="자료상태"
                      data-returnplandt="반납예정일"
                    >
                      <th width="120" scope="col" class="tac">예약일</th>
                      <th width="120" scope="col" class="tal">청구번호</th>
                      <th width="120" scope="col" class="tal">작가</th>
                      <th width="*" scope="col" class="tal">자료명</th>
                      <th width="180" scope="col" class="tac">예약대기일</th>
                      <th width="120" scope="col" class="hidden-xs tac">
                        예약 상태
                      </th>
                    </tr>
                  </thead>

                  <tbody id="reserveTBody">
                  <c:forEach items="${bookLoanReserveInfoDto.reserveInfoDtos}" var="reserve">
                    <tr>
                      <td>${reserve.reservedAt}</td>
                      <td>${reserve.callNumber}</td>
                      <td>${reserve.author}</td>
                      <td>${reserve.title}</td>
                      <td>${reserve.loanedAt}</td>
                      <td>${reserve.status}</td>
                    </tr>
                  </c:forEach>
                  </tbody>
                  <tfoot style="visibility: hidden"></tfoot>
                </table>
              </div>
            </div>
          </div>
          <div class="row page reservePage">
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <li
                        class="page-item ${bookLoanReserveInfoDto.reserveCurrentPage == 1 ? 'disabled' : ''}"
                >
                  <a
                          class="page-link reservePageLink"
                          href="?page=${(bookLoanReserveInfoDto.reserveCurrentPage - 1)}"
                  >Previous</a
                  >
                </li>

                <c:forEach
                        var="pageNum"
                        begin="${bookLoanReserveInfoDto.reserveStartPage}"
                        end="${bookLoanReserveInfoDto.reserveEndPage}"
                >
                  <li
                          class="page-item ${pageNum == bookLoanReserveInfoDto.reserveCurrentPage ? 'active' : ''}"
                  >
                    <c:url var="reservePageUrl" value="/books/history/loan/reserve">
                      <c:param name="reservePage" value="${pageNum}" />
                      <c:param name="loanPage" value="${bookLoanReserveInfoDto.loanCurrentPage}" />
                      <c:param name="loanType" value="${param.loanType}" />
                      <c:param name="loanKeyword" value="${fn:escapeXml(param.loanKeyword)}" />
                      <c:param name="reserveType" value="${param.reserveType}" />
                      <c:param name="reserveKeyword" value="${fn:escapeXml(param.reserveKeyword)}" />
                    </c:url>
                    <a class="page-link reservePageLink" href="${pageUrl}">${pageNum}</a>
                  </li>
                </c:forEach>

                <li
                        class="page-item ${bookLoanReserveInfoDto.reserveCurrentPage == bookLoanReserveInfoDto.reserveRealEndPage ? 'disabled' : ''}"
                >
                  <a
                          class="page-link reservePageLink"
                          href="?page=${(bookLoanReserveInfoDto.reserveCurrentPage + 1)}"
                  >Next</a
                  >
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </div>
    <script>

      $(document).ready(function(){
        // '.page-link'에 대한 클릭 이벤트를 동적으로 바인딩
        $(document).on('click', '.loanPageLink', function(e){
          e.preventDefault();  // 기본 이벤트를 막습니다.

          var pageNum = $(this).text();  // 페이지 번호 추출
          console.log(pageNum);  // 콘솔에 페이지 번호 출력

          $(this).closest('.page-item').addClass('active').siblings().removeClass('active');

          var loanKeyword = $('#searchLoanInput').val();
          var loanType = $('#loanTypeSelect').val(); // <select>에서 선택된 옵션 값

          $.ajax({
            url: '/books/loan/history',
            type: 'GET',
            data: {loanKeyword: loanKeyword, loanType: loanType, loanPage: pageNum},
            success: function(response) {
              console.log(response); // 응답 확인
              var newTbody = $('<tbody id="dataBody">');
              response.loanInfoDtos.forEach(function(item) { // loanInfoDtos 배열에 대해 반복
                var row = $('<tr>')
                        .append($('<td>').text(item.startedAt))
                        .append($('<td>').text(item.callNumber))
                        .append($('<td>').text(item.author))
                        .append($('<td>').text(item.title))
                        .append($('<td>').text(item.endedAt))
                        .append($('<td>').text(item.isReturned ? '반납 완료' : '미반납'))
                $('</tr>')

                newTbody.append(row);
              });
              $('#dataBody').replaceWith(newTbody);
            }
          });

        });
      });

      $(document).ready(function(){
        // '.page-link'에 대한 클릭 이벤트를 동적으로 바인딩
        $(document).on('click', '.reservePageLink', function(e){
          e.preventDefault();  // 기본 이벤트를 막습니다.

          var pageNum = $(this).text();  // 페이지 번호 추출

          $(this).closest('.page-item').addClass('active').siblings().removeClass('active');

          var reserveKeyword = $('#searchReserveInput').val();
          var reserveType = $('#reserveTypeSelect').val(); // <select>에서 선택된 옵션 값

          $.ajax({
            url: '/books/reserve/history',
            type: 'GET',
            data: {reserveKeyword: reserveKeyword, reserveType: reserveType, reservePage: pageNum},
            success: function(response) {
              console.log(response); // 응답 확인
              var newReserveTBody = $('<tbody id="reserveTBody">');
              response.reserveInfoDtos.forEach(function(item) { // loanInfoDtos 배열에 대해 반복
                var row = $('<tr>')
                        .append($('<td>').text(item.reservedAt))
                        .append($('<td>').text(item.callNumber))
                        .append($('<td>').text(item.author))
                        .append($('<td>').text(item.title))
                        .append($('<td>').text(item.reservedAt))
                        .append($('<td>').text(item.status))
                newReserveTBody.append(row);
              });

              $('#reserveTBody').replaceWith(newReserveTBody);
            }
          });

        });
      });

      $(document).ready(function(){
        $('#searchLoanButton').click(function(){
          var loanKeyword = $('#searchLoanInput').val();
          var loanType = $('#loanTypeSelect').val(); // <select>에서 선택된 옵션 값
          // 데이터를 객체 형태로 보내기, GET 메소드 사용
          $.ajax({
            url: '/books/loan/history',
            type: 'GET',
            data: {loanKeyword: loanKeyword, loanType: loanType},
            success: function(response) {
              console.log(response); // 응답 확인
              var newTbody = $('<tbody id="dataBody">');
              response.loanInfoDtos.forEach(function(item) { // loanInfoDtos 배열에 대해 반복
                var row = $('<tr>')
                        .append($('<td>').text(item.startedAt))
                        .append($('<td>').text(item.callNumber))
                        .append($('<td>').text(item.author))
                        .append($('<td>').text(item.title))
                        .append($('<td>').text(item.endedAt))
                        .append($('<td>').text(item.isReturned ? '반납 완료' : '미반납'))
                        $('</tr>')

                newTbody.append(row);
              });
              $('#dataBody').replaceWith(newTbody);
            }
          });
        });

        $('#searchReserveButton').click(function(){
          var reserveKeyword = $('#searchReserveInput').val();
          var reserveType = $('#reserveTypeSelect').val(); // <select>에서 선택된 옵션 값
          console.log(reserveKeyword);
          // 데이터를 객체 형태로 보내기, GET 메소드 사용
          $.ajax({
            url: '/books/reserve/history',
            type: 'GET',
            data: {reserveKeyword: reserveKeyword, reserveType: reserveType},
            success: function(response) {
              console.log(response); // 응답 확인
              var newReserveTBody = $('<tbody id="reserveTBody">');
              response.reserveInfoDtos.forEach(function(item) { // loanInfoDtos 배열에 대해 반복
                var row = $('<tr>')
                        .append($('<td>').text(item.reservedAt))
                        .append($('<td>').text(item.callNumber))
                        .append($('<td>').text(item.author))
                        .append($('<td>').text(item.title))
                        .append($('<td>').text(item.reservedAt))
                        .append($('<td>').text(item.status))
                newReserveTBody.append(row);
              });

              $('#reserveTBody').replaceWith(newReserveTBody);
            }
          });
        });
      });
    </script>


  </body>
</html>


