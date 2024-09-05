<%@ page language="java" contentType="text/html; charset=UTF-8" %> <%@taglib
        prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="loanListArea">
    <div class="row">
        <div class="col-12">
            <table class="table">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>청구번호</th>
                    <th>자료명</th>
                    <th>대출일</th>
                    <th>반납예정일</th>
                    <th>대출연장</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${bookLoanReserveInfoDto.loanInfoDtos}" var="loan">
                    <tr>
                        <td>1</td>
                        <td>${loan.callNumber}</td>
                        <td>${loan.title}</td>
                        <td>${loan.startedAt}</td>
                        <td>${loan.endedAt}</td>
                        <td width="120" style="color: blue">
                            <button
                                    class="btn btn-primary"
                                    type="button"
                                    style="width: 60px; font-size: 16px"
                                ${loan.extentionCount == 0 && !loan.isReturned && loan.endedAt > fn:escapeXml(param.today) ? '' : 'disabled'}
                            >
                                연장
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="row page">
    <nav aria-label="Page navigation example" id="loanPageNav">
        <ul class="pagination justify-content-center">
            <li
                    class="page-item ${bookLoanReserveInfoDto.loanCurrentPage == 1 ? 'disabled' : ''}"
            >
                <a
                        class="page-link"
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
                    <c:url var="loanPageUrl" value="/books/history/loan/reserve">
                        <c:param name="loanPage" value="${pageNum}" />
                        <c:param name="reservePage" value="${bookLoanReserveInfoDto.reserveCurrentPage}" />
                        <c:param name="loanType" value="${param.loanType}" />
                        <c:param name="loanKeyword" value="${fn:escapeXml(param.loanKeyword)}" />
                        <c:param name="reserveType" value="${param.reserveType}" />
                        <c:param name="reserveKeyword" value="${fn:escapeXml(param.reserveKeyword)}" />
                    </c:url>
                    <a class="page-link" href="${pageUrl}">${pageNum}</a>
                </li>
            </c:forEach>

            <li
                    class="page-item ${bookLoanReserveInfoDto.loanCurrentPage == bookLoanReserveInfoDto.loanRealEndPage ? 'disabled' : ''}"
            >
                <a
                        class="page-link"
                        href="?page=${(bookLoanReserveInfoDto.loanCurrentPage + 1)}"
                >Next</a
                >
            </li>
        </ul>
    </nav>
</div>