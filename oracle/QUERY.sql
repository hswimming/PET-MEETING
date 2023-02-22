-- 총 게시글 조회 개수
SELECT COUNT(*) FROM WALK_BOARD WHERE WB_STATUS='Y';

-- 목록 조회(페이징)
SELECT RNUM, WB_NO, WB_TITLE, MEM_NICKNAME, CREATE_DATE, WB_VIEWS, WB_STATUS
FROM (
        SELECT ROWNUM AS RNUM,
        WB_NO,
        WB_TITLE,
        MEM_NICKNAME,
        CREATE_DATE,
        WB_VIEWS,
        WB_STATUS 
        FROM (
        SELECT  WB.WB_NO,
                WB.WB_TITLE,
                M.MEM_NICKNAME,
                WB.CREATE_DATE,
                WB.WB_VIEWS,
                WB.WB_STATUS
        FROM WALK_BOARD WB JOIN MEMBER M ON(WB.MEM_CODE = M.MEM_CODE) 
        WHERE WB.WB_STATUS = 'Y' ORDER BY WB.WB_NO DESC
    )
)
WHERE RNUM BETWEEN 1 and 10;

-- 상세 조회 (마이페이지 강아지 정보 안보임)
SELECT  WB.WB_NO, WB.WB_TITLE, M.MEM_NICKNAME, WB.WB_VIEWS, WB.WB_CONTENT, WB.CREATE_DATE, WB.MODIFY_DATE
FROM WALK_BOARD WB
JOIN MEMBER M ON(WB.MEM_CODE = M.MEM_CODE)
WHERE WB.WB_STATUS = 'Y' AND WB.WB_NO=?;

-- 상세 조회 (마이페이지 강아지 정보 보임)
SELECT  WB.WB_NO, WB.WB_TITLE, M.MEM_NICKNAME, WB.WB_VIEWS, WB.WB_CONTENT, WB.CREATE_DATE, WB.MODIFY_DATE, D.D_NAME, D.D_KIND, D.D_SIZE, D.D_GENDER, D.NEUTERED, D.VACCINE
FROM WALK_BOARD WB
JOIN MEMBER M ON(WB.MEM_CODE = M.MEM_CODE)
JOIN DOG_INFO D ON (WB.D_ID = D.D_ID)
WHERE WB.WB_STATUS = 'Y' AND WB.WB_NO=?;

-- 조회수 증가
UPDATE WALK_BOARD SET WB_VIEWS=? WHERE WB_NO=?;

-- 댓글 조회
SELECT C.WC_NO, C.WB_NO, C.WB_COMMENT, M.MEM_NICKNAME, C.CREATE_DATE, C.MODIFY_DATE
FROM WALK_COMMENT C
JOIN MEMBER M ON(C.WC_NICKNAME = M.MEM_NICKNAME)
WHERE C.WC_STATUS='Y' AND WC_NO=?
ORDER BY C.WC_NO DESC;

-- 게시글 등록
INSERT INTO WALK_BOARD VALUES (WB_NO_SEQ.NEXTVAL, ?, ?, ?, ?, DEFAULT, DEFAULT, ?, DEFAULT);

-- 게시글 수정

COMMIT;