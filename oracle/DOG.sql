CREATE TABLE DOG_INFO (
	D_ID VARCHAR2(50),
	D_IMG	VARCHAR2(4000),
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

DROP TABLE DOG_INFO;

CREATE SEQUENCE DOG_ID;

DROP SEQUENCE DOG_ID;

INSERT INTO DOG_INFO (
    D_ID,
    D_IMG,
    D_NAME,
    D_KIND,
    D_SIZE,
    D_GENDER,
    NEUTERED,
    VACCINE,
    MEMBER_CODE
) VALUES(
    'DOG' || DOG_ID.NEXTVAL,
    'NULL',
    '보리',
    '미니어쳐 핀셔',
    '소형견',
    '암컷',
    'N',
    '접종안함',
    '1'
);

COMMIT;

CREATE TABLE MEMBER (
    MEM_CODE NUMBER,
    MEM_ID VARCHAR2(20) CONSTRAINT MEM_ID_NN NOT NULL,
    MEM_PWD VARCHAR2(20) CONSTRAINT MEM_PWD_NN NOT NULL,
    MEM_NAME VARCHAR2(100) CONSTRAINT MEM_NAME_NN NOT NULL,
    MEM_NICKNAME VARCHAR2(100) CONSTRAINT MEM_NICKNAME_NN NOT NULL,
    MEM_PHONE varchar2(12) CONSTRAINT MEM_PHONE_NN NOT NULL,
    MEM_ADDRESS VARCHAR2(150) CONSTRAINT MEM_ADDRESS_NN NOT NULL,
    MEM_EMAIL VARCHAR2(150) CONSTRAINT MEM_EMAIL_NN NOT NULL,
    MEM_BIRTH DATE CONSTRAINT MEM_BIRTH_NN NOT NULL,
    MEM_SU_DATE DATE  DEFAULT SYSDATE CONSTRAINT MEM_REG_DATE_NN NOT NULL,
    MEM_GENDER VARCHAR2(1) CONSTRAINT MEM_GENDER_NN NOT NULL CONSTRAINT MEM_GENDER_CK CHECK(MEM_GENDER IN ('M','F')),
    MEM_STATUS VARCHAR2(1) DEFAULT 'Y' CONSTRAINT MEM_STATUS_NN NOT NULL CONSTRAINT MEM_STATUS_CK CHECK(MEM_STATUS IN ('Y','N')), 
    CONSTRAINT "MEM_PK" PRIMARY KEY ("MEM_CODE"),
    CONSTRAINT "MEM_ID_UQ" UNIQUE ("MEM_ID"),
    CONSTRAINT "MEM_NICKNAME_UQ" UNIQUE ("MEM_NICKNAME"),
    CONSTRAINT "MEM_EMAIL_UQ" UNIQUE ("MEM_EMAIL")
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

CREATE SEQUENCE MEM_CODE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1 
MAXVALUE 99999999999999
NOCYCLE
NOCACHE;

DROP TABLE MEMBER;

UPDATE MEMBER SET MEM_NICKNAME='이나브로', MEM_PHONE='01012345678', MEM_ADDRESS='서울 송파구' WHERE MEM_CODE=2;

ROLLBACK;