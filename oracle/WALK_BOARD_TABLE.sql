-- MEMBER 테이블
CREATE TABLE MEMBER (
    M_CODE NUMBER,
    M_ID VARCHAR2(20) CONSTRAINT M_ID_NN NOT NULL,
    M_PWD VARCHAR2(150) CONSTRAINT M_PWD_NN NOT NULL,
    M_NAME VARCHAR2(100) CONSTRAINT M_NAME_NN NOT NULL,
    M_NICKNAME VARCHAR2(100) CONSTRAINT M_NICKNAME_NN NOT NULL,
    M_PHONE VARCHAR2(12) CONSTRAINT M_PHONE_NN NOT NULL,
    M_ADDRESS VARCHAR2(150) CONSTRAINT M_ADDRESS_NN NOT NULL,
    M_EMAIL VARCHAR2(150) CONSTRAINT M_EMAIL_NN NOT NULL,
    M_BIRTH DATE CONSTRAINT M_BIRTH_NN NOT NULL,
    M_SU_DATE DATE DEFAULT SYSDATE CONSTRAINT M_REG_DATE_NN NOT NULL,
    M_GENDER VARCHAR2(1) CONSTRAINT M_GENDER_NN NOT NULL CONSTRAINT M_GENDER_CK CHECK(M_GENDER IN ('M','F')),
    M_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT M_STATUS_NN NOT NULL CONSTRAINT M_STATUS_CK CHECK(M_STATUS IN ('Y','N')), 
    CONSTRAINT M_PK PRIMARY KEY (M_CODE),
    CONSTRAINT M_ID_UQ UNIQUE (M_ID),
    CONSTRAINT M_NICKNAME_UQ UNIQUE (M_NICKNAME),
    CONSTRAINT M_EMAIL_UQ UNIQUE (M_EMAIL)
);

COMMENT ON COLUMN MEMBER.M_CODE IS '회원코드'; 
COMMENT ON COLUMN MEMBER.M_ID IS '아이디'; 
COMMENT ON COLUMN MEMBER.M_PWD IS '비밀번호'; 
COMMENT ON COLUMN MEMBER.M_NAME IS '이름'; 
COMMENT ON COLUMN MEMBER.M_NICKNAME IS '닉네임'; 
COMMENT ON COLUMN MEMBER.M_PHONE IS '핸드폰번호'; 
COMMENT ON COLUMN MEMBER.M_BIRTH IS '생년월일'; 
COMMENT ON COLUMN MEMBER.M_ADDRESS IS '주소'; 
COMMENT ON COLUMN MEMBER.M_EMAIL IS '이메일'; 
COMMENT ON COLUMN MEMBER.M_SU_DATE IS '가입일'; 
COMMENT ON COLUMN MEMBER.M_GENDER IS '성별'; 
COMMENT ON COLUMN MEMBER.M_STATUS IS '회원상태';

CREATE SEQUENCE M_CODE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1 
MAXVALUE 99999999999999
NOCYCLE
NOCACHE;

-- DOG 테이블
CREATE TABLE DOG (
   D_ID VARCHAR2(50),
   D_ORI_IMG VARCHAR2(500),
   D_RE_IMG VARCHAR2(500),
   D_NUM NUMBER,
   D_NAME VARCHAR2(100) NOT NULL,
   D_KIND VARCHAR2(100) NOT NULL,
   D_SIZE VARCHAR2(10) NOT NULL,
   D_GENDER VARCHAR(10) NOT NULL,
   NEUTERED CHAR(1) NOT NULL,
   VACCINE VARCHAR2(1000) NOT NULL,
   M_CODE NUMBER NOT NULL,
   CONSTRAINT DOG_INFO_ID_PK PRIMARY KEY(D_ID),
   CONSTRAINT MEMBER_M_CODE_FK FOREIGN KEY (M_CODE) REFERENCES MEMBER
);

