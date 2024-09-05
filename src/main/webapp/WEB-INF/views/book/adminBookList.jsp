<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/components/header_admin.jsp" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>도서 관리 (관리자 모드)</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7ff;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .sub_bg {
            background: #f5f7ff;
        }

        .sub_headbox {
            background-color: #ffffff;
            border-bottom: 2px solid #dcdcdc;
            padding: 20px;
        }

        .sub_title {
            font-size: 24px;
            font-weight: 700;
            color: #333;
        }

        .breadcrumb-item a {
            color: #4bb8b3;
        }

        .breadcrumb-item.active {
            color: #333;
        }

        .btn-search {
            background-color: #4bb8b3;
            color: #ffffff;
        }

        .btn-search:hover {
            background-color: #399a91;
        }

        .card {
            background-color: #ffffff;
        }

        .card-body {
            padding: 20px;
        }

        .totalSearchCnt {
            font-size: 24px;
            color: red;
        }

        .bookCover img {
            width: 100%;
            height: auto;
        }

        .table th, .table td {
            text-align: center;
        }

        .pagination .page-link {
            color: #4bb8b3;
        }

        .pagination .page-item.active .page-link {
            background-color: #4bb8b3;
            border-color: #4bb8b3;
        }

        .pagination .page-item.disabled .page-link {
            color: #dcdcdc;
        }
    </style>
</head>

