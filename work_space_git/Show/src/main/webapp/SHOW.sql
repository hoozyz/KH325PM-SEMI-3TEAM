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

DROP TABLE TBL_USER;
DROP TABLE TBL_HALL;
DROP TABLE TBL_REVIEW;
DROP TABLE TBL_SHOW;
DROP TABLE TBL_LIKE;
DROP TABLE TBL_TICKETING;
DROP TABLE TBL_NEWS;
DROP TABLE TBL_RANK;
DROP TABLE TBL_BOARD;
DROP TABLE TBL_GENRERANK;

INSERT INTO TBL_USER VALUES('ADMIN','1234','AA','AA','AA','AA',DEFAULT);

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

CREATE TABLE "TBL_USER" (
	"user_id"	VARCHAR2(1000)		NOT NULL,
	"pw"	        VARCHAR2(1000)		NOT NULL,
	"name"	VARCHAR2(1000)		NOT NULL,
	"phone"	VARCHAR2(1000)		NOT NULL,
	"email"	VARCHAR2(1000)		NOT NULL,
	"addr" 	VARCHAR2(4000)		NOT NULL,
	"role"	    VARCHAR2(100)	DEFAULT  'ROLE_USER' 	NOT NULL
);

CREATE TABLE "TBL_HALL" (
	"hall_id"	VARCHAR2(1000)		NOT NULL,
	"fcltynm"	VARCHAR2(1000)		NULL,
	"seatscale"	Number(10)		NULL,
	"telno"	VARCHAR2(1000)		NULL,
	"relateurl"	VARCHAR2(1000)		NULL,
	"adres"	VARCHAR2(1000)		NULL,
	"la"	VARCHAR2(1000)		NULL,
	"lo"	VARCHAR2(1000)		NULL
);

CREATE TABLE "TBL_REVIEW" (
	"rev_no"	NUMBER(10)		NOT NULL,
	"show_id"	VARCHAR2(100)		NOT NULL,
	"user_id"	VARCHAR2(100)		NOT NULL,
	"content"	VARCHAR(4000)		NULL,
	"rev_star"	VARCHAR2(100)	DEFAULT 0	NULL,
	"like"	NUMBER(10)	 DEFAULT 0	NULL,
	"review_date"	DATE	DEFAULT SYSDATE	NULL
);


CREATE TABLE "TBL_SHOW" (
	"show_id"	VARCHAR2(1000)		NOT NULL,
	"hall_id"	VARCHAR2(1000)		NOT NULL,
	"prfnm"	VARCHAR2(1000)		NULL,
	"prfpdfrom"	VARCHAR2(1000)		NULL,
	"prfpdto"	VARCHAR2(1000)		NULL,
	"genrenm"	VARCHAR2(1000)		NULL,
	"fcltynm"	VARCHAR2(1000)		NULL,
	"poster"	VARCHAR2(1000)		NULL,
	"prfcast"	VARCHAR2(1000)		NULL,
	"prfruntime"	VARCHAR2(1000)		NULL,
	"prfage"	VARCHAR2(1000)		NULL,
	"entrpsnm"	VARCHAR2(1000)		NULL,
	"pcseguidance"	VARCHAR2(1000)		NULL,
	"dtguidance"	VARCHAR2(1000)		NULL,
	"awards"	VARCHAR2(1000)		NULL,
    "show_star"	VARCHAR2(100) DEFAULT 0	 NULL
);

