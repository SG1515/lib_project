<%@ page language="java" contentType="text/html; charset=UTF-8" %> <%@taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions"%>

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
                    <th
                            width="40"
                            scope="col"
                            class="hidden-xs hidden-sm tac"
                    >
                        no
                    </th>
                    <th width="120" scope="col" class="tac">예약일</th>
                    <th width="120" scope="col" class="tal">청구번호</th>
                    <th width="*" scope="col" class="tal">자료명</th>
                    <th width="180" scope="col" class="tac">예약대기일</th>
                    <th width="120" scope="col" class="hidden-xs tac">
                        예약 취소
                    </th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${bookLoanReserveInfoDto.reserveInfoDtos}" var="reserve">
                    <tr>
                        <td>1</td>
                        <td>${reserve.callNumber}</td>
                        <td>${reserve.title}</td>
                        <td>${reserve.reservedAt}</td>
                        <td>${reserve.status}</td>
                        <td width="120" style="color: blue">
                            <button
                                    class="btn btn-primary"
                                    type="button"
                                    style="width: 60px; font-size: 16px"
                            >
                                취소
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot style="visibility: hidden"></tfoot>
            </table>
        </div>
    </div>
</div>
<div class="row page">
    <nav aria-label="Page navigation example" id="reservePageNav">
        <ul class="pagination justify-content-center">
            <li
                    class="page-item ${bookLoanReserveInfoDto.reserveCurrentPage == 1 ? 'disabled' : ''}"
            >
                <a
                        class="page-link"
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
                    <a class="page-link" href="${pageUrl}">${pageNum}</a>
                </li>
            </c:forEach>

            <li
                    class="page-item ${bookLoanReserveInfoDto.reserveCurrentPage == bookLoanReserveInfoDto.reserveRealEndPage ? 'disabled' : ''}"
            >
                <a
                        class="page-link"
                        href="?page=${(bookLoanReserveInfoDto.reserveCurrentPage + 1)}"
                >Next</a
                >
            </li>
        </ul>
    </nav>
</div>