<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="AcornStay.AcornStayUserDAO"%>
<%@page import="AcornStay.AcornStayUserDTO"%>
<%@page import="AcornStay.AcornStayAccommodationImageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="AcornStay.AcornStayAccommodationDTO"%>
<%@page import="AcornStay.AcornStayAccommodationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/MVC/resources/css/rv.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg"
        type="image/png">
</head>

<% String nickname = (String)session.getAttribute("nickname"); 
AcornStayUserDAO dao1 = new AcornStayUserDAO();
AcornStayUserDTO dto1 = dao1.selectAll(nickname);
%>
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
<%
AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
AcornStayAccommodationDTO dto = (AcornStayAccommodationDTO)request.getAttribute("dto");
String region = (String)request.getAttribute("region");
java.sql.Date checkIn = (java.sql.Date)request.getAttribute("check_in");
java.sql.Date checkOut = (java.sql.Date)request.getAttribute("check_out");
int guest = (int)request.getAttribute("guest");

Calendar firstDateC = Calendar.getInstance();
firstDateC.setTimeInMillis(checkIn.getTime());
java.util.Date firstDateD = firstDateC.getTime();

Calendar lastDateC = Calendar.getInstance();
lastDateC.setTimeInMillis(checkOut.getTime());
java.util.Date lastDateD = lastDateC.getTime();
long diff = lastDateD.getTime() - firstDateD.getTime();
long since = TimeUnit.MILLISECONDS.toDays(diff);
%>
    <!-- 메인영역 -->
    <main>
        <section class="reserve_container">
            <div class="title_item">
                <h1 class="title_name" onclick="/MVC/detail?id=<%=dto.getId()%>'">
                    <i class="fa-solid fa-arrow-left"></i>
                    예약 확인 및 결제</h1>
            </div>
    		<form action="/MVC/rv" method="post">
            <div class="desktop">
    
                <div class="desktop_left">
                    <div class="reserve_top">
                        <div class="reserve_user_top">
                            예약자 정보
                        </div>
                        <div class="reserve_user_input">

                            <div class="labeled_input">
                                <div class="labeled_input_label">
                                    <label id="-label">예약자 이름</label>
                                </div>
                                <div class="labeled_input_input">
                                    <div class="labeled_input_wrapper">
                                        <div class="lableled_input_name">
                                            <input placeholder="<%=dto1.getName() %>" type="text" disabled>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="labeled_blank"></div>

                            <div class="labeled_input">
                                <div class="labeled_input_label">
                                    <label id="-label">휴대폰 번호</label>
                                </div>
                                <div class="labeled_input_input">
                                    <div class="labeled_input_wrapper">
                                        <div class="lableled_input_pw">
                                            <input placeholder="<%=dto1.getPhone() %>" type="text" disabled name="phone">
                                        </div>
                                    </div>
                                </div>
                                <div class="sub_text">
                                    <div class="guide">
                                        개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <hr>


                </div>
    
                <div class="desktop_right">
                    <div class="desktop_right_info">
                        <div class="product_wrap">
                            <div class="product_header">
                                <%=dto.getName() %>
                                <input type="hidden" name="id" value="<%= dto != null ? dto.getId() : "" %>">
                                <input type="hidden" name="name" value="<%=dto1.getUser_id() %>">
                                <input type="hidden" name="nickname" value="<%=nickname %>">
                                <input type="hidden" name="guest" value="<%=guest %>">
                            </div>
                            <div class="product_cover_img">
                                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW3ta4wRanvq9LGI9oG8nU9X3W_ldgQPlCVw&s">
                            </div>
                            <table>
                                <tbody>
                                    <tr>
                                        <td class="td_1">객실</td>
                                        <td class="td_2">Early 체크인 (숙박 2인 무료조식, 전 객실 OTT 서비스 지원, 호텔토랑 룸서비스)</td>
                                    </tr>
                                    <tr>
                                        <td class="td_1">일정</td>
                                        <td class="td_2"><%=checkIn %>~ 
                                            <%=checkOut %> (<%=since %>박)
                                            <input type="hidden" name="checkIn" value="<%=checkIn %>">
                                            <input type="hidden" name="checkOut" value="<%=checkOut %>">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="desktop_right_item">
                        <div class="price_payment_wrap">
                            <div class="price_section">
                                <div class="product_header">
                                    결제 정보
                                </div>
                                <ul class="price_section_discount">
                                    <li>
                                        <div>객실 가격(<%=since %>박)</div>
                                        <div><strong><%=String.format("%,d", dto.getPrice()) %></strong></div>
                                    </li>
                                </ul>
                                <hr>
                                <ul class="price_section_payment">
                                    <li>
                                        <div class="price_div_d1">총 결제 금액</div>
                                        <div class="price_div_d2"><p><%=String.format("%,d", dto.getPrice() * since)%>원</p><input type="hidden" name="price" value="<%=dto.getPrice() * since %>"></div>
                                    </li>
                                </ul>
                            </div>

                            <div class="payment_section">
                                
                                <button class="payment_btn" type="submit">
                                    <span class="anim"><%=String.format("%,d", dto.getPrice() * since)%>원 결제하기</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
    
            </div>
    		</form>
    
        </section>

    </main>


    <!-- 푸터 영역 -->
    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h4>고객센터</h4>
                <p>
                    고객행복센터(전화): 상담안해<br />
                    카카오톡 문의: 24시간 운영안함
                </p>
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
            <p>
                (주) 에이콘스테이<br />
                주소: 서울특별시 마포구 양화로 122 LAB7 빌딩 3층, 4층 | 대표이사: |
                사업자등록번호: 742-86-00224 사업자정보확인<br />
                전자우편주소: help@acornstay.com | 통신판매업신고증 : 제
                2022-서울마포-1597호 | 사업자등록번호:101-86-89995 | TEL:
                02-2231-6412<br />
                호스팅서비스제공자의 상호 표시: (주) 에이콘스테이<br />
                (주)는 통신판매중개자의 당사자가 아니며, 상품의 예약, 이용 및 환불
                등과 관련한 의무와 책임은 각 거래 당사자에게 있습니다.
            </p>
            <ul class="footer-links">
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">소비자 분쟁해결 기준</a></li>
                <li><a href="#">콘텐츠산업진흥법에 의한 표시</a></li>
            </ul>
            <p style="margin-top: 20px">
                COPYRIGHT(C) HBILAB. ALL RIGHTS RESERVED.
            </p>
        </div>
    </footer>
</body>

</html>


</body>

</html>