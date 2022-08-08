SELECT * FROM tbl_user;
SELECT * FROM tbl_hall;
SELECT * FROM tbl_review;
SELECT * FROM tbl_show;
SELECT * FROM tbl_like;
SELECT * FROM tbl_ticketing;
SELECT * FROM tbl_news;
SELECT * FROM tbl_rank;
SELECT * FROM tbl_board;
SELECT * FROM tbl_genrerank;

DROP TABLE TBL_USER CASCADE CONSTRAINTS;
DROP TABLE TBL_HALL CASCADE CONSTRAINTS;
DROP TABLE TBL_REVIEW CASCADE CONSTRAINTS;
DROP TABLE TBL_SHOW CASCADE CONSTRAINTS;
DROP TABLE TBL_LIKE CASCADE CONSTRAINTS;
DROP TABLE TBL_TICKETING CASCADE CONSTRAINTS;
DROP TABLE TBL_NEWS CASCADE CONSTRAINTS;
DROP TABLE TBL_RANK CASCADE CONSTRAINTS;
DROP TABLE TBL_BOARD CASCADE CONSTRAINTS;
DROP TABLE TBL_GENRERANK CASCADE CONSTRAINTS;

INSERT INTO TBL_USER VALUES('admin','1234','AA','AA','AA','AA','ROLL_ADMIN');

-- 리뷰 테스트
INSERT INTO TBL_REVIEW VALUES(SEQ_REV_NO.nextval, 'ID1','test1','좋아요1','공연명1', '2022.07.01','2022.07.25','4.0',55,SYSDATE);
INSERT INTO TBL_REVIEW VALUES(SEQ_REV_NO.nextval, 'ID2','test1','좋아요2','공연명2', '2022.07.11','2022.08.25','3.0',35,SYSDATE);

-- 찜 테스트
INSERT INTO TBL_LIKE VALUES(SEQ_LIKE_NO.nextval, 'test1','ID1','공연명1', '포스터1','공연장명1',SYSDATE);
INSERT INTO TBL_LIKE VALUES(SEQ_LIKE_NO.nextval, 'test1','ID2','공연명2', '포스터2','공연장명2',SYSDATE);

-- 예매 테스트
INSERT INTO TBL_TICKETING VALUES(SEQ_TIC_NO.nextval, 'ID1','test1','공연명1','2022.08.01', '2022.07.01','공연장명1', 3,50000, '15:30');
INSERT INTO TBL_TICKETING VALUES(SEQ_TIC_NO.nextval, 'ID2','test1','공연명2','2022.09.01', '2022.08.01','공연장명2', 5,80000, '17:00');
commit;

DROP SEQUENCE SEQ_REV_NO;
DROP SEQUENCE SEQ_LIKE_NO;
DROP SEQUENCE SEQ_NEWS_NUM;
DROP SEQUENCE SEQ_BOARD_NO;
DROP SEQUENCE SEQ_TIC_NO;

CREATE SEQUENCE SEQ_REV_NO;
CREATE SEQUENCE SEQ_LIKE_NO;
CREATE SEQUENCE SEQ_NEWS_NUM;
CREATE SEQUENCE SEQ_BOARD_NO;
CREATE SEQUENCE SEQ_TIC_NO;

CREATE TABLE TBL_USER (
	user_id	VARCHAR2(1000)		NOT NULL,
	pw	        VARCHAR2(1000)		NOT NULL,
	name    	VARCHAR2(1000)		NOT NULL,
	phone   	VARCHAR2(1000)		NOT NULL,
	email	    VARCHAR2(1000)		NOT NULL,
	addr    	VARCHAR2(4000)		NOT NULL,
	role	    VARCHAR2(100)	DEFAULT  'ROLE_USER' 	NOT NULL
);

CREATE TABLE TBL_HALL (
	hall_id	VARCHAR2(1000)		NOT NULL,
	fcltynm	VARCHAR2(1000)		NULL,
	seatscale	Number(10)		NULL,
	telno	VARCHAR2(1000)		NULL,
	relateurl	VARCHAR2(1000)		NULL,
	adres	VARCHAR2(1000)		NULL,
	la	VARCHAR2(1000)		NULL,
	lo	VARCHAR2(1000)		NULL
);

