<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" type="image/x-icon" href="../img/sake-best-logo-zip-file/png/logo-icon.png">
<link rel="stylesheet" href="./../css/mypage_review_write.css">
<title>글쓰기</title>
</head>

<%
	String review_name = request.getParameter("review_name");
	String review_no = request.getParameter("review_no");
%>

<body>

	<form action="./mypage_review_write_pro.jsp" class="review-form">
	<input type="hidden" name = "review_name" value = "<%= review_name %>" >
	<input type="hidden" name = "review_no" value = "<%= review_no %>" >
        <h2>리뷰 작성</h2>
        <div class="form-group">
            <label for="name">제목</label>
            <input type="text" id="name" name="review_title" required>
        </div>
        <div class="form-group">
            <label for="rating">평점</label>
            <select id="rating" name="review_star" required>
                <option value="" disabled selected>평점을 선택하세요</option>
                <option value="5">★★★★★ (5점)</option>
                <option value="4">★★★★☆ (4점)</option>
                <option value="3">★★★☆☆ (3점)</option>
                <option value="2">★★☆☆☆ (2점)</option>
                <option value="1">★☆☆☆☆ (1점)</option>
            </select>
        </div>
        <div class="form-group">
            <label for="review">리뷰</label>
            <textarea id="review" name="review_content" required></textarea>
        </div>
        <div class="form-group">
            <button type="submit">제출</button>
        </div>
    </form>
</body>
</html>