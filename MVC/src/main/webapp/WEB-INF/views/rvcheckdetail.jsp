<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AcornStay | 예약 상세내역</title>
    <link rel="stylesheet" href="/MVC/resources/css/rvcheckdetail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" type="image/png">
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
      <a href="/MVC/logout" class="mypage-button"><i class="fa-regular fa-user"></i> 로그아웃</a>
      <% } %>
  </nav>
</header>

<section class="mypage-section">
    <div class="mypage-container">
        <div class="sidebar">
            <ul>
                <li><a href="/MVC/mypage"class="active">내 정보</a></li>
                <li><a href="/MVC/rvcheck">예약 내역</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="content-header">
                <h1>예약 상세내역</h1>
            </div>
            <div class="reservation-history">
                <p>고객님이 예약하신 숙소 정보입니다.</p>
                <div class="reservation-list">
                    <div class="reservation-item">
                        <div class="reservation-info">
                            <p>숙소 이름:   에이콘스테이 강남점</p>
                            <p>예약자 이름: 김세현</p>
                            <p>예약번호:    NP3K67</p>
                            <p>체크인:      2024년 10월 15일</p>
                            <p>체크아웃:    2024년 10월 17일</p>
                            <p>숙소위치:    어쩌구저쩌구</p>
                            <p>가격:        ~~원</p>
                        </div>
                        <div class="reservation-imgbox"><img class="reservation-img" src="data:image/jpeg;base64,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" alt="예약숙소 대표이미지"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>

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

</body>
</html>
