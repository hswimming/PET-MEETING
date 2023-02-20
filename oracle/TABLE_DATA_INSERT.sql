-- 데이터 INSERT 하는중

-- MEMBER
INSERT INTO "MEMBER" VALUES (MEMBER_CODE_SEQ.NEXTVAL, 'HSY', '1234', '황수영', '수수', 01012345678, '서울특별시', 'ABC@ABC.COM', SYSDATE, SYSDATE, 'F', 'Y');
INSERT INTO "MEMBER" VALUES (MEMBER_CODE_SEQ.NEXTVAL, 'LJH', '5678', '이정환', '정환', 01056781234, '잠실', 'DEF@ABC.COM', SYSDATE, SYSDATE, 'M', 'Y');

-- MYPAGE
INSERT INTO "MYPAGE" VALUES (6, 'N', '안녕하세요');
INSERT INTO "MYPAGE" VALUES (7, 'N', '코딩이 제일 쉬워요');

-- DOG_INFO
INSERT INTO "DOG_INFO" VALUES (DOG_ID_SEQ.NEXTVAL, 6, NULL, '보리', '미니핀', '중형견', '암컷', 'Y', 'Y');
INSERT INTO "DOG_INFO" VALUES (DOG_ID_SEQ.NEXTVAL, 7, NULL, '아롱이', '믹스', '중형견', '암컷', 'Y', 'Y');

-- WALK_BOARD
INSERT INTO "WALK_BOARD" VALUES (WB_NO_SEQ.NEXTVAL, 6, 1, '산책 같이 하실 분~!', '공원에서 같이 산책 하실래요?', SYSDATE, SYSDATE, 0, 'Y');
INSERT INTO "WALK_BOARD" VALUES (WB_NO_SEQ.NEXTVAL, 7, 2, '코딩 하면서 산책 하실 분~!', '저는 코딩이 제일 쉬웠어요', SYSDATE, SYSDATE, 0, 'Y');

-- WALK_COMMENT
INSERT INTO "WALK_COMMENT" VALUES (WC_NO_SEQ.NEXTVAL, 4, 'HSY', '저랑 산책 하실래요?', SYSDATE, SYSDATE, 'Y');
INSERT INTO "WALK_COMMENT" VALUES (WC_NO_SEQ.NEXTVAL, 5, 'LJH', '저는 코딩만 합니다.', SYSDATE, SYSDATE, 'Y');