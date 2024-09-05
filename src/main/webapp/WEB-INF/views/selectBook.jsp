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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<section id="container" class="container mt-5">
    <div class="sub_bg"></div>
    <div class="sub_contbox">
        <div class="sub_headbox mb-4">
            <h2 class="sub_title" id="menuTitle"><br><br><br><br>
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
                                        <button type="button" class="btn btn-sm btn-outline-secondary mb-2"
                                                data-toggle="modal" data-target="#summaryModal"
                                                data-callnumber="${book.callNumber}"
                                                data-title="${book.title}"
                                                data-author="${book.author}"
                                                data-publisher="${book.publisher}"
                                                data-publicationyear="${book.publicationYear}"
                                                data-contents="${book.contents}"
                                                data-bookindex="${book.bookIndex}"
                                                data-imageurl="${book.imageUrl}">
                                            <i class="fa fa-info-circle"></i> 상세 보기
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-secondary mb-2"
                                                data-toggle="modal" data-target="#editModal"
                                                data-callnumber="${book.callNumber}"
                                                data-title="${book.title}"
                                                data-author="${book.author}"
                                                data-publisher="${book.publisher}"
                                                data-publicationyear="${book.publicationYear}"
                                                data-contents="${book.contents}"
                                                data-bookindex="${book.bookIndex}"
                                                data-imageurl="${book.imageUrl}">
                                            <i class="fa fa-edit"></i> 수정
                                        </button>
                                        <button type="button" class="btn btn-sm btn-outline-danger mb-2 deleteBookBtn"
                                                data-callnumber="${book.callNumber}">
                                            <i class="fa fa-trash"></i> 삭제
                                        </button>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {

        // 상세보기 버튼 클릭 시 모달에 정보 설정
        $(".btn-outline-secondary[data-toggle='modal'][data-target='#summaryModal']").click(function () {
            var callNumber = $(this).data("callnumber");
            var title = $(this).data("title");
            var author = $(this).data("author");
            var publisher = $(this).data("publisher");
            var publicationyear = $(this).data("publicationyear");
            var contents = $(this).data("contents");
            var bookIndex = $(this).data("bookindex");
            var imageUrl = $(this).data("imageurl");

            $("#modalCallNumber").text(callNumber);
            $("#modalTitle").text(title);
            $("#modalAuthor").text(author);
            $("#modalPublisher").text(publisher);
            $("#modalPublicationyear").text(publicationyear);
            $("#modalBookIndex").text(bookIndex);
            $("#modalImageUrl").attr("src", imageUrl);
            $("#modalContents").text(contents);

            // 저장 버튼 클릭 시 Edit 모달로 데이터 전송
            $("#editBookBtn").data({
                callNumber: callNumber,
                title: title,
                author: author,
                publisher: publisher,
                publicationYear: publicationyear,
                contents: contents,
                bookIndex: bookIndex,
                imageUrl: imageUrl
            });
        });

        // 수정 버튼 클릭 시 수정 모달에 데이터 설정
        $("#editBookBtn").click(function () {
            var bookData = $(this).data();

            $("#editCallNumber").val(bookData.callNumber);
            $("#editTitle").val(bookData.title);
            $("#editAuthor").val(bookData.author);
            $("#editPublisher").val(bookData.publisher);
            $("#editPublicationyear").val(bookData.publicationYear);
            $("#editContents").val(bookData.contents);
            $("#editBookIndex").val(bookData.bookIndex);
            $("#editImageUrl").val(bookData.imageUrl);

            $("#summaryModal").modal("hide");
            $("#editModal").modal("show");
        });

        // 수정 모달의 저장 버튼 클릭 시 AJAX로 수정 요청
        $("#saveBookBtn").click(function () {
            var bookData = {
                callNumber: $("#editCallNumber").val(),
                title: $("#editTitle").val(),
                author: $("#editAuthor").val(),
                publisher: $("#editPublisher").val(),
                publicationYear: $("#editPublicationyear").val(),
                contents: $("#editContents").val(),
                bookIndex: $("#editBookIndex").val(),
                imageUrl: $("#editImageUrl").val()
            };

            $.ajax({
                url: '/updateBook',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(bookData),
                success: function (response) {
                    alert('도서 정보가 성공적으로 수정되었습니다.');
                    $("#editModal").modal("hide");
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert('수정 중 오류가 발생했습니다.');
                }
            });
        });

        // 삭제 버튼 클릭 시 도서 삭제
        $(".deleteBookBtn").click(function () {
            var callNumber = $(this).data("callnumber");

            if (confirm("정말로 이 도서를 삭제하시겠습니까?")) {
                $.ajax({
                    url: "/deleteBook",
                    type: "POST",
                    contentType: 'application/json',
                    data: JSON.stringify({ callNumber: callNumber }),
                    success: function (response) {
                        alert("도서가 삭제되었습니다.");
                        window.location.reload();
                    },
                    error: function (xhr, status, error) {
                        alert("도서 삭제에 실패했습니다.");
                    }
                });
            }
        });

        // 모달 닫기 버튼 클릭 시 모달 숨기기
        $('.btn-secondary[data-dismiss="modal"]').on("click", function () {
            $("#summaryModal").modal("hide");
            $("#editModal").modal("hide");
        });
    });
</script>


<!-- 상세보기 모달 -->
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
                    <label for="modalTitle">도서 제목:</label>
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
                    <label for="modalPublicationyear">출판연도:</label>
                    <p id="modalPublicationyear"></p>
                </div>
                <div class="form-group">
                    <label for="modalBookIndex">책 인덱스:</label>
                    <p id="modalBookIndex"></p>
                </div>
                <div class="form-group">
                    <label for="modalImageUrl">책 사진:</label>
                    <img id="modalImageUrl" class="img-fluid" src="" alt="Book Image">
                </div>
                <div class="form-group">
                    <label for="modalContents">내용:</label>
                    <p id="modalContents"></p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="editBookBtn">수정</button>
            </div>
        </div>
    </div>
</div>

<!-- 수정 모달 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">도서 정보 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editForm">
                    <div class="form-group">
                        <label for="editCallNumber">청구번호:</label>
                        <input type="text" class="form-control" id="editCallNumber" name="callNumber" readonly>
                    </div>
                    <div class="form-group">
                        <label for="editTitle">도서 제목:</label>
                        <input type="text" class="form-control" id="editTitle" name="title">
                    </div>
                    <div class="form-group">
                        <label for="editAuthor">저자:</label>
                        <input type="text" class="form-control" id="editAuthor" name="author">
                    </div>
                    <div class="form-group">
                        <label for="editPublisher">출판사:</label>
                        <input type="text" class="form-control" id="editPublisher" name="publisher">
                    </div>
                    <div class="form-group">
                        <label for="editPublicationyear">출판연도:</label>
                        <input type="text" class="form-control" id="editPublicationyear" name="publicationYear">
                    </div>
                    <div class="form-group">
                        <label for="editContents">내용:</label>
                        <textarea class="form-control" id="editContents" name="contents"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="editBookIndex">책 인덱스:</label>
                        <input type="text" class="form-control" id="editBookIndex" name="bookIndex">
                    </div>
                    <div class="form-group">
                        <label for="editImageUrl">책 사진 URL:</label>
                        <input type="text" class="form-control" id="editImageUrl" name="imageUrl">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="saveBookBtn">저장</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>