CREATE TABLE TBL_REVIEW (
	rev_no	NUMBER(10)		NOT NULL,
	show_id	VARCHAR2(100)		NOT NULL,
    	user_id	VARCHAR2(100)		NOT NULL,
	rev_content	VARCHAR(4000)		NULL,
	prfnm	VARCHAR2(100)		NULL,
	prfpdfrom	VARCHAR2(100)		NULL,
	prfpdto	VARCHAR2(100)		NULL,
	rev_star	NUMBER(10)	DEFAULT 1	NULL,
	rev_like	NUMBER(10)	 DEFAULT 0	NULL,
	rev_date	DATE	DEFAULT SYSDATE	NULL
);


CREATE TABLE TBL_SHOW (
	show_id	VARCHAR2(1000)		NOT NULL,
	hall_id	VARCHAR2(1000)		NOT NULL,
	prfnm	VARCHAR2(1000)		NULL,
	prfpdfrom	VARCHAR2(1000)		NULL,
	prfpdto	VARCHAR2(1000)		NULL,
	genrenm	VARCHAR2(1000)		NULL,
	fcltynm	VARCHAR2(1000)		NULL,
	poster	VARCHAR2(1000)		NULL,
	prfcast	VARCHAR2(1000)		NULL,
	prfruntime	VARCHAR2(1000)		NULL,
	prfage	VARCHAR2(1000)		NULL,
	entrpsnm	VARCHAR2(1000)		NULL,
	pcseguidance	VARCHAR2(1000)		NULL,
	dtguidance	VARCHAR2(1000)		NULL,
	awards	VARCHAR2(1000)		NULL,
    	show_star	VARCHAR2(100) DEFAULT 0	 NULL
);

