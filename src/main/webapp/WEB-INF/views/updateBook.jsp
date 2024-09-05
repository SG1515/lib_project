<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 수정</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
</head>

<body>
    <section id="container" class="container mt-5">
        <div class="sub_bg"></div>
        <div class="sub_contbox">
            <div class="sub_headbox mb-4">
                <h2 class="sub_title" id="menuTitle">
                    <span><i class="fa fa-book"></i>&nbsp;도서 수정</span>
                </h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                        <li class="breadcrumb-item"><a href="#">도서관</a></li>
                        <li class="breadcrumb-item"><a href="#">도서현황</a></li>
                        <li class="breadcrumb-item active" aria-current="page">도서 수정</li>
                    </ol>
                </nav>
            </div>
            <div class="sub_content">

                <div class="card">
                    <div class="card-body">
                        <form id="formBookEdit" name="formBookEdit" action="/bookcheck.do?action=updateBook" method="post" enctype="multipart/form-data">
                            <input type="hidden" id="BOOK_ID" name="BOOK_ID" value="1">
                            
                            <div class="table-responsive">
                                <table id="tblBookEdit" class="table table-bordered table-hover mt-3">
                                    <thead class="thead-dark">
                                        <tr align="center">
                                            <th>No.</th>
                                            <th>도서 이름</th>
                                            <th>저자</th>
                                            <th>출판사</th>
                                            <th>출판년도</th>
                                            <th>페이지수</th>
                                            <th>분류기호</th>
                                            <th>초록</th>
                                            <th>목차</th>
                                            <th>책사진</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr align="center">
                                            <td>1</td>
                                            <td><input type="text" class="form-control" name="bookName" value="" placeholder="도서 이름" required></td>
                                            <td><input type="text" class="form-control" name="author" value="" placeholder="저자" required></td>
                                            <td><input type="text" class="form-control" name="publisher" value="" placeholder="출판사" required></td>
                                            <td>
                                                <select name="publishYear" class="form-control" required>
                                                    <option value="" disabled selected>출판년도 선택</option>
                                                    <!-- 예시 연도 목록 -->
                                                    <option value="2024">2024</option>
                                                    <option value="2023">2023</option>
                                                    <option value="2022">2022</option>
                                                    <option value="2021">2021</option>
                                                    <!-- 이하 생략 -->
                                                </select>
                                            </td>
                                            <td><input type="number" class="form-control" name="pageCount" value="" placeholder="페이지수" required></td>
                                            <td>
                                                <select name="classification" class="form-control" required>
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
                                            <td><textarea name="abstract" class="form-control" placeholder="초록 입력" required></textarea></td>
                                            <td><textarea name="tableOfContents" class="form-control" placeholder="목차 입력" required></textarea></td>
                                            <td>
                                                <input type="file" class="form-control-file" name="bookImage" accept="image/*">
                                                <br>
                                                <!-- 현재 책 사진을 표시하는 예시 이미지 -->
                                                <img src="default_book_image.png" alt="Current Book Image" style="width: 100px;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="text-right mt-3">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 도서 수정</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="/WEB-INF/views/components/footer.jsp" />

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts.js"></script> <!-- Custom JS -->
</body>

</html>