<body>
<section id="container" class="container mt-5">
    <div class="sub_bg"></div>
    <div class="sub_contbox">
        <div class="sub_headbox mb-4">
            <h2 class="sub_title" id="menuTitle">
                <br>
                <br>
                <br>
                <br>
                <span><i class="fa fa-book"></i>&nbsp;도서 관리 (관리자 모드)</span>
            </h2>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                    <li class="breadcrumb-item"><a href="#">도서관 관리</a></li>
                    <li class="breadcrumb-item active" aria-current="page">도서 관리</li>
                </ol>
            </nav>
        </div>
        <div class="card">
            <div class="card-body">
                <div class="container admin-container">
                    <form class="form-inline mb-4" action="/searchBooks" method="get">
                        <div class="form-group mr-3">
                            <label for="searchCategory" class="mr-2">검색 기준</label>
                            <select class="form-control" id="searchCategory" name="category">
                                <option value="isbn">isbn</option>
                                <option value="title">도서명</option>
                                <option value="author">저자</option>
                                <option value="publisher">출판사</option>
                            </select>
                        </div>

                        <div class="form-group mr-3">
                            <label for="searchQuery" class="sr-only">검색어</label>
                            <input type="text" class="form-control" id="searchQuery" name="query" placeholder="검색어를 입력하세요">
                        </div>

                        <button type="submit" class="btn btn-search"><i class="fa fa-search"></i> 검색</button>
                    </form>

                    <p>총 검색결과 <span class="text-danger font-weight-bold"></span>
                        (<span class="totalSearchCnt">${bookPageDto.totalCount}</span>)
                    </p>

                    <div class="table-responsive">
                        <table id="tblBookList" class="table table-bordered table-hover mt-3">
                            <thead class="thead-dark">
                            <tr align="center">
                                <th>청구번호</th>
                                <th>도서 이름</th>
                                <th>책사진</th>
                                <th>관리</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bookPageDto.bookSimpleDtoList}" var="book" varStatus="status">
                                <tr align="center">
                                    <td>${book.callNumber}</td>
                                    <td>${book.title}</td>
                                    <td>
                                        <img src="${book.imageUrl}" class="img-fluid" alt="Book Image" style="width: 250px; height: auto;">
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-sm btn-outline-secondary mb-2 btn-info"
                                                data-title="${book.title}"
                                                data-callNumber="${book.callNumber}"
                                                data-imageUrl="${book.imageUrl}"
                                                data-author="${book.author}"
                                                data-publisher="${book.publisher}"
                                                data-publicationYear="${book.publicationYear}"
                                                data-contents="${book.contents}"
                                                data-bookIndex="${book.bookIndex}"
                                                data-toggle="modal" data-target="#summaryModal">
                                            <i class="fa fa-info-circle"></i> 상세 보기
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary mb-2"><i
                                                class="fa fa-edit"></i> 수정</button>
                                        <button type="button" class="btn btn-sm btn-outline-danger mb-2"><i
                                                class="fa fa-trash"></i> 삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <nav aria-label="Page navigation example">
                        <ul class="pagination justify-content-center">
                            <li class="page-item ${bookPageDto.currentPage == 1 ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${(bookPageDto.currentPage - 1)}">이전</a>
                            </li>

                            <c:forEach var="pageNum" begin="${bookPageDto.startPage}" end="${bookPageDto.endPage}">
                                <li class="page-item ${pageNum == bookPageDto.currentPage ? 'active' : ''}">
                                    <c:url var="pageUrl" value="">
                                        <c:param name="page" value="${pageNum}" />
                                        <c:param name="category" value="${param.category}" />
                                        <c:param name="query" value="${fn:escapeXml(param.query)}" />
                                    </c:url>
                                    <a class="page-link" href="${pageUrl}">${pageNum}</a>
                                </li>
                            </c:forEach>

                            <li class="page-item ${bookPageDto.currentPage == bookPageDto.realEndPage ? 'disabled' : ''}">
                                <a class="page-link" href="?page=${(bookPageDto.currentPage + 1)}">다음</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/components/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        $(".btn-info").click(function () {
            var button = $(this);
            var title = button.data("title");
            var callNumber = button.data("callNumber");
            var imageUrl = button.data("imageUrl");
            var author = button.data("author");
            var publisher = button.data("publisher");
            var publicationYear = button.data("publicationYear");
            var contents = button.data("contents");
            var bookIndex = button.data("bookIndex");

            // 모달의 제목과 내용을 업데이트
            $("#summaryModalLabel").text(title);
            $("#modalCallNumber").text(callNumber);
            $("#modalAuthor").text(author);
            $("#modalPublisher").text(publisher);
            $("#modalPublicationYear").text(publicationYear);
            $("#modalContents").text(contents);
            $("#modalBookIndex").text(bookIndex);

            // 이미지 URL이 있는 경우에만 이미지 업데이트
            if (imageUrl) {
                $("#modalImageUrl").attr("src", imageUrl);
                $("#modalImageUrl").show();
            } else {
                $("#modalImageUrl").hide();
            }

            // 모달 표시
            $("#summaryModal").modal("show");
        });

        $('#searchButton').click(function () {
            let inputKeyword = $('#searchInput').val();
            let currentUrl = new URL(window.location.href);
            let searchParams = currentUrl.searchParams;
            searchParams.set("keyword", inputKeyword);
            searchParams.set("page", 1);
            searchParams.set("type", $('input[name="flexRadioDefault"]:checked').val());
            window.location.href = currentUrl.toString();
        });

        var urlParams = new URLSearchParams(window.location.search);
        var type = urlParams.get("type");

        $('input[name="flexRadioDefault"]').prop("checked", false);
        if (type) {
            $('input[name="flexRadioDefault"][value="' + type + '"]').prop("checked", true);
        }
    });
</script>

<!-- Modal Structure -->
<div class="modal fade" id="summaryModal" tabindex="-1" role="dialog" aria-labelledby="summaryModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="summaryModalLabel">도서 상세 정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="modalCallNumber">청구번호:</label>
                    <p id="modalCallNumber"></p>
                </div>
                <div class="form-group">
                    <label for="modalTitle">도서명:</label>
                    <p id="modalTitle"></p>
                </div>
                <div class="form-group">
                    <label for="modalAuthor">저자:</label>
                    <p id="modalAuthor"></p>
                </div>
                <div class="form-group">
                    <label for="modalPublisher">출판사:</label>
                    <p id="modalPublisher"></p>
                </div>
                <div class="form-group">
                    <label for="modalPublicationYear">출판년도:</label>
                    <p id="modalPublicationYear"></p>
                </div>
                <div class="form-group">
                    <label for="modalContents">내용:</label>
                    <p id="modalContents"></p>
                </div>
                <div class="form-group">
                    <label for="modalBookIndex">책 인덱스:</label>
                    <p id="modalBookIndex"></p>
                </div>
                <div class="form-group">
                    <label for="modalImageUrl">책 사진:</label>
                    <img id="modalImageUrl" class="img-fluid" src="" alt="Book Image" style="display:none;">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>