CREATE TABLE "TBL_LIKE" (
	"like_no"	NUMBER(10)		NOT NULL,
	"user_id"	VARCHAR2(100)		NOT NULL,
	"show_id"	VARCHAR2(100)		NOT NULL,
	"prfnm"	VARCHAR2(100)		NULL,
	"like_date"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "TBL_TICKETING" (
	"tic_no"	NUMBER(10)		NOT NULL,
	"show_id"	VARCHAR2(1000)		NOT NULL,
	"user_id"	VARCHAR2(1000)		NOT NULL,
	"prfnm"	VARCHAR2(1000)		NULL,
	"ticket_viewdate"	VARCHAR2(1000)		NULL,
	"ticket_date"	VARCHAR2(1000)		NULL,
	"fcltynm"	VARCHAR2(1000)		NULL,
	"count"	NUMBER(10)		NULL,
	"price"	NUMBER(10)		NULL
);

CREATE TABLE "TBL_NEWS" (
	"news_num"	NUMBER(10)		NOT NULL,
	"title"	 VARCHAR2(1000)		NULL,
    "cont"	VARCHAR2(4000)		NULL,
	"date"	VARCHAR2(1000)		NULL,
    "poster" VARCHAR2(1000) NULL
);

CREATE TABLE "TBL_RANK" (
	"show_id"	VARCHAR2(1000)		NOT NULL,
	"hall_id"	VARCHAR2(1000)		NOT NULL,
	"area"	VARCHAR2(1000)		NULL,
	"prfdtcnt"	VARCHAR2(1000)		NULL,
	"prfpd"	VARCHAR2(1000)		NULL,
	"cate"	VARCHAR2(1000)		NULL,
	"prfplcnm"	VARCHAR2(1000)		NULL,
	"prfnm"	VARCHAR2(1000)		NULL,
	"rnum"  NUMBER(10)		NULL,
	"seatcnt"	NUMBER(10)		NULL,
	"poster"	VARCHAR2(1000)		NULL,
	"date_range"	 VARCHAR2(100)		NULL,
    "date" VARCHAR2(100)  NULL
);

CREATE TABLE "TBL_BOARD" (
	"board_no"	NUMBER(10)		NOT NULL,
	"user_id"	VARCHAR2(100)		NOT NULL,
	"title"	VARCHAR2(1000)		NULL,
	"cont"	VARCHAR2(4000)		NULL,
	"readcount"	NUMBER(10)	 DEFAULT 0	NULL,
	"create_date"	 DATE	DEFAULT SYSDATE	NULL,
    "modify_date"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "TBL_GENRERANK" (
	"show_id" 	VARCHAR2(100)		NOT NULL,
	"hall_id"	VARCHAR2(100)		NOT NULL,
	"area"	VARCHAR2(1000)		NULL,
	"prfdtcnt"	VARCHAR2(1000)		NULL,
	"prfpd"	VARCHAR2(1000)		NULL,
	"cate"	VARCHAR2(1000)		NULL,
	"prfplcnm"	VARCHAR2(1000)		NULL,
	"prfnm"	VARCHAR2(1000)		NULL,
	"rnum"	NUMBER(10)		NULL,
	"seatcnt"	NUMBER(10)		NULL,
	"poster"	VARCHAR2(1000)		NULL,
	"date_range"	VARCHAR2(100)		NULL,
    "date" VARCHAR2(100)  NULL
);

ALTER TABLE "TBL_USER" ADD CONSTRAINT "PK_TBL_USER" PRIMARY KEY (
	"user_id"
);

ALTER TABLE "TBL_HALL" ADD CONSTRAINT "PK_TBL_HALL" PRIMARY KEY (
	"hall_id"
);

ALTER TABLE "TBL_REVIEW" ADD CONSTRAINT "PK_TBL_REVIEW" PRIMARY KEY (
	"rev_no"
);

ALTER TABLE "TBL_SHOW" ADD CONSTRAINT "PK_TBL_SHOW" PRIMARY KEY (
	"show_id"
);

ALTER TABLE "TBL_LIKE" ADD CONSTRAINT "PK_TBL_LIKE" PRIMARY KEY (
	"like_no"
);

ALTER TABLE "TBL_TICKETING" ADD CONSTRAINT "PK_TBL_TICKETING" PRIMARY KEY (
	"tic_no"
);

ALTER TABLE "TBL_NEWS" ADD CONSTRAINT "PK_TBL_NEWS" PRIMARY KEY (
	"news_num"
);

ALTER TABLE "TBL_BOARD" ADD CONSTRAINT "PK_TBL_BOARD" PRIMARY KEY (
	"board_no"
);

--------------------------------------  DML  -------------------------------------------------
-------------------------------- USER

-- ���� ��ȸ
-- SELECT * FROM TBL_USER WHERE "user_id"=?;

-- ���� ȸ������
-- INSERT INTO TBL_USER VALUES(?,?,?,?,?,?);

-- ���� ���� ����
-- UPDATE TBL_USER SET "name"=?, "phone"=?, "email"=?, "addr"=?, "role"=? WHERE "user_id"=?;
  
-- ���� ��й�ȣ ����
--UPDATE TBL_USER SET "pw"=? WHERE "user_id"=?;

-- ���� ���� 
--DELETE FROM TBL_USER WHERE "user_id"=?;


---------------------- HALL

-- Ȩ������ ������ 5�� ��ȸ -> ������ �� ���� 4�� �̻� -> ������ 5���� �������� �ٲ�
-- �������, ������, ������, �������۽ð�, �������ð� -> ������ �ȿ� �������� �������̸� ����id�� �ʿ�.
/* ������5�� , ���� ���� 4�� ����
SELECT "hall_id", "fcltynm", "prfnm", "poster", "prfpdfrom", "prfpdto"  FROM 
(SELECT "hall_id", "fcltynm", "prfnm", "poster", "prfpdfrom", "prfpdto", ROW_NUMBER() OVER 
(PARTITION BY "hall_id" ORDER BY DBMS_RANDOM.VALUE) AS RANK 
FROM TBL_SHOW WHERE "hall_id" IN
(SELECT "hall_id" FROM
(SELECT "hall_id", ROWNUM NUM FROM 
(SELECT  "hall_id"  FROM TBL_SHOW WHERE "hall_id" IN 
(SELECT "hall_id" FROM TBL_SHOW  
GROUP BY "hall_id" HAVING COUNT("show_id") >= 4) 
GROUP BY "hall_id" ORDER BY DBMS_RANDOM.VALUE))
WHERE NUM <= 5))
WHERE RANK <= 4;
*/

--------------- ������ �˻� ����Ʈ
-- ������ �˻� �� ������ ��� -> ���� ���� ��


-- ������ �˻�â �˻� -> ī�װ�, Ű����(�ּ�) -> �������, ��ȭ��ȣ, �ּ�, ����, �浵 
--SELECT * FROM TBL_HALL WHERE "fcltynm" LIKE ? AND "adres" LIKE ?; 



---------------- ������ �� ������
-- ������ ������ -> �� ��������. hall_id ���� �� �ʿ�
--SELECT * FROM TBL_HALL WHERE "hall_id" = ?;

-- �ֿ� ���� -> ���� 3��
/*
SELECT * FROM
(SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", "genrenm", ROWNUM NUM FROM 
(SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", "genrenm" FROM TBL_SHOW WHERE "hall_id" = ? ORDER BY DBMS_RANDOM.VALUE))
WHERE NUM <= 3; 

-- ��ü ���� -> �������۳��� �ֱ�
SELECT * FROM
(SELECT * FROM TBL_SHOW WHERE "hall_id" = ? ORDER BY "prfpdfrom" DESC);
*/


------------------ ���� 
-- ���� ���������� ��ü ���� -> �������� �ֽż�
-- ������, ������, �����Ⱓ, �������
/*
SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", "fcltynm" FROM TBL_SHOW WHERE "genrenm"='����' OR "genrenm"='������' 
OR "genrenm"='����' OR "genrenm"='����' ORDER BY "prfpdfrom" DESC;
*/

-- ���� ���������� �̴��� ���� -> �̻� ������ ������ 


-- ���� ���������� ���� ��ŷ -> ��ŷ�� 1���� ������ �� ���� 3��
/*
SELECT "poster", "prfnm", "prfpd", "prfplcnm" FROM
(SELECT DISTINCT "poster", "prfnm", "prfpd", "prfplcnm", ROWNUM NUM FROM
(SELECT "poster", "prfnm", "prfpd", "prfplcnm", "rnum", "date_range" FROM
(SELECT "poster", "prfnm", "prfpd", "prfplcnm", "rnum", "date_range" FROM TBL_GENRERANK 
WHERE "cate"='����' OR "cate"='������' OR "cate"='����' OR "cate"='����' )
WHERE "rnum" = 1 AND "date_range" = 'day'))
WHERE NUM <= 3;
*/

---- ���� ���������� -> ���� �˻� ������
-- ���� �˻�â -> Ű����, ī�װ�, �Ⱓ �ޱ�. -> �������� �Ⱓ ���̿� �ִ� ������
/*
SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", "fcltynm" FROM tbl_show WHERE "prfnm" LIKE ? AND "genrenm" = ? 
AND "prfpdfrom" BETWEEN TO_DATE('2022.06.22', 'YYYY.MM.DD') AND TO_DATE('2022.07.22', 'YYYY.MM.DD');
*/


-------------- ���� ������������ 
-- ������, �Ⱓ, �������, ��Ÿ��, ����, �⿬��, ���ۻ�, ����, ����
/*
SELECT "poster", "prfpdfrom", "prfpdto", "fcltynm", "prfruntime", "prfage", "prfcast", "entrpsnm", "pcseguidance", "show_star"
FROM TBL_SHOW WHERE "show_id"=?;
*/

-- �󼼺��� ���� -> �ֽż�, ���ƿ��
-- ������, ������, �ı⳻�� ���䰳�� ���ϱ�
-- �ֽż�
--SELECT * FROM TBL_REVIEW WHERE "show_id" = ? ORDER BY "review_date" DESC;
-- ���ƿ��
--SELECT * FROM TBL_REVIEW WHERE "show_id" = ? ORDER BY "like" DESC;


-- Ȩ������ ������ 5��
/*
SELECT "prfnm", "prfpdfrom", "prfpdto", "awards", "poster" FROM
(SELECT "prfnm", "prfpdfrom", "prfpdto", "awards", "poster", ROWNUM NUM FROM TBL_SHOW 
WHERE "awards" IS NOT NULL)
WHERE NUM <= 5;
*/


-- Ȩ������ �Ƶ����� 5�� -> ���� ��ġ�� ��Ҹ� �ٸ��� �ٽ� ���� ȣ�� -> �ڹٿ���
/*
SELECT "prfnm", "poster" FROM
(SELECT "prfnm", "poster", ROWNUM NUM FROM 
(SELECT "prfnm", "poster" FROM TBL_SHOW 
WHERE "prfage" LIKE '%����%' 
OR "prfage"LIKE '%��ü%'
ORDER BY DBMS_RANDOM.VALUE))
WHERE NUM <= 5;
*/


---------- ����  
-- ���� ���������� ��ü ���� -> �������� �ֽż�
/*
SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", "fcltynm" FROM TBL_SHOW WHERE "genrenm"='Ŭ����' OR "genrenm"='�����' 
OR "genrenm"='����' ORDER BY "prfpdfrom" DESC;
*/

-- ��õ�� 3�� -> �̹��� �̻۰� 


-- ���� �ӹ� ���� -> ������, ������, �����Ⱓ
-- �ֱ� ���� ���� 
-- ������, ������, �����Ⱓ, ������� - 5�� 7�� ����
/*
(SELECT "poster", "prfnm", "prfpdfrom", "prfpdto" FROM
(SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", ROWNUM NUM FROM tbl_show WHERE "prfpdfrom" = ?)
WHERE NUM <= 5); 
*/


-- ���� ���������� -> ���� �˻������� 
-- ���� ���������� �˻�â
-- ������ ���� Ŭ�� -> ������� ������ GET���
/*
SELECT "poster", "prfnm", "prfpdfrom", "prfpdto", "fcltynm" FROM tbl_show WHERE "prfnm" LIKE ? AND "genrenm" = ? 
AND "prfpdfrom" BETWEEN TO_DATE('2022.06.22', 'YYYY.MM.DD') AND TO_DATE('2022.07.22', 'YYYY.MM.DD');
*/


------------------------------- REVIEW 

-- �ı� �ۼ� -> �ı�� ���� 1 ~ 5
--INSERT INTO TBL_REVIEW VALUES(SEQ_REV_NO.nextval,?,?,?,?,?,?);

-- ������ �ı� ����� ���� ������ ����
--SELECT AVG("rev_star") FROM TBL_REVIEW GROUP BY "show_id" HAVING "show_id" = ?;

-- �ı� ���ƿ� -> ���ƿ� ���� �� ���� ���� -> ���̵𸶴� �ı�� ���ƿ� �� �� ���� -> ���ƿ� ��� ������ ȸ��
-- like = like++;
--UPDATE TBL_REVIEW SET "like"=? WHERE "rev_no"=?; 

-- Ȩ������ �ı� ���� ���� 3�� -> ���ƿ� 1�� ���� -> ����
-- REV_STAR ��� => ���� ����
-- �����ȣ, ������, ������, �������۳�, ��������, �ı�1��(���ƿ� 1��), ���ƿ� ����
/*
SELECT R."content", R."like", S."poster", S."prfnm", S."prfpdfrom", S."prfpdto" FROM 
(SELECT "show_id", "like", "content" FROM
(SELECT "show_id", "like", "content", ROW_NUMBER() OVER (PARTITION BY "show_id" ORDER BY "like" DESC) AS RANK FROM
TBL_REVIEW WHERE "show_id" IN
(SELECT "show_id" FROM
(SELECT "show_id", ROWNUM NUM1 FROM
(SELECT "show_id" FROM 
(SELECT "show_id", ROUND(AVG("rev_star"),1) AVERAGE FROM TBL_REVIEW GROUP BY "show_id")
ORDER BY AVERAGE DESC))
WHERE NUM1 <= 3))
WHERE RANK = 1) R
JOIN tbl_show S ON (R."show_id" = S."show_id");
*/


----------------------------------- NEWS

-- �ҽ� �ۼ�
--INSERT INTO TBL_NEWS VALUES(SEQ_NEWS_NUM.nextval,?,?,SYSDATE);

-- �ҽ� ����
--UPDATE TBL_NEWS SET "title" = ? , "cont" = ?, "date" = SYSDATE WHERE "news_num" = ?;

-- �ҽ� ����
--DELETE FROM TBL_NEWS WHERE "news_num" = ?;

-- Ȩ������ �ҽ� 5����
/*
SELECT "title", "cont", "poster", "date" FROM tbl_news WHERE "news_num" IN
(SELECT "news_num" FROM 
(SELECT "news_num", ROWNUM NUM FROM
(SELECT "news_num" FROM TBL_NEWS ORDER BY "date" DESC))
WHERE NUM <= 5);
*/

------------------- �ҽİԽ���
-- �ҽ� ���� �ֽ� 3��
--SELECT * FROM TBL_NEWS ORDER BY "date" DESC;

-- �ҽ� �ֽ� 3�� ���� �ֽż� ��ü �ҽ�
/*
SELECT * FROM
(SELECT "news_num", "title", "cont", "date", "poster", ROWNUM NUM FROM
(SELECT * FROM TBL_NEWS ORDER BY "date" DESC))
WHERE NUM > 3;
*/



---------------------------------- RANK -> date�� ���� ��¥

-- Ȩ������ ��ŷ �ϰ�, �ְ�, ���� 10���� -> ��ü �帣
/*
-- �ϰ�
SELECT * FROM tbl_rank WHERE "date_range" = 'day' AND "date" = ?;

-- �ְ�
SELECT * FROM tbl_rank WHERE "date_range" = 'week' AND "date" = ?;

-- ����
SELECT * FROM tbl_rank WHERE "date_range" = 'month' AND "date" = ?;
*/

---------------- ��ŷ �Խ��� �帣�� ž10 

/*
-- ������(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum", "date" FROM TBL_GENRERANK 
WHERE "cate"='������' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ������(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='������' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ������(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='������' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- Ŭ����(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='Ŭ����' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- Ŭ����(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='Ŭ����' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- Ŭ����(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='Ŭ����' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- �����(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='�����' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- �����(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='�����' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- �����(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='�����' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ϰ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='day' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(�ְ�)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='week' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;

-- ����(����)
SELECT * FROM 
(SELECT "poster", "prfnm", "prfplcnm", "prfpd", "rnum" FROM TBL_GENRERANK 
WHERE "cate"='����' AND "date_range"='month' ORDER BY "rnum") 
WHERE "date" = ? AND ROWNUM BETWEEN 1 AND 10;
*/



----------------------------- �����Խ��� 
-- �� �Խñ� ����
--SELECT COUNT(*) FROM TBL_BOARD;

-- ��ȸ�� ����
--UPDATE TBL_BOARD SET "readcount" = ? WHERE "board_no" = ?;

-- �Խñ� �ۼ�
--INSERT INTO TBL_BOARD VALUES(SEQ_BOARD_NO.nextval,?,?,?,?,SYSDATE,SYSDATE);

-- �Խñ� ����
--UPDATE TBL_BOARD SET "title" = ?, "cont" = ?, "modify_date" = SYSDATE WHERE "board_no" = ?;

-- �Խñ� ����
--DELETE FROM TBL_BOARD WHERE "board_no" = ?;

-- �Խñ� �� ��ȸ
--SELECT * FROM TBL_BOARD WHERE "board_no" = ?;

-- �Խñ� ��� ��ȸ -> �ֱ� �Խñ� �������� 10����
/*
SELECT * FROM 
(SELECT ROWNUM NUM, "board_no", "user_id", "title", "cont", "readcount" FROM 
(SELECT * FROM TBL_BOARD ORDER BY "board_no" DESC))
WHERE NUM BETWEEN 1 AND 10;
*/

-- �Խñ� �˻�
/*
SELECT *  FROM
(SELECT ROWNUM NUM, "board_no", "user_id", "title", "cont", "readcount" FROM
(SELECT * FROM TBL_BOARD 
WHERE 1 = 1
AND "user_id" LIKE ?
AND "title" LIKE ?
AND "cont" LIKE ?))
WHERE NUM BETWEEN 1 AND 10;
*/

-- �˻� ��� ����
/*
SELECT COUNT(*) FROM TBL_BOARD 
WHERE 1 = 1
AND "user_id" LIKE ?
AND "title" LIKE ?
AND "cont" LIKE ?;
*/


----------------- ����������
-- ����, ���� �������� -> ����, �ð�, ���� �Ľ� 
--SELECT "dtguidance", "pcseguidance" FROM TBL_SHOW WHERE "show_id" = ?;

-- ���� ���� ���� ���̺� �ֱ�
--INSERT INTO TBL_TICKETING VALUES(SEQ_TIC_NO.nextval, ?, ?, ?, ?, SYSDATE, ?, ?, ?);

------------------ ���ſϷ� ������
--SELECT * FROM tbl_ticketing WHERE "tic_no" = ?;


---------------- ȸ������
--INSERT INTO TBL_USER VALUES(?, ?, ?, ?, ?, ?, DEFAULT);

------------ �α���
--SELECT * FROM TBL_USER WHERE "user_id" = ?;


---------------- ����������
-- ������ 
--SELECT * FROM TBL_USER WHERE "user_id" = ?;

-- ���ϱ�
--INSERT INTO TBL_LIKE VALUES(SEQ_LIKE_NO.nextval, ?, ?, ?, SYSDATE);

-- ����
--SELECT * FROM TBL_LIKE WHERE "user_id" = ?;

-- ���� �ۼ��� ����
--SELECT * FROM TBL_REVIEW WHERE "user_id" = ?;

-- ���� ���
--SELECT * FROM TBL_TICKETING WHERE "user_id" = ?;