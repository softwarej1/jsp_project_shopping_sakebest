# jspProject - "Sake best" Shopping Mall
![image](https://github.com/softwarej1/jsp_project_shopping_sakebest/assets/105643491/a263876d-1088-4758-ad63-19b4ce047dc4)

## 프로젝트 소개
Sake best는 기존의 일본 술 판매 사이트들의 불편한 점, 구매하거나 불편한 UI로 사용자들이 사이트를 방문했을 때 이용에 어렵지 않는 방향으로 프로젝트를 제작하게 되었습니다.
 - 이전에 HTML 프로젝트에서 구현했던 기능을 JSP / SERVLET으로 옮겨 오라클 데이터베이스를 연동하였습니다. <br>
 - 상품 리뷰 쓰기, 리뷰 리스트, 장바구니, 상품 구매, 로그인, 회원가입, 이미지 슬라이드, 검색 기능 구현

## 화면 흐름도
![image](https://github.com/softwarej1/jsp_project_shopping_sakebest/assets/105643491/15e7b089-94c9-4edb-978a-7c6e85ef3395)

## 개발 환경
 - Front : HTML, CSS, JavaScript<br>
 - Back-end : Java, JSP, JDBC, Servlet<br>
 - 협업 툴 : Github, Notion<br>
 - 데이터베이스 : Oracle SQL<br>
 - 서버 : Apache Tomcat<br>
 - 디자인 : Kakao oven<br>
 - 개발 환경 : eclipse

## 쇼핑몰 시나리오
 - 시작 화면(index.jsp)<br><br>
   프로그램을 실행하는 화면 -> header.jsp와 main.jsp가 include되어 화면에 출력된다.<br>
   header.jsp : 헤더(네비게이션) 영역<br>
   main.jsp : 메인 화면

 - 헤더(네비게이션) 영역(header.jsp)
네비게이션 바 형식 사케, 맥주, 과실주, 소주가 있습니다. -> 각각의 네비게이션을 클릭하게 되면 해당하는 화면으로 이동한다. Ex ] 쥰마이 Click -> 이동
   - 헤더 리스트
   - 사케 : 쥰마이, 긴죠, 다이긴죠, 혼죠조
   - 과실주
   - 맥주 : 아사히, 산토리, 기린
   - 보리, 고구마/감자, 쌀, 아와모리
   
   - 기능
     - 로그인 : # 로그인 성공 : 로그인 화면 이동 icon 변경, 내 정보(mypage.jsp) 으로 이동 변경
                  # 로그인 X    : 로그인 defalt icon으로 변경, 로그인(login.jsp) 화면 이동 변경
     - 헤더 로고 : Click 시 index.jsp 시작 화면으로 이동
     - 검색 : 데이터베이스에 저장된 상품명에 따라 상품 리스트

- 메인 화면(main.jsp)
배너 화면과 각각의 대표하는 상품들을 볼 수 있는 화면
   - 상단 베너 화면
   - 상품 리스트(사케, 과실주, 소주, 맥주) : Click 시 상품 상세페이지로 이동

- 배너 화면(main_banner.jsp)
이미지 화면을 이동할 수 있는 기능 <, >으로 다른 화면으로 이동할 수 있다.
   - Click 시 : 상품 상세페이지로 이동
   - >, < 클릭 시 다음 페이지로 이동

- 로그인 화면(login.jsp)
데이터베이스에 저장된 회원 정보 -> 이메일과 비밀번호를 일치하게 되면 회원 가입 성공 후 메인창으로 이동
                                         -> 데이터베이스에 회원정보와 일치하지 않을 시 다시 로그인창 입력

- 회원가입 화면(register.jsp)
회원가입을 할 수 있는 화면, 가입하게 되면 sql의 유저정보 데이터베이스에 저장되게 된다. -> 조건에 맞게 입력하게 되면 데이터베이스에 저장 후 메인 화면으로 이동 
   - 이메일 : 조건 없음
   - 비밀번호 : 8글자 이상
   - 비밀번호 재입력 : 비밀번호와 일치 시 이상 없음
   - 이름 2글자 이상
   - 주소 6글자 이상
   - 생년월일 6글자 형식으로 입력
   - 휴대폰 번호 : 정규식 표현 패턴에 따라 입력할 수 있게 Ex ] 010 - 0000 - 0000 형식으로 입력

- 상품 리스트 화면(alchol_detail.jsp)
상품 리스트를 확인하고 리스트 상품을 클릭 시 상품 상세페이지로 이동할 수 있는 기능
   - 상품 Click 시 : 해당 상품의 상세페이지로 이동
   - 상품 리스트
   헤더에 있는 리스트와 동일
     - 사케 : 쥰마이, 긴죠, 다이긴죠, 혼죠조
     - 과실주
     - 맥주 : 아사히, 산토리, 기린
     - 보리, 고구마/감자, 쌀, 아와모리

- 상품 상세페이지 화면(alchol_detail_product.jsp)
상품 리스트 화면 또는 메인화면에서 상품을 클릭 시 나타날 화면
   - 장바구니 : # 로그인을 안했을 시 -> 로그인 페이지로 이동 
                  # 로그인 시 -> 로그인된 회원정보로 데이터베이스를 저장합니다.
                                  -> 클릭 시 장바구니 화면으로
   - 구매하기 : 해당 상품을 즉시 구매할 수 있는 기능
   - 찜 기능
     상세페이지에서 찜 기능을 클릭 시 찜한 상품 리스트를 유저의 데이터베이스에 저장하는 기능
   - 상품 리뷰 : 상품 구매 후 구매후기를 입력 시 출력 list

- 장바구니 화면(alchol_cart.jsp)
상세페이지에서 장바구니 기능과 찜 기능을 클릭 시 장바구니 화면에 표시할 상품 리스트
   - 체크박스 : 선택 시 상품 선택, 전체 선택 기능
   - 선택 상품 삭제 : 체크된 상품을 삭제 기능
   - 선택 상품 찜(선택 상품 장바구니) : 선택된 상품 찜을 보여줍니다. ※※※ 미구현
   - 주문하기 : 체크된 상품을 구매하는 창으로 이동
   - 쇼핑 계속하기 : Click 시 인덱스로 이동

   - 상품평(게시판) : 데이터베이스에서 상품평을 입력된 부분이 리스트 형식으로 나타나게 됩니다.

- 주문하기 화면
   - 구매 확정 : 상품 후기를 입력할 수 있는 화면 이동
       - 상품평 : 상품 확정 메시지를 입력 후 상품 상세페이지 리뷰에 띄울 수 있게 한다.
                  >> ☆☆☆☆☆ >> ★★★★★
                  >> 상품평( 상품 코드 포함 )

- Admin 주문 상품 입력 기능 ※※※ 미구현
Admin이 상품 등록할 수 있는 기능
   - 상품 등록
   - 상품 삭제
   - 상품 내용 변경 -> 임의로 있던 내용 Color 변경

 #
