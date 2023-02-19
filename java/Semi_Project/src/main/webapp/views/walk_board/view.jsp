<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책 게시판 게시글 보기 화면</title>
<link rel="stylesheet" href="${ path }/resources/css/view_style.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
</head>
<body>
	<header>
        <!-- 우측 상단 로그아웃 메뉴 -->
        <div>
            <nav class="join">
                <a href="https://www.naver.com">로그아웃</a>
                <a href="https://www.naver.com">마이페이지</a>
            </nav>
        </div>
        <!-- 상단 고정 타이틀 -->
        <div id="title">
            <h1>PET-MEETING</h1>
        </div>
    </header>
    <section>
        <div id="board_title">
            <h2>게시글 보기</h2>
        </div>
        <!-- 게시글 상세 조회 -->
        <div id="table_wrapper">
            <table id="tbl">
                <tr>
                    <th colspan="2">제목</th>
                </tr>
                <tr>
                    <th>글번호</th>
                    <td></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td></td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td></td>
                </tr>
                <tr>
                    <th colspan="2">내용</th>
                </tr>
                <tr>
                    <td colspan="2" id="table-box"></td>
                </tr>
                <!-- 로그인 했을 때 보이는 버튼 -->
                <tr>
                    <th colspan="2">
                        <button type="button">수정</button>
                        <button type="button">삭제</button>
                        <button type="button" onclick="location.replace('${path}/board/list')">목록</button>
                    </th>
                </tr>
            </table>
        </div>
        <!-- 댓글 작성 -->
        <div id="comment">
            <form action="">
                <input type="hidden">
                <textarea name="" id="replyContent" cols="90" rows="3"></textarea>
                <button type="submit" id="replybtn">등록</button>
            </form>
        </div>
        <!-- 댓글 조회 -->
        <div id="reply">
            <table id="reply-table">
                <tr>
                    <td>
                        <sub>작성자 ID</sub>
                        <sub>작성 날짜</sub>
                        <br>
                        <span>댓글 내용</span>
                    </td>
                    <td>
                        <button type="submit" id="commentbtn">삭제</button>
                    </td>
                </tr>
            </table>
        </div>
    </section>
</body>
</html>