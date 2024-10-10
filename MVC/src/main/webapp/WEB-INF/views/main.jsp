<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AcornStay | 로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" type="image/png">
</head>
<% String nickname = (String)session.getAttribute("nickname"); %>
<!-- 헤더 영역 -->
<header class="header">
  <div class="logo">
      <a href="/">
          <img src="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" alt="Acorn Stay Logo">
          <span class="logo-text"><span style="color: #1a1d60d4;">Acorn</span>Stay</span>
      </a>
  </div>
  <nav class="nav">
  	  <%if(nickname != null) {%> <%=nickname %>님 환영합니다 <%} %>
      <a href="#" class="heart-link"><i class="fas fa-heart"></i></a>
      <a href="/MVC/login" class="login-button"><i class="fa-regular fa-user"></i>로그인</a>
  </nav>
</header>
<!-- 바디 영역 -->

<!-- 푸터 영역 -->
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
</html>