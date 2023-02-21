-- MEMBER 테이블
CREATE TABLE MEMBER (
    MEM_CODE NUMBER,
    MEM_ID VARCHAR2(20) CONSTRAINT MEM_ID_NN NOT NULL,
    MEM_PWD VARCHAR2(20) CONSTRAINT MEM_PWD_NN NOT NULL,
    MEM_NAME VARCHAR2(100) CONSTRAINT MEM_NAME_NN NOT NULL,
    MEM_NICKNAME VARCHAR2(100) CONSTRAINT MEM_NICKNAME_NN NOT NULL,
    MEM_PHONE varchar2(12) CONSTRAINT MEM_PHONE_NN NOT NULL,
    MEM_ADDRESS VARCHAR2(150) CONSTRAINT MEM_ADDRESS_NN NOT NULL,
    MEM_EMAIL VARCHAR2(20) CONSTRAINT MEM_EMAIL_NN NOT NULL,
    MEM_BIRTH DATE CONSTRAINT MEM_BIRTH_NN NOT NULL,
    MEM_SU_DATE DATE  DEFAULT SYSDATE CONSTRAINT MEM_REG_DATE_NN NOT NULL,
    MEM_GENDER VARCHAR2(1) CONSTRAINT MEM_GENDER_NN NOT NULL CONSTRAINT MEM_GENDER_CK CHECK(MEM_GENDER IN ('M','F')),
    MEM_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT MEM_STATUS_NN NOT NULL CONSTRAINT MEM_STATUS_CK CHECK(MEM_STATUS IN ('Y','N')), 
    CONSTRAINT MEM_PK PRIMARY KEY (MEM_CODE),
    CONSTRAINT MEM_ID_UQ UNIQUE (MEM_ID),
    CONSTRAINT MEM_NICKNAME_UQ UNIQUE (MEM_NICKNAME),
    CONSTRAINT MEM_EMAIL_UQ UNIQUE (MEM_EMAIL)
);

COMMENT ON COLUMN MEMBER.MEM_CODE IS '회원코드'; 
COMMENT ON COLUMN MEMBER.MEM_ID IS '아이디'; 
COMMENT ON COLUMN MEMBER.MEM_PWD IS '비밀번호'; 
COMMENT ON COLUMN MEMBER.MEM_NAME IS '이름'; 
COMMENT ON COLUMN MEMBER.MEM_NICKNAME IS '닉네임'; 
COMMENT ON COLUMN MEMBER.MEM_PHONE IS '핸드폰번호'; 
COMMENT ON COLUMN MEMBER.MEM_BIRTH IS '생년월일'; 
COMMENT ON COLUMN MEMBER.MEM_ADDRESS IS '주소'; 
COMMENT ON COLUMN MEMBER.MEM_EMAIL IS '이메일'; 
COMMENT ON COLUMN MEMBER.MEM_SU_DATE IS '가입일'; 
COMMENT ON COLUMN MEMBER.MEM_GENDER IS '성별'; 
COMMENT ON COLUMN MEMBER.MEM_STATUS IS '회원상태';