COMMENT ON COLUMN DOG.D_ID IS '아이디';
COMMENT ON COLUMN DOG.D_ORI_IMG IS '원래 사진 이름';
COMMENT ON COLUMN DOG.D_RE_IMG IS '새로운 사진 이름';
COMMENT ON COLUMN DOG.D_NUM IS '번호';
COMMENT ON COLUMN DOG.D_NAME IS '이름';
COMMENT ON COLUMN DOG.D_KIND IS '견종';
COMMENT ON COLUMN DOG.D_SIZE IS '크기';
COMMENT ON COLUMN DOG.D_GENDER IS '성별';
COMMENT ON COLUMN DOG.NEUTERED IS '중성화';
COMMENT ON COLUMN DOG.VACCINE IS '백신접종';

CREATE SEQUENCE D_ID;

-- WALKBOARD 테이블
CREATE TABLE WALKBOARD (
	WB_NO NUMBER NOT NULL,
	M_CODE NUMBER NOT NULL,
	D_ID VARCHAR2(50) NOT NULL,
	WB_TITLE VARCHAR2(40) NOT NULL,
	WB_CONTENT VARCHAR2(2000) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	WB_VIEWS NUMBER NOT NULL,
	WB_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
	ORIGINAL_FILENAME VARCHAR2(500) NULL,
	RENAMED_FILENAME VARCHAR2(500) NULL,
    CONSTRAINT WALKBOARD_WB_NO_PK PRIMARY KEY(WB_NO),
    CONSTRAINT WALKBOARD_M_CODE_FK FOREIGN KEY(M_CODE) REFERENCES MEMBER(M_CODE),
    CONSTRAINT WALKBOARD_D_ID_FK FOREIGN KEY(D_ID) REFERENCES DOG(D_ID),
    CONSTRAINT WALKBOARD_WB_STATUS_CK CHECK(WB_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN WALKBOARD.WB_NO IS '산책 게시글 번호';
COMMENT ON COLUMN WALKBOARD.M_CODE IS '회원코드';
COMMENT ON COLUMN WALKBOARD.D_ID IS '강아지 아이디';
COMMENT ON COLUMN WALKBOARD.WB_TITLE IS '제목';
COMMENT ON COLUMN WALKBOARD.WB_CONTENT IS '내용';
COMMENT ON COLUMN WALKBOARD.CREATE_DATE IS '등록날짜';
COMMENT ON COLUMN WALKBOARD.MODIFY_DATE IS '수정날짜';
COMMENT ON COLUMN WALKBOARD.WB_VIEWS IS '조회수';
COMMENT ON COLUMN WALKBOARD.WB_STATUS IS '상태값';
COMMENT ON COLUMN WALKBOARD.ORIGINAL_FILENAME IS '파일명';
COMMENT ON COLUMN WALKBOARD.RENAMED_FILENAME IS '재설정된 파일명';

CREATE SEQUENCE WB_NO_SEQ;

-- WALKREPLY 테이블
CREATE TABLE WALKREPLY (
	WR_NO NUMBER NOT NULL,
	WB_NO NUMBER NOT NULL,
	M_CODE NUMBER NOT NULL,
	WR_CONTENT VARCHAR2(1000) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	WR_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT WALKREPLY_WR_NO_PK PRIMARY KEY(WR_NO),
    CONSTRAINT WALKREPLY_WB_NO_FK FOREIGN KEY(WB_NO) REFERENCES WALKBOARD(WB_NO),
    CONSTRAINT WALKREPLY_M_CODE_FK FOREIGN KEY(M_CODE) REFERENCES MEMBER(M_CODE),
    CONSTRAINT WALKREPLY_WR_STATUS_CK CHECK(WR_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN WALKREPLY.WR_NO IS '산책 게시글 댓글 번호';
COMMENT ON COLUMN WALKREPLY.WB_NO IS '산책 게시글 번호';
COMMENT ON COLUMN WALKREPLY.M_CODE IS '회원코드';
COMMENT ON COLUMN WALKREPLY.WR_CONTENT IS '내용';
COMMENT ON COLUMN WALKREPLY.CREATE_DATE IS '등록날짜';
COMMENT ON COLUMN WALKREPLY.MODIFY_DATE IS '수정날짜';
COMMENT ON COLUMN WALKREPLY.WR_STATUS IS '상태값';

CREATE SEQUENCE WR_NO_SEQ;

COMMIT;