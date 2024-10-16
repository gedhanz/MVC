<%@page import="AcornStay.AcornStayAccommodationDTO"%>
<%@page import="AcornStay.AcornStayAccommodationDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AcornStay | 리뷰페이지</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" type="image/png">
    <link rel="stylesheet" href="/MVC/resources/css/review.css">
</head>
<% String nickname = (String)session.getAttribute("nickname"); %>
<body>
    <header class="header">
  <div class="logo">
      <a href="/MVC/main">
          <img src="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" alt="Acorn Stay Logo">
          <span class="logo-text"><span style="color: #1a1d60d4;">Acorn</span>Stay</span>
      </a>
  </div>
  <nav class="nav">
  	  <%if(nickname != null) {%> <a href="/MVC/mypage"><%=nickname %>님 환영합니다</a> <%} %>
  	  <% if(nickname == null){%>
	  <a href="/MVC/register" class="heart-link"><i class="fas fa-heart"></i></a>
      <% }%>
  	  
  	  <% if(nickname == null){%>
	  <a href="/MVC/login" class="login-button"><i class="fa-regular fa-user"></i>로그인</a>
      <% }else{ %>
      <a href="/MVC/logout" class="login-button"><i class="fa-solid fa-right-from-bracket"></i> 로그아웃</a>
      <% } %>
  </nav>
</header>
<%
int acc_id = (int)request.getAttribute("accId");
Date checkIn = (Date)request.getAttribute("checkIn");
Date checkOut = (Date)request.getAttribute("checkOut");
AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
AcornStayAccommodationDTO dto = dao.getAccommodation(acc_id);
%>
    <!-- 리뷰 작성 페이지 -->
    <form action="/MVC/reviewDB" method="post">
    <div class="review-container">
        <div class="hotel-info">
            <img src="<%=dto.getImage() %>" alt="" id="hotel-image">
            <div class="hotel-details">
                <p id="hotel-name">숙소명: <%=dto.getName() %></p>
                <p id="reservation-date">체크인: <%=checkIn %></p>
                <p id="reservation-date">체크아웃: <%=checkOut %></p>
                <input type="hidden" value="<%=acc_id%>" name="accId">
                <input type="hidden" value="<%=nickname%>" name="nickname">
            </div>
        </div>

        <div class="starpoint_wrap">
            <div class="score-display">
                평점<span id="current-score"></span> 
            </div>
            <div class="starpoint_box">
                <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5점</span></label>
                <label for="starpoint_2" class="label_star" title="1"><span class="blind">1점</span></label>
                <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5점</span></label>
                <label for="starpoint_4" class="label_star" title="2"><span class="blind">2점</span></label>
                <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5점</span></label>
                <label for="starpoint_6" class="label_star" title="3"><span class="blind">3점</span></label>
                <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5점</span></label>
                <label for="starpoint_8" class="label_star" title="4"><span class="blind">4점</span></label>
                <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5점</span></label>
                <label for="starpoint_10" class="label_star" title="5"><span class="blind">5점</span></label>
                <input type="radio" name="starpoint" id="starpoint_1" class="star_radio" value="0.5">
                <input type="radio" name="starpoint" id="starpoint_2" class="star_radio" value="1">
                <input type="radio" name="starpoint" id="starpoint_3" class="star_radio" value="1.5">
                <input type="radio" name="starpoint" id="starpoint_4" class="star_radio" value="2">
                <input type="radio" name="starpoint" id="starpoint_5" class="star_radio" value="2.5">
                <input type="radio" name="starpoint" id="starpoint_6" class="star_radio" value="3">
                <input type="radio" name="starpoint" id="starpoint_7" class="star_radio" value="3.5">
                <input type="radio" name="starpoint" id="starpoint_8" class="star_radio" value="4">
                <input type="radio" name="starpoint" id="starpoint_9" class="star_radio" value="4.5">
                <input type="radio" name="starpoint" id="starpoint_10" class="star_radio" value="5">
                <span class="starpoint_bg"></span>
            </div>
        </div>

        <div class="review-box">
            <textarea placeholder="리뷰를 작성해주세요..." id="review-text" name="text"></textarea>
        </div>

        <button class="submit-btn">리뷰 제출</button>
    </div>
    </form>

    <!-- 푸터 -->
    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h4>고객센터</h4>
                <p>고객행복센터(전화): 상담안해<br>
                    카카오톡 문의: 24시간 운영안함</p>
                <button class="contact-button">
                    <i class="fas fa-phone-alt"></i>
                    02-2231-6412
                </button>
                <button class="contact-button">
                    <i class="fas fa-comment"></i>
                    카카오 문의
                </button>
            </div>
            <div class="footer-section">
                <h4>회사</h4>
                <ul>
                    <li>회사소개</li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>서비스</h4>
                <ul>
                    <li>공지사항</li>
                    <li>자주 묻는 질문</li>
                    <li>기업 출장/복지 서비스 문의</li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>혜택</h4>
                <ul>
                    <li>엘리트 멤버십</li>
                    <li>트립홀릭 혜택 안내</li>
                    <li>에이콘스테이 상품권 조회</li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>모든 여행</h4>
                <ul>
                    <li>국내숙소</li>
                    <li>해외숙소</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>(주) 에이콘스테이<br>
                주소: 서울특별시 마포구 양화로 122 LAB7 빌딩 3층, 4층 | 대표이사:  | 사업자등록번호: 742-86-00224 사업자정보확인<br>
                전자우편주소: help@acornstay.com | 통신판매업신고증 : 제 2022-서울마포-1597호 | 사업자등록번호:101-86-89995 |  TEL: 02-2231-6412<br>
                호스팅서비스제공자의 상호 표시: (주) 에이콘스테이<br>
                (주)는 통신판매중개자의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 거래 당사자에게 있습니다.</p>
            <ul class="footer-links">
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">소비자 분쟁해결 기준</a></li>
                <li><a href="#">콘텐츠산업진흥법에 의한 표시</a></li>
            </ul>
            <p style="margin-top: 20px;"> COPYRIGHT(C) HBILAB. ALL RIGHTS RESERVED.</p>
        </div>
    </footer>

    <script>
        // 별점이 선택될 때 평점 업데이트
        document.querySelectorAll('.star_radio').forEach(function (radio, index) {
            radio.addEventListener('change', function () {
                const score = (index + 1) * 0.5;
                document.getElementById('current-score').textContent = score;
            });
        });
    </script>

</body>
</html>