-- MYPAGE 테이블 (임의로 생성)
CREATE TABLE MYPAGE (
	MEM_CODE NUMBER NOT NULL,
	DEL_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
	INTRO VARCHAR2(1000) NULL,
    CONSTRAINT MYPAGE_MEM_CODE_FK FOREIGN KEY(MEM_CODE) REFERENCES MEMBER(MEM_CODE),
    CONSTRAINT DEL_STATUS_CK CHECK(DEL_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN MYPAGE.MEM_CODE IS '회원코드';
COMMENT ON COLUMN MYPAGE.DEL_STATUS IS '탈퇴여부';
COMMENT ON COLUMN MYPAGE.INTRO IS '자기소개';

-- DOG_INFO 테이블
CREATE TABLE DOG_INFO (
	D_ID VARCHAR2(50),
	D_IMG VARCHAR2(4000),
	D_NAME VARCHAR2(100) NOT NULL,
	D_KIND VARCHAR2(100) NOT NULL,
	D_SIZE VARCHAR2(10) NOT NULL,
	D_GENDER VARCHAR(10) NOT NULL,
	NEUTERED CHAR(1) NOT NULL,
	VACCINE	VARCHAR2(1000) NOT NULL,
	MEM_CODE NUMBER NOT NULL,
    CONSTRAINT DOG_INFO_ID_PK PRIMARY KEY(D_ID),
    CONSTRAINT MEMBER_MEM_CODE_FK FOREIGN KEY (MEM_CODE) REFERENCES MEMBER
);

COMMENT ON COLUMN DOG_INFO.D_ID IS '아이디';
COMMENT ON COLUMN DOG_INFO.D_IMG IS '사진';
COMMENT ON COLUMN DOG_INFO.D_NAME IS '이름';
COMMENT ON COLUMN DOG_INFO.D_KIND IS '견종';
COMMENT ON COLUMN DOG_INFO.D_SIZE IS '크기';
COMMENT ON COLUMN DOG_INFO.D_GENDER IS '성별';
COMMENT ON COLUMN DOG_INFO.NEUTERED IS '중성화';
COMMENT ON COLUMN DOG_INFO.VACCINE IS '백신접종';
COMMENT ON COLUMN DOG_INFO.MEM_CODE IS '회원코드';

-- WALK_BOARD 테이블
CREATE TABLE WALK_BOARD (
	WB_NO NUMBER NOT NULL,
	MEM_CODE NUMBER NOT NULL,
	D_ID VARCHAR2(50) NOT NULL,
	WB_TITLE VARCHAR2(40) NOT NULL,
	WB_CONTENT VARCHAR2(2000) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	WB_VIEWS NUMBER NOT NULL,
	WB_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT WALK_BOARD_WB_NO_PK PRIMARY KEY(WB_NO),
    CONSTRAINT WALK_BOARD_MEM_CODE_FK FOREIGN KEY(MEM_CODE) REFERENCES MEMBER(MEM_CODE),
    CONSTRAINT WALK_BOARD_D_ID_FK FOREIGN KEY(D_ID) REFERENCES DOG_INFO(D_ID),
    CONSTRAINT WB_STATUS_CK CHECK(WB_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN WALK_BOARD.WB_NO IS '산책 게시글 번호';
COMMENT ON COLUMN WALK_BOARD.MEM_CODE IS '회원코드';
COMMENT ON COLUMN WALK_BOARD.D_ID IS '강아지 아이디';
COMMENT ON COLUMN WALK_BOARD.WB_TITLE IS '제목';
COMMENT ON COLUMN WALK_BOARD.WB_CONTENT IS '내용';
COMMENT ON COLUMN WALK_BOARD.CREATE_DATE IS '작성날짜';
COMMENT ON COLUMN WALK_BOARD.MODIFY_DATE IS '수정날짜';
COMMENT ON COLUMN WALK_BOARD.WB_VIEWS IS '조회수';
COMMENT ON COLUMN WALK_BOARD.WB_STATUS IS '상태값';

--WALK_COMMENT 테이블
CREATE TABLE WALK_COMMENT (
	WC_NO NUMBER NOT NULL,
	WB_NO NUMBER NOT NULL,
	WC_NICKNAME VARCHAR2(20) NOT NULL,
	WB_COMMENT VARCHAR2(1000) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE NOT NULL,
	MODIFY_DATE DATE DEFAULT SYSDATE NOT NULL,
	WC_STATUS CHAR(1) DEFAULT 'Y' NOT NULL,
    CONSTRAINT WALK_COMMENT_WC_NO PRIMARY KEY(WC_NO),
    CONSTRAINT WALK_COMMENT_WB_NO_FK FOREIGN KEY(WB_NO) REFERENCES WALK_BOARD(WB_NO),
    CONSTRAINT WALK_STATUS_CK CHECK(WC_STATUS IN ('Y', 'N'))
);

COMMENT ON COLUMN WALK_COMMENT.WC_NO IS '산책 게시글 댓글 번호';
COMMENT ON COLUMN WALK_COMMENT.WB_NO IS '산책 게시글 번호';
COMMENT ON COLUMN WALK_COMMENT.WC_NICKNAME IS '작성자 닉네임';
COMMENT ON COLUMN WALK_COMMENT.WB_COMMENT IS '내용';
COMMENT ON COLUMN WALK_COMMENT.CREATE_DATE IS '작성날짜';
COMMENT ON COLUMN WALK_COMMENT.MODIFY_DATE IS '수정날짜';
COMMENT ON COLUMN WALK_COMMENT.WC_STATUS IS '상태값';

COMMIT;