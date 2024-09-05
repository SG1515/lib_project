<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <jsp:include page="/WEB-INF/views/components/header_admin.jsp" />
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <title>이용자 권한 승인 (관리자 모드)</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
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
                        <span><i class="fa fa-book"></i>&nbsp;이용자 권한 승인 (관리자 모드)</span>
                    </h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="#">도서관 관리</a></li>
                            <li class="breadcrumb-item active" aria-current="page">이용자 권한 승인 (관리자 모드)</li>
                        </ol>
                    </nav>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="container admin-container">

                            <div>
                                <p>총 검색결과 <span class="text-danger font-weight-bold">(45)</span>
                                    <div class="text-right mt-3">
                                        <button type="button" class="btn btn-success mb-2"
                                        onclick="location.href='/admin/users/new'">
                                        <i class="fa fa-plus-circle"></i> 사용자 추가
                                    </button>
                                    </div>
                                </p>

                                <div class="table-responsive">
                                    <table id="tblBookLoanList" class="table table-bordered table-hover mt-3">
                                        <thead class="thead-dark">
                                            <tr align="center">
                                                <th style="width: 5%; font-size: 0.8rem;">사용자번호</th>
                                                <th style="width: 5%; font-size: 0.8rem;">ID</th>
                                                <th style="width: 5%; font-size: 0.8rem;">이름</th>
                                                <th style="width: 5%; font-size: 0.8rem;">이메일</th>
                                                <th style="width: 5%; font-size: 0.8rem;">생년월일</th>
                                                <th style="width: 5%; font-size: 0.8rem;">전화번호</th>
                                                <th style="width: 5%; font-size: 0.8rem;">등록년도</th>
                                                <th style="width: 5%; font-size: 0.8rem;">주소</th>
                                                <th style="width: 5%; font-size: 0.8rem;">주소확인여부</th>
                                                <th style="width: 5%; font-size: 0.8rem;">관리</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>0001</td>
                                                <td>leeyl1234</td>
                                                <td>이예림</td>
                                                <td>예림@naver.com</td>
                                                <td>1999.03.04</td>
                                                <td>010-3189-2720</td>
                                                <td>800</td>
                                                <td>서울시 동작구 반포대로 17</td>
                                                <td>X</td>
                                                <td>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary mb-2"
                                                        onclick="editUser('1')"><i class="fa fa-edit"></i> 수정</button>
                                                    <button type="button" class="btn btn-sm btn-outline-danger mb-2"
                                                        onclick="deleteUser('1')"><i class="fa fa-trash"></i>
                                                        삭제</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>0002</td>
                                                <td>leeyl1231</td>
                                                <td>우영두</td>
                                                <td>영두@naver.com</td>
                                                <td>2000.01.02</td>
                                                <td>010-1234-5678</td>
                                                <td>800</td>
                                                <td>서울시 송파구 중대로 135</td>
                                                <td>O</td>
                                                <td>
                                                    <button type="button" class="btn btn-sm btn-outline-secondary mb-2"
                                                        onclick="editUser('2')"><i class="fa fa-edit"></i> 수정</button>
                                                    <button type="button" class="btn btn-sm btn-outline-danger mb-2"
                                                        onclick="deleteUser('2')"><i class="fa fa-trash"></i>
                                                        삭제</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">다음</a></li>
                                </ul>
                            </nav>
                        </div>
        </section>

        <jsp:include page="/WEB-INF/views/components/footer.jsp" />

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="scripts.js"></script>

        <script>
            function editUser(userId) {
                window.location.href = '/admin/users/edit/' + userId;
            }

            function deleteUser(userId) {
                if (confirm('정말 삭제하시겠습니까?')) {
                    window.location.href = '/admin/users/delete/' + userId;
                }
            }
        </script>
    </body>

    </html>