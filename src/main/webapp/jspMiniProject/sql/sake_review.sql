DROP TABLE sake_review;

purge recyclebin;

CREATE TABLE sake_review (
    review_name VARCHAR(100), 		-- 사용자 이름
    review_no VARCHAR(100), 		-- 제품명
    review_star VARCHAR(100),		-- 별점
    review_date VARCHAR(100),		-- 날짜
    review_title VARCHAR(1000),		-- 제목
    review_content VARCHAR(1000),	-- 내용
    review_quantity VARCHAR(100),	-- 수량
    review_photo VARCHAR(500)		-- 사진
);