CREATE TABLE TBL_LIKE (
	like_no	NUMBER(10)		NOT NULL,
	user_id	VARCHAR2(100)		NOT NULL,
	show_id	VARCHAR2(100)		NOT NULL,
	prfnm	VARCHAR2(100)		NULL,
    	poster VARCHAR2(1000) NULL,
    	fcltynm VARCHAR2(1000)		NULL,
	like_date	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE TBL_TICKETING (
	tic_no	NUMBER(10)		NOT NULL,
	show_id	VARCHAR2(1000)		NOT NULL,
	user_id	VARCHAR2(1000)		NOT NULL,
	prfnm	VARCHAR2(1000)		NULL,
	ticket_viewdate	VARCHAR2(1000)		NULL,
	ticket_date	VARCHAR2(1000)		NULL,
	fcltynm	VARCHAR2(1000)		NULL,
	ticket_count	NUMBER(10)		NULL,
	price	NUMBER(10)		NULL,
	view_time VARCHAR2(100) NULL
);

CREATE TABLE TBL_NEWS (
	news_num	NUMBER(10)		NOT NULL,
	title	 VARCHAR2(1000)		NULL,
    	cont	VARCHAR2(4000)		NULL,
	news_date	VARCHAR2(1000)		NULL,
    	poster VARCHAR2(1000) NULL
);

CREATE TABLE TBL_RANK (
	show_id	VARCHAR2(1000)		NOT NULL,
	hall_id	VARCHAR2(1000)		NOT NULL,
	area	VARCHAR2(1000)		NULL,
	prfdtcnt	VARCHAR2(1000)		NULL,
	prfpd	VARCHAR2(1000)		NULL,
	cate	VARCHAR2(1000)		NULL,
	prfplcnm	VARCHAR2(1000)		NULL,
	prfnm	VARCHAR2(1000)		NULL,
	rnum  NUMBER(10)		NULL,
	seatcnt	NUMBER(10)		NULL,
	poster	VARCHAR2(1000)		NULL,
	date_range	 VARCHAR2(100)		NULL,
    rank_date VARCHAR2(100)  NULL
);

CREATE TABLE TBL_BOARD (
	board_no	NUMBER(10)		NOT NULL,
	user_id	VARCHAR2(100)		NOT NULL,
	name VARCHAR2(100) NULL,
    	title	VARCHAR2(1000)		NULL,
	cont	VARCHAR2(4000)		NULL,
	readcount	NUMBER(10)	 DEFAULT 0	NULL,
	create_date	 DATE	DEFAULT SYSDATE	NULL,
    	modify_date	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE TBL_GENRERANK (
	show_id 	VARCHAR2(100)		NOT NULL,
	hall_id	VARCHAR2(100)		NOT NULL,
	area	VARCHAR2(1000)		NULL,
	prfdtcnt	VARCHAR2(1000)		NULL,
	prfpd	VARCHAR2(1000)		NULL,
	cate	VARCHAR2(1000)		NULL,
	prfplcnm	VARCHAR2(1000)		NULL,
	prfnm	VARCHAR2(1000)		NULL,
	rnum	NUMBER(10)		NULL,
	seatcnt	NUMBER(10)		NULL,
	poster	VARCHAR2(1000)		NULL,
	date_range	VARCHAR2(100)		NULL,
    	genrerank_date VARCHAR2(100)  NULL
);

ALTER TABLE TBL_USER ADD CONSTRAINT PK_TBL_USER PRIMARY KEY (
	user_id
);

ALTER TABLE TBL_HALL ADD CONSTRAINT PK_TBL_HALL PRIMARY KEY (
	hall_id
);

ALTER TABLE TBL_REVIEW ADD CONSTRAINT PK_TBL_REVIEW PRIMARY KEY (
	rev_no
);

ALTER TABLE TBL_SHOW ADD CONSTRAINT PK_TBL_SHOW PRIMARY KEY (
	show_id
);

ALTER TABLE TBL_LIKE ADD CONSTRAINT PK_TBL_LIKE PRIMARY KEY (
	like_no
);

ALTER TABLE TBL_TICKETING ADD CONSTRAINT PK_TBL_TICKETING PRIMARY KEY (
	tic_no
);

ALTER TABLE TBL_NEWS ADD CONSTRAINT PK_TBL_NEWS PRIMARY KEY (
	news_num
);

ALTER TABLE TBL_BOARD ADD CONSTRAINT PK_TBL_BOARD PRIMARY KEY (
	board_no
);

--------------------------------------  DML  -------------------------------------------------
-------------------------------- USER

-- 유저 조회
-- SELECT * FROM TBL_USER WHERE user_id=?;

-- 유저 회원가입
-- INSERT INTO TBL_USER VALUES(?,?,?,?,?,?);

-- 유저 정보 변경
-- UPDATE TBL_USER SET name=?, phone=?, email=?, addr=?, role=? WHERE user_id=?;
  
-- 유저 비밀번호 변경
--UPDATE TBL_USER SET pw=? WHERE user_id=?;

-- 유저 삭제 
--DELETE FROM TBL_USER WHERE user_id=?;


---------------------- HALL

-- 홈페이지 공연장 5개 조회 -> 공연장 내 공연 4개 이상 -> 공연장 5개씩 랜덤으로 바뀜
-- 공연장명, 포스터, 공연명, 공연시작시간, 공연끝시간 -> 공연장 안에 공연장이 여러개이면 공연id가 필요.
/* 공연장5개 , 내부 공연 4개 랜덤
SELECT hall_id, fcltynm, prfnm, poster, prfpdfrom, prfpdto  FROM 
(SELECT hall_id, fcltynm, prfnm, poster, prfpdfrom, prfpdto, ROW_NUMBER() OVER 
(PARTITION BY hall_id ORDER BY DBMS_RANDOM.VALUE) AS RANK 
FROM TBL_SHOW WHERE hall_id IN
(SELECT hall_id FROM
(SELECT hall_id, ROWNUM NUM FROM 
(SELECT  hall_id  FROM TBL_SHOW WHERE hall_id IN 
(SELECT hall_id FROM TBL_SHOW  
GROUP BY hall_id HAVING COUNT(show_id) >= 4) 
GROUP BY hall_id ORDER BY DBMS_RANDOM.VALUE))
WHERE NUM <= 5))
WHERE RANK <= 4;
*/

--------------- 공연장 검색 사이트
-- 공연장 검색 전 공연장 목록 -> 공연 많은 수


-- 공연장 검색창 검색 -> 카테고리, 키워드(주소) -> 공연장명, 전화번호, 주소, 위도, 경도 
--SELECT * FROM TBL_HALL WHERE fcltynm LIKE ? AND adres LIKE ?; 



---------------- 공연장 상세 페이지
-- 공연장 상세정보 -> 다 가져오기. hall_id 빼고 다 필요
--SELECT * FROM TBL_HALL WHERE hall_id = ?;

-- 주요 공연 -> 랜덤 3개
/*
SELECT * FROM
(SELECT poster, prfnm, prfpdfrom, prfpdto, genrenm, ROWNUM NUM FROM 
(SELECT poster, prfnm, prfpdfrom, prfpdto, genrenm FROM TBL_SHOW WHERE hall_id = ? ORDER BY DBMS_RANDOM.VALUE))
WHERE NUM <= 3; 

-- 전체 공연 -> 공연시작날이 최근
SELECT * FROM
(SELECT * FROM TBL_SHOW WHERE hall_id = ? ORDER BY prfpdfrom DESC);
*/


------------------ 공연 
-- 공연 메인페이지 전체 공연 -> 시작일이 최신순
-- 포스터, 공연명, 공연기간, 공연장명
/*
SELECT poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM TBL_SHOW WHERE genrenm='연극' OR genrenm='뮤지컬' 
OR genrenm='무용' OR genrenm='복합' ORDER BY prfpdfrom DESC;
*/

-- 공연 메인페이지 이달의 공연 -> 이쁜 가로형 포스터 


-- 공연 메인페이지 공연 랭킹 -> 랭킹이 1위인 공연들 중 랜덤 3개
/*
SELECT poster, prfnm, prfpd, prfplcnm FROM
(SELECT DISTINCT poster, prfnm, prfpd, prfplcnm, ROWNUM NUM FROM
(SELECT poster, prfnm, prfpd, prfplcnm, rnum, date_range FROM
(SELECT poster, prfnm, prfpd, prfplcnm, rnum, date_range FROM TBL_GENRERANK 
WHERE cate='연극' OR cate='뮤지컬' OR cate='무용' OR cate='복합' )
WHERE rnum = 1 AND date_range = 'day'))
WHERE NUM <= 3;
*/

---- 공연 메인페이지 -> 공연 검색 페이지
-- 공연 검색창 -> 키워드, 카테고리, 기간 받기. -> 시작일이 기간 사이에 있는 공연들
/*
SELECT poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM tbl_show WHERE prfnm LIKE ? AND genrenm = ? 
AND prfpdfrom BETWEEN TO_DATE('2022.06.22', 'YYYY.MM.DD') AND TO_DATE('2022.07.22', 'YYYY.MM.DD');
*/


-------------- 공연 상세정보페이지 
-- 포스터, 기간, 공연장명, 런타임, 연령, 출연진, 제작사, 가격, 별점
/*
SELECT poster, prfpdfrom, prfpdto, fcltynm, prfruntime, prfage, prfcast, entrpsnm, pcseguidance, show_star
FROM TBL_SHOW WHERE show_id=?;
*/

-- 상세보기 리뷰 -> 최신순, 좋아요순
-- 포스터, 공연명, 후기내용 리뷰개수 정하기
-- 최신순
--SELECT * FROM TBL_REVIEW WHERE show_id = ? ORDER BY review_date DESC;
-- 좋아요순
--SELECT * FROM TBL_REVIEW WHERE show_id = ? ORDER BY like DESC;


-- 홈페이지 수상작 5개
/*
SELECT prfnm, prfpdfrom, prfpdto, awards, poster FROM
(SELECT prfnm, prfpdfrom, prfpdto, awards, poster, ROWNUM NUM FROM TBL_SHOW 
WHERE awards IS NOT NULL)
WHERE NUM <= 5;
*/


-- 홈페이지 아동공연 5개 -> 제목 겹치고 장소만 다르면 다시 쿼리 호출 -> 자바에서
/*
SELECT prfnm, poster FROM
(SELECT prfnm, poster, ROWNUM NUM FROM 
(SELECT prfnm, poster FROM TBL_SHOW 
WHERE prfage LIKE '%개월%' 
OR prfageLIKE '%전체%'
ORDER BY DBMS_RANDOM.VALUE))
WHERE NUM <= 5;
*/


---------- 음악  
-- 음악 메인페이지 전체 음악 -> 시작일이 최신순
/*
SELECT poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM TBL_SHOW WHERE genrenm='클래식' OR genrenm='오페라' 
OR genrenm='국악' ORDER BY prfpdfrom DESC;
*/

-- 추천작 3개 -> 이미지 이쁜거 


-- 오픈 임박 공연 -> 포스터, 공연명, 공연기간
-- 최근 오픈 공연 
-- 포스터, 공연명, 공연기간, 공연장명 - 5개 7개 정도
/*
(SELECT poster, prfnm, prfpdfrom, prfpdto FROM
(SELECT poster, prfnm, prfpdfrom, prfpdto, ROWNUM NUM FROM tbl_show WHERE prfpdfrom = ?)
WHERE NUM <= 5); 
*/


-- 음악 메인페이지 -> 음악 검색페이지 
-- 음악 메인페이지 검색창
-- 공연장 정보 클릭 -> 공연장명 가지고 GET방식
/*
SELECT poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM tbl_show WHERE prfnm LIKE ? AND genrenm = ? 
AND prfpdfrom BETWEEN TO_DATE('2022.06.22', 'YYYY.MM.DD') AND TO_DATE('2022.07.22', 'YYYY.MM.DD');
*/


------------------------------- REVIEW 

-- 후기 작성 -> 후기당 별점 1 ~ 5
--INSERT INTO TBL_REVIEW VALUES(SEQ_REV_NO.nextval,?,?,?,?,?,?);

-- 공연당 후기 평균을 공연 별점에 넣음
--SELECT AVG(rev_star) FROM TBL_REVIEW GROUP BY show_id HAVING show_id = ?;

-- 후기 좋아요 -> 좋아요 개수 한 개씩 증가 -> 아이디마다 후기당 좋아요 한 개 가능 -> 좋아요 취소 유무는 회의
-- like = like++;
--UPDATE TBL_REVIEW SET rev_like=? WHERE rev_no=?; 

-- 홈페이지 후기 별점 상위 3개 -> 좋아요 1위 리뷰 -> 조인
-- REV_STAR 평균 => 공연 평점
-- 리뷰번호, 포스터, 공연명, 공연시작날, 공연끝날, 후기1개(좋아요 1위), 좋아요 개수
/*
SELECT R.rev_content, R.rev_like, S.poster, S.prfnm, S.prfpdfrom, S.prfpdto FROM 
(SELECT show_id, rev_like, rev_content FROM
(SELECT show_id, rev_like, rev_content, ROW_NUMBER() OVER (PARTITION BY show_id ORDER BY rev_like	 DESC) AS RANK FROM
TBL_REVIEW WHERE show_id IN
(SELECT show_id FROM
(SELECT show_id, ROWNUM NUM1 FROM
(SELECT show_id FROM 
(SELECT show_id, ROUND(AVG(rev_star),1) AVERAGE FROM TBL_REVIEW GROUP BY show_id)
ORDER BY AVERAGE DESC))
WHERE NUM1 <= 3))
WHERE RANK = 1) R
JOIN tbl_show S ON (R.show_id = S.show_id);
*/


----------------------------------- NEWS

-- 소식 작성
--INSERT INTO TBL_NEWS VALUES(SEQ_NEWS_NUM.nextval,?,?,SYSDATE);

-- 소식 수정
--UPDATE TBL_NEWS SET title = ? , cont = ?, news_date = SYSDATE WHERE news_num = ?;

-- 소식 삭제
--DELETE FROM TBL_NEWS WHERE news_num = ?;

-- 홈페이지 소식 5가지
/*
SELECT title, cont, poster, news_date FROM tbl_news WHERE news_num IN
(SELECT news_num FROM 
(SELECT news_num, ROWNUM NUM FROM
(SELECT news_num FROM TBL_NEWS ORDER BY news_date DESC))
WHERE NUM <= 5);
*/

------------------- 소식게시판
-- 소식 위에 최신 3개
--SELECT * FROM TBL_NEWS ORDER BY news_date DESC;

-- 소식 최신 3개 말고 최신순 전체 소식
/*
SELECT * FROM
(SELECT news_num, title, cont, news_date, poster, ROWNUM NUM FROM
(SELECT * FROM TBL_NEWS ORDER BY date DESC))
WHERE NUM > 3;
*/



---------------------------------- RANK -> date가 기준 날짜

-- 홈페이지 랭킹 일간, 주간, 월간 10개씩 -> 전체 장르
/*
-- 일간
SELECT * FROM tbl_rank WHERE date_range = 'day' AND date = ?;

-- 주간
SELECT * FROM tbl_rank WHERE date_range = 'week' AND date = ?;

-- 월간
SELECT * FROM tbl_rank WHERE date_range = 'month' AND date = ?;
*/

---------------- 랭킹 게시판 장르별 탑10 

/*
-- 뮤지컬(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum, date FROM TBL_GENRERANK 
WHERE cate='뮤지컬' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 뮤지컬(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='뮤지컬' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 뮤지컬(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='뮤지컬' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 연극(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='연극' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 연극(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='연극' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 연극(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='연극' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 무용(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='무용' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 무용(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='무용' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 무용(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='무용' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 클래식(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='클래식' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 클래식(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='클래식' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 클래식(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='클래식' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 오페라(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='오페라' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 오페라(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='오페라' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 오페라(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='오페라' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 국악(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='국악' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 국악(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='국악' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 국악(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='국악' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 복합(일간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='복합' AND date_range='day' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 복합(주간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='복합' AND date_range='week' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;

-- 복합(월간)
SELECT * FROM 
(SELECT poster, prfnm, prfplcnm, prfpd, rnum FROM TBL_GENRERANK 
WHERE cate='복합' AND date_range='month' ORDER BY rnum) 
WHERE date = ? AND ROWNUM BETWEEN 1 AND 10;
*/



----------------------------- 자유게시판 
-- 총 게시글 개수
--SELECT COUNT(*) FROM TBL_BOARD;

-- 조회수 증가
--UPDATE TBL_BOARD SET readcount = ? WHERE board_no = ?;

-- 게시글 작성
--INSERT INTO TBL_BOARD VALUES(SEQ_BOARD_NO.nextval,?,?,?,?,SYSDATE,SYSDATE);

-- 게시글 수정
--UPDATE TBL_BOARD SET title = ?, cont = ?, modify_date = SYSDATE WHERE board_no = ?;

-- 게시글 삭제
--DELETE FROM TBL_BOARD WHERE board_no = ?;

-- 게시글 상세 조회
--SELECT * FROM TBL_BOARD WHERE board_no = ?;

-- 게시글 목록 조회 -> 최근 게시글 페이지당 10개씩
/*
SELECT * FROM 
(SELECT ROWNUM NUM, board_no, user_id, title, cont, readcount FROM 
(SELECT * FROM TBL_BOARD ORDER BY board_no DESC))
WHERE NUM BETWEEN 1 AND 10;
*/

----------------- 예매페이지
-- 가격, 요일 가져오기 -> 요일, 시간, 가격 파싱 
--SELECT dtguidance, pcseguidance FROM TBL_SHOW WHERE show_id = ?;

-- 예매 정보 예매 테이블 넣기
--INSERT INTO TBL_TICKETING VALUES(SEQ_TIC_NO.nextval, ?, ?, ?, ?, SYSDATE, ?, ?, ?);

------------------ 예매완료 페이지
--SELECT * FROM tbl_ticketing WHERE tic_no = ?;


---------------- 회원가입
--INSERT INTO TBL_USER VALUES(?, ?, ?, ?, ?, ?, DEFAULT);

------------ 로그인
--SELECT * FROM TBL_USER WHERE user_id = ?;


---------------- 마이페이지
-- 내정보 
--SELECT * FROM TBL_USER WHERE user_id = ?;

-- 찜하기
--INSERT INTO TBL_LIKE VALUES(SEQ_LIKE_NO.nextval, ?, ?, ?, ?, ?, SYSDATE);

-- 찜목록
--SELECT * FROM TBL_LIKE WHERE user_id = ?;

-- 내가 작성한 리뷰
--SELECT * FROM TBL_REVIEW WHERE user_id = ?;

-- 예매 목록
--SELECT * FROM TBL_TICKETING WHERE user_id = ?;