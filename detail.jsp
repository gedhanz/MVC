<%@page import="java.sql.Date"%>
<%@page import="AcornStay.AcornStayAccommodationImageDTO"%>
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
    <title>Document</title>
    <link rel="stylesheet" href="/MVC/resources/css/detail.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" href="https://i.pinimg.com/280x280_RS/12/5c/15/125c15498a72c53a784b7476ce8c5a22.jpg" type="image/png">
</head>
<body>
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
AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
AcornStayAccommodationDTO dto = (AcornStayAccommodationDTO)request.getAttribute("dto");
ArrayList<AcornStayAccommodationImageDTO> list = dao.getImages(dto.getId());
String region = (String)request.getAttribute("region");
Date checkIn = (Date)request.getAttribute("check_in");
Date checkOut = (Date)request.getAttribute("check_out");
int guest = (int)request.getAttribute("guest");
%>
    <main>
      <section aria-label="숙소 상세 정보" class="h_info">

        <!-- 이미지 영역 -->
        <div class="pic_container">
          <ul class="img_ul">
            <li>
              <div class="h_info_pic_main">
                <img src="<%=list.get(0).getImage_path() %>" />
              </div>

              <div class="h_info_pic_f">
                <div class="h_info_pic_line">
                  <div class="h_info_pic">
                    <img src="<%=list.get(1).getImage_path() %>" />
                  </div>
                  <div class="h_info_pic2">
                    <img src="<%=list.get(2).getImage_path() %>" />
                  </div>
                </div>

                <div class="h_info_pic_line">
                  <div class="h_info_pic">
                    <img src="<%=list.get(3).getImage_path() %>" />
                  </div>
                  <div class="h_info_pic3">
                    <img src="<%=list.get(4).getImage_path() %>" />
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>

        <!-- 이름,가격 영역 -->
         <div class="name_price">
            <div class="name_container">
                <div class="name_t">
                    <%=dto.getRegion() %>
                </div>
                <div class="name_n">
                    <h1><%=dto.getName() %></h1>
                </div>

            </div>


            <div class="price_container">
                <span class="price"><%=String.format("%,d", dto.getPrice()) %></span>
                <span class="won">원~</span>
            </div>
         </div>


                      <!-- 수정 내용 가시성 -->
                      <!-- 기타정보 영역 -->
                      <div class="info_box_container">
                        <div class="info_box">
                          <div class="info_count_top">
                            인원 인원수 최대인원
                          </div>

                          <div class="info_count_bot">
                            <%=dto.getMax_occupancy() %>
                          </div>
                        </div>


                        <div class="info_box">
                          <div class="info_address_top">
                            주소 위치 지역
                          </div>
                          <div class="info_address_bot">
                            <%=dto.getDetail_location() %>
                          </div>
                        </div>

                        <!-- 수정 useredit-button-box , useredit-button -->
                        <div class="useredit-button-box">
                          <button class="useredit-button"
                            onclick="location.href='/MVC/rv?id=<%=dto.getId()%>&region=<%= region %>&check_in=<%= checkIn %>&check_out=<%= checkOut %>&guest=<%= guest %>'">숙박
                            예약</button>
                        </div>
                      </div>
     			 </section>

        <!-- 리뷰 영역 -->
        <section aria-label="리뷰" id="review">
          <div class="review_container">
            <div class="review_box">
              <div class="review_rating">
                <div class="review_star">
                  <img
                    src="https://e7.pngegg.com/pngimages/914/747/png-clipart-star-star.png"
                  />
                </div>
                <h2 class="review_r">
                  리뷰 점수 <%=dto.getRate() %>
                </h2>
              </div>

              <span class="review_count"> 
                10,536명 평가 ・ 10,536개 리뷰 
              </span>
            </div>

            <div class="review_array">
              추천순
            </div>
          </div>

          <hr />

          <!-- 리뷰 내용 -->
          <div class="review_bottom_container">
            <div class="review_bottom_box">
              <div class="review_in_box">
                <div class="reviewer_info">
                  <div class="review_cus_img"></div>
                  <div class="review_cus_info_box">
                    <p class="review_nickname">
                      사용자 닉네임
                    </p>
                  </div>
                </div>

                <div class="review_textbox">
                  <div class="review_star_rate">
                    <span>별점: 5점</span>
                  </div>
                  <div class="review_cus_review">
                    <p>
                      집에서 도보로 30분 거리에 있는 호텔반월~
호텔반월은 구월아시아드에 있습니다
인천종합버스터미널과 인천1호선 인천터미널역에서 도보로 20분 택시로는 기본 요금 밖에 안나온답니다
이틀전에 숙박 했던 구월호텔과 나란히 붙어 있습니다

숙박한 기간은 휴가철이였지만 평일에 숙박을 하다보니 객실 가격이 저렴 하였습니다
스탠다드 객실에 숙박을 하였고 체크인 14시 체크아웃 14시로 24시간을 숙박 할 수 있어서 에어컨이 빵빵하게 돌아가는 객실에서 너무나도 편하게 쉴 수 있어서 너무 좋았습니다

14시에 바로 체크인을 했는데 숙박 손님인지 대실 손님인지 체크인을 하려는 손님들이 많았습니다

객실엔 바디프랜드 안마의자가 있어서 안마를 여러번 할 수 있어서 좋았고 냉장고엔 생수 3병 음료 3캔이 있었고 침대 베드가 커서 좋았지만 매트리스에 비닐 시트가 있어서 불편 했습니다

다음날 7~9시까지 무료 조식을 주는데 바로 옆 호텔인 구월호텔에서 먹을 수 있었고 구월호텔의 무료 조식은 지금까지 이용한 모텔의 무료 조식 중 최고였습니다
가짓수도 많고 쌀국수가 너무 맛있었습니다

그리고 호텔 2층에 가면 스낵바가 있는데 사발면과 과자 팝콘을 먹을 수가 있고 생수와 음료도 있답니다
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        </section>
    </main>

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
         
</body>
</html>