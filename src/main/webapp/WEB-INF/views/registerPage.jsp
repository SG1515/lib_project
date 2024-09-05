<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="/WEB-INF/views/components/header_admin.jsp" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>신규 도서 등록 (관리자 모드)</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        .form-control-sm {
            font-size: 0.8rem;
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
                    <span><i class="fa fa-book"></i>&nbsp;신규 도서 등록(관리자 모드)</span>
                </h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                        <li class="breadcrumb-item"><a href="#">도서관 관리</a></li>
                        <li class="breadcrumb-item active" aria-current="page">신규 도서 등록(관리자 모드)</li>
                    </ol>
                </nav>
            </div>
            <div class="sub_content">
                <div class="alert alert-info mb-4">
                    신규도서 추가가능 여부 : <strong>추가가능</strong>, &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp신규도서 추가불가 기간 : ~
                    <br>추가불가 사유 :
                </div>
                <div class="card">
                    <div class="card-body">
                        <form id="formBookCheckList" name="formBookCheckList" action="/admin/books/newbook" method="post"
                            enctype="multipart/form-data">
                            <input type="hidden" id="MASTER_ID" name="MASTER_ID" value="0">
                            <input type="hidden" id="searchMeterialType" name="searchMeterialType" value="m">

                            <div class="table-responsive">
                                <table id="tblBookLoanList" class="table table-bordered table-hover mt-3">
                                    <thead class="thead-dark">
                                        <tr align="center">
                                            <th style="font-size: 0.8rem;">Isbn</th>
                                            <th style="font-size: 0.8rem;">도서 이름</th>
                                            <th style="font-size: 0.8rem;">저자</th>
                                            <th style="font-size: 0.8rem;">출판사</th>
                                            <th style="font-size: 0.8rem;">출판년도</th>
                                            <th style="font-size: 0.8rem;">페이지수</th>
                                            <th style="font-size: 0.8rem;">분류기호</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr align="center">
                                            <td><input type="number" class="form-control form-control-sm" name="isbn"
                                                placeholder="isbn" required></td>
                                            <td><input type="text" class="form-control form-control-sm" name="title"
                                                    placeholder="도서 이름" required></td>
                                            <td><input type="text" class="form-control form-control-sm" name="author"
                                                    placeholder="저자" required></td>
                                            <td><input type="text" class="form-control form-control-sm" name="publisher"
                                                    placeholder="출판사" required></td>
                                            <td>
                                                <input type="date" name="publicationYear" class="form-control form-control-sm" required>
                                            </td>
                                            <td><input type="number" class="form-control form-control-sm" name="pageSize"
                                                    placeholder="페이지수" required></td>
                                            <td>
                                                <select name="categoryNumber" class="form-control form-control-sm" required>
                                                    <option value="" disabled selected>분류기호 선택</option>
                                                    <option value="000">총류</option>
                                                    <option value="100">철학</option>
                                                    <option value="200">종교</option>
                                                    <option value="300">사회과학</option>
                                                    <option value="400">자연과학</option>
                                                    <option value="500">기술과학</option>
                                                    <option value="600">예술</option>
                                                    <option value="700">언어</option>
                                                    <option value="800">문학</option>
                                                    <option value="900">역사</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr align="center">
                                            <td colspan="7" class="text-center">기타 정보</td>
                                        </tr>
                                        <tr align="center">
                                            <td><input type="text" class="form-control form-control-sm" name="callNumber"
                                                       placeholder="청구기호" required></td>
                                            <td colspan="3"><textarea name="contents" class="form-control form-control-sm" placeholder="초록 입력"
                                                    required></textarea></td>
                                            <td colspan="2"><textarea name="bookIndex" class="form-control form-control-sm"
                                                    placeholder="목차 입력" required></textarea></td>
                                                    <td colspan="2"><textarea name="imageUrl" class="form-control form-control-sm"
                                                        placeholder="도서 사진" required></textarea></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="text-right mt-3">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-plus-circle"></i> 도서등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/components/footer.jsp" />

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>
