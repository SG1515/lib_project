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
                src="https://image.aladin.co.kr/product/1354/64/cover/8958781432_1.jpg"
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
                  <p>자바의 정석</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>저자</p>
                </div>
                <div class="col-8">
                  <p>남궁성</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>출판사</p>
                </div>
                <div class="col-8">
                  <p>도우출판</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>출판일</p>
                </div>
                <div class="col-8">
                  <p>2021-12-01</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>페이지수</p>
                </div>
                <div class="col-8">
                  <p>123</p>
                </div>
              </div>
              <div class="row">
                <div class="col-4">
                  <p>ISBN</p>
                </div>
                <div class="col-8">
                  <p>123-456-789</p>
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
                    등록번호
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
                <tr
                  class="tac"
                  name="detailTd"
                  data-accessionno="012625"
                  data-materialstatus="1"
                  data-placeno="자료실"
                  data-callno="아동400 와68ㅇ v.9"
                  data-materialtype="대출가능"
                  data-returnplandt="
		        					 
					            		 
					            	
		        				"
                  data-volumnno=" v.9"
                  data-masterid="6297614"
                  data-accessionid="8222847"
                >
                  <td width="120" class="hidden-xs hidden-sm">012625&nbsp;</td>
                  <td width="120" class="tal">자료실&nbsp;</td>
                  <td width="*" class="tal">아동400 와68ㅇ v.9</td>

                  <td width="120" style="color: blue">대출가능</td>

                  <td width="120" class="hidden-xs">&nbsp;</td>
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
            <div class="col-11 summaryBody">
              생활 공간에서 찾아낸<br />엉뚱하지만 재미있고 흥미로운 이야기<br />과학이
              만만해지는 흥미 유발 과학서! <br /><br />같은 거울인데 왜 쇼핑몰
              거울은 더 날씬해 보일까? <br />지하에는 많던 건물 기둥이 1층에는
              왜 안 보일까? <br />쇼핑하고, 먹고, 노는 쇼핑몰에 쏙쏙 숨은 과학
              원리를 파헤치다!<br />오늘은 쇼핑몰에 가서 뭘 살까? 뭘 먹을까? 뭘
              볼까?……, ‘쇼핑몰’ 하면 누구나 이렇게 즐겁고 설레는 마음부터 들
              것이다. 오늘은 이 책의 주인공처럼 쇼핑몰의 또다른 매력에 빠져
              보자. 지하 주차장부터 꼭대기 카페까지 재미있고 신기한 과학
              투성이라, 궁금증과 호기심이 꼬리에 꼬리를 물게 될 것이다.<br />파토쌤과
              주인공은 옷을 사러 쇼핑몰에 갔다가 옷 매장 거울이 더 날씬해 보이는
              비밀을 알게 된다. 평면거울을 비롯해서 오목과 볼록 거울의 원리 및
              쓰임새까지 알게 되는 건 덤이다. ‘지하 주차장에는 기둥이 많았는데
              윗층으로 올라갈수록 기둥이 줄거나 아예 없다니!’ 그저 신기하기만 한
              나는 쇼핑몰 기둥을 중심으로 건축 공학 원리도 경험하게 된다. 이
              밖에도 주차할 공간을 찾다가 생활 편리를 돕는 각종 센서의 원리를,
              달콤한 냄새에 이끌려 도넛 가게를 찾다가 우리 뇌와 후각을 이용한
              향기 마케팅을, 엘리베이터가 추락하면 어떡하나 걱정하다가 자유
              낙하와 관성의 법칙을 경험하고 생활에서 요긴하게 활용하게 된다.
              <br /><br />과학, 배우지 말고 <br />경험하고 이해하면 내 것이
              된다!<br />《엉뚱하지만 과학입니다》에서 다루는 내용은 기발하고
              엉뚱해서 아이들의 호기심을 자아낸다. 그래서 아이 스스로 혼자서
              끝까지 읽어낼 수 있다. 읽는 데서 그치는 게 아니라 이해하고
              소화해서 주변과 세상을 이해하고 의문을 갖고 분석하고 해결하려는
              과학 하는 힘까지, 즉 과학문해력을 갖추게 된다. <br />다음의 세
              가지 전제에서 출발한 《엉뚱하지만 과학입니다》시리즈는 과학적
              사고력과 문제해결력은 물론 과학문해력까지 키울 수 있도록 구성했다.
              <br /><br />첫째, 과학은 가까이 있다!<br />과학은 어려운 책이나
              복잡한 실험실, 알 수 없는 기계 속에만 있는 게 아니다. 우리 가까이,
              어디에나 있다. 아침에 일어나 잠들 때가지 우리가 접하는 모든 것에
              과학의 원리가 숨어 있다. <br /><br />둘째, 과학은 엉뚱한 상상에서
              출발했다!<br />지금까지 과학의 원리라고 밝혀진 것들은 모두 나,
              주변, 세상을 이해해 보려는 호기심과 노력에서 출발했다. 작은
              호기심, 엉뚱한 상상, 이해해 보려는 노력에서 출발한 작은 시도들이
              모이고 쌓여 과학의 원리로 입증된 것이다. <br /><br />셋째, 과학은
              이해하면 쉬워지고 쉬워지면 좋아진다!<br />과학을 어려워하는
              아이들도 재미있고 친근한 생활 주변 주제로 접근하면 과학을 이해할
              수 있어 과학을 좋아하게 되고 사고력과 문제해결력을 키울 수 있을 뿐
              아니라 세상을 과학적으로 이해하는 과학문해력까지 갖추게 된다.
              <br /><br />작은 호기심, 엉뚱한 상상으로 <br />생활 곳곳에 숨은
              재미있는 과학 원리를 만나다!<br />《엉뚱하지만 과학입니다》 장소
              편 시리즈는 이야기와 정보가 결합된 형식으로 호기심 유발에서 궁금증
              해결, 또 다른 궁금증 발견이나 응용까지 과학적 사고력과 문제해결력,
              문해력을 키울 수 있도록 구성했다. 특히 우리 생활 곳곳에 숨은
              원리를 찾아 과학을 쉽고 재미있게 풀어내기 위해 초등학생들이 궁금해
              하는 편의점, 병원, 놀이터, 쇼핑몰, 우주 5곳을 배경으로 실었으며,
              각 권에는 교과와 연계되는 과학 원리 10개씩을 담았다. 6권 편의점
              과학 편 《캔 우유, 팩 콜라는 왜 없지?》, 7권 병원 과학 편 《나만
              몰랐던 코딱지의 정체》, 8권 놀이터 과학 편 《우주에서 그네를
              탄다면?》, 9권 《쇼핑몰 거울의 마법》에 이어서 10권 우주 과학을
              출간할 예정이다.
            </div>
          </div>
          <div class="row d-flex justify-content-center indexArea">
            <div class="col-11 index">
              <div class="ms-3">
                <span>목차</span>
              </div>
            </div>
            <div class="col-11 indexBody">
              01 초록색을 찾아라!<br />
              - 기계의 눈과 귀는 센서야! <br /><br />
              02 쇼핑몰 거울의 마법<br />
              - 날씬해 보이는 거울은 따로 있다!<br /><br />
              03 만약 엘리베이터가 추락한다면<br />
              - 엘리베이터에서 살아남기<br /><br />
              04 찾았다, 냄새의 주인공!<br />
              - 냄새로 기억한다!<br /><br />
              05 급해서 그랬어요!<br />
              - 뻥 뚫어 주는 과학<br /><br />06 소리에 색깔이 있다고?<br />
              - 소리가 없어야 공부가 잘될까?<br /><br />07 그 많던 기둥은 어디로
              갔을까?<br />
              - 기둥이 있어야 건물이 서지!<br /><br />08 에스컬레이터에서의
              아찔한 순간<br />
              - 안전하게 타려면 원리를 알아야지!<br /><br />09 여름을 가장
              시원하게 보내는 법<br />
              - 쇼핑몰이 더 시원한 이유<br /><br />10 이벤트는 계속될 걸?<br />
              - 종이비행기를 멀리 날리려면
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript"></script>
  </body>
</html>
