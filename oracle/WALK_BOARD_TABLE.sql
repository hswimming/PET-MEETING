-- 임의로 생성
CREATE TABLE "MEMBER_INFO" (
	"MEMBER_CODE" VARCHAR2(20) NOT NULL,
	"MEMBER_ID" VARCHAR2(20) NOT NULL,
	"MEMBER_PWD" VARCHAR2(40) NOT NULL,
	"MEMBER_NAME" VARCHAR2(10) NOT NULL,
	"MEMBER_NICKNAME" VARCHAR2(10) NOT NULL,
	"MEMBER_ADDRESS" VARCHAR2(50) NOT NULL,
	"MEMBER_PHONE" NUMBER NOT NULL,
	"MEMBER_EMAIL" VARCHAR2(20) NOT NULL,
	"MEMBER_BIRTH" DATE NOT NULL,
	"MEMBER_SIGNUP_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MEMBER_GENDER" CHAR(2) NOT NULL,
    CONSTRAINT "MEMBER_INFO_CODE_PK" PRIMARY KEY("MEMBER_CODE")
);

-- 임의로 생성
CREATE TABLE "MYPAGE" (
	"MEMBER_CODE" VARCHAR2(20) NOT NULL,
	"DEL_STATUS" CHAR(1) DEFAULT 'Y' NOT NULL,
	"INTRO"	VARCHAR2(1000) NULL,
    CONSTRAINT "MYPAGE_MEMBER_CODE_FK" FOREIGN KEY("MEMBER_CODE") REFERENCES "MEMBER_INFO"("MEMBER_CODE"),
    CONSTRAINT "DEL_STATUS_CK" CHECK("DEL_STATUS" IN ('Y', 'N'))
);

-- 임의로 생성
CREATE TABLE "DOG_INFO" (
	"ID" VARCHAR2(50) NOT NULL,
	"MEMBER_CODE" VARCHAR2(20) NOT NULL,
	"IMG" VARCHAR2(4000) NULL,
	"NAME" VARCHAR2(100) NOT NULL,
	"KIND" VARCHAR2(100) NOT NULL,
	"SIZE" VARCHAR2(10) NOT NULL,
	"GENDER" VARCHAR2(10) NOT NULL,
	"NEUTERED" CHAR(1) DEFAULT 'N' NOT NULL,
	"VACCINE" VARCHAR2(1000) NOT NULL,
    CONSTRAINT "DOG_INFO_ID_PK" PRIMARY KEY("ID"),
    CONSTRAINT "DOG_INFO_MEMBER_CODE_FK" FOREIGN KEY("MEMBER_CODE") REFERENCES "MEMBER_INFO"("MEMBER_CODE"),
    CONSTRAINT "NEUTERED_CK" CHECK("NEUTERED" IN ('Y', 'N'))
);

CREATE TABLE "WALK_BOARD" (
	"WB_NO"	NUMBER NOT NULL,
	"MEMBER_CODE" VARCHAR2(20) NOT NULL,
	"ID" VARCHAR2(50) NOT NULL,
	"WB_TITLE" VARCHAR2(40) NOT NULL,
	"WB_CONTENT" VARCHAR2(2000) NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"WB_VIEWS" NUMBER NOT NULL,
	"WB_STATUS" CHAR(1)	DEFAULT 'Y' NOT NULL,
    CONSTRAINT "WALK_BOARD_WB_NO_PK" PRIMARY KEY("WB_NO"),
    CONSTRAINT "WALK_BOARD_MEMBER_CODE_FK" FOREIGN KEY("MEMBER_CODE") REFERENCES "MEMBER_INFO"("MEMBER_CODE"),
    CONSTRAINT "WALK_BOARD_ID_FK" FOREIGN KEY("ID") REFERENCES "DOG_INFO"("ID"),
    CONSTRAINT "WB_STATUS_CK" CHECK("WB_STATUS" IN ('Y', 'N'))
);

CREATE TABLE "WALK_COMMENT" (
	"WC_NO" NUMBER NOT NULL,
	"WB_NO" NUMBER NOT NULL,
	"MEMBER_ID" VARCHAR2(20) NOT NULL,
	"WB_COMMENT" VARCHAR2(1000) NOT NULL,
	"CREATE_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"MODIFY_DATE" DATE DEFAULT SYSDATE NOT NULL,
	"WC_STATUS" CHAR(1)	DEFAULT 'Y' NOT NULL,
    CONSTRAINT "WALK_COMMENT_WC_NO" PRIMARY KEY("WC_NO"),
    CONSTRAINT "WALK_COMMENT_WB_NO_FK" FOREIGN KEY("WB_NO") REFERENCES "WALK_BOARD"("WB_NO"),
    CONSTRAINT "WC_STATUS_CK" CHECK("WC_STATUS" IN ('Y', 'N'))
);

COMMIT;