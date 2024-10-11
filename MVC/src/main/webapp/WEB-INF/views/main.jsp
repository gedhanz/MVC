<%@page import="AcornStay.AcornStayAccommodationDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="AcornStay.AcornStayAccommodationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AcornStay | 로그인</title>
    <link rel="stylesheet" href="/MVC/resources/css/main.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" type="image/png">
</head>
<% String nickname = (String)session.getAttribute("nickname"); %>
<!-- 헤더 영역 -->
<header class="header">
  <div class="logo">
      <a href="/MVC/main">
          <img src="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" alt="Acorn Stay Logo">
          <span class="logo-text"><span style="color: #1a1d60d4;">Acorn</span>Stay</span>
      </a>
  </div>
  <nav class="nav">
  	  <%if(nickname != null) {%> <%=nickname %>님 환영합니다 <%} %>
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
<!-- 바디 영역 -->
<%
AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
ArrayList<AcornStayAccommodationDTO> list = dao.getAllAccommodations();
%>
<section class="css-13u51kw">
      <div class="css-1qumol3">
        <div class="css-1psit91">
          <div class="gc-dropdown css-1d6k3ca">
            <div role="presentation" class="css-1kpnpdw">
              <span class="css-h60ep5">추천순</span>
              <div class="css-1nq7xnt">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M5.406 8.016L10 13.02 14.608 8 16 9.402s-3.817 4.225-4.594 5.007a1.978 1.978 0 01-2.812 0L4 9.422l1.406-1.406z" fill="current"></path>
                </svg>
              </div>
            </div>
          </div>
        </div>
        <% for(AcornStayAccommodationDTO dto : list) { %>
        <a target="_blank" class="gc-thumbnail-type-seller-card css-wels0m" href="/MVC/detail?id=<%=dto.getId()%>">
          <div class="css-gvoll6">
            <div class="css-7xiv94">
              <div class="css-nl3cnv">
                <img alt="" sizes="100vw" src="<%=dto.getImage() %>" decoding="async" data-nimg="fill" class="thumbnail-image desktop:hover:bg-backgroundOverlayDarkInactive" loading="lazy" style="position: absolute; height: 100%; width: 100%; inset: 0px; color: transparent;">
              </div>
            </div>
            <div class="css-1by0ap6">
              <div class="css-b0qdn7">
                <div class="css-8fn780">
                  <h3 class="gc-thumbnail-type-seller-card-title css-1asqkxl"><%=dto.getName() %></h3>
                </div>
                <div class="css-19li9i9"><span class="css-ki0lqh"><%=dto.getRegion() %></span></div>
                <div class="css-1ar2n2o">
                  <div class="css-wtzmcu">
                    <svg width="12" height="12" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg" class="css-q6whag">
                      <path d="M14.229 12.1l.853 3.91c.06.502-.069.896-.386 1.18-.434.39-.958.352-1.294.21-.209-.114-1.343-.813-3.404-2.095-2.061 1.282-3.196 1.981-3.404 2.096-.336.14-.86.18-1.295-.211-.317-.284-.445-.678-.386-1.18l.853-3.91-.004-.003.001-.003c-1.817-1.651-2.806-2.56-2.965-2.724-.247-.267-.403-.786-.215-1.309.188-.523.671-.746.954-.78.19-.021 1.472-.146 3.848-.373H7.38c.965-2.358 1.49-3.621 1.576-3.791.128-.255.54-.617 1.042-.617s.864.332 1.018.573c.1.198.634 1.477 1.6 3.835 2.375.227 3.658.352 3.847.374.283.033.766.256.954.78.188.522.032 1.04-.215 1.308-.16.165-1.15 1.074-2.969 2.727l-.004.003z" fill="current"></path>
                    </svg>
                    <span class="css-9ml4lz"><%=dto.getRate() %></span>
                  </div>
                </div>
              </div>
              <div class="css-sg6wi7">
      			<div>
        			<div class="css-ukl1fa">
          				<div class="css-1dzt3ch">
            				<div class="css-xgwoxj"><%=dto.getPrice() %>원</div>
          				</div>
        			</div>
      			</div>
    		</div>
            </div>
          </div>
        </a>
        <%} %>
      </div>
    </section>
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