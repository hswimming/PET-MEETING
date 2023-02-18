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
<title>산책 게시판 선택 화면</title>
<link rel="stylesheet" href="${ path }/resources/css/main_style.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
</head>
<body>
	<header>
        <!-- 우측 상단 로그인 메뉴 -->
		<div>
            <nav class="join">
                <a href="https://www.naver.com">로그인</a>
                <a href="https://www.naver.com">회원가입</a>
            </nav>
        </div>
        <!-- 상단 고정 타이틀 -->
        <div id="title">
            <h1>PET-MEETING</h1>
            <h4>이동하고 싶은 게시판을 선택 하세요!</h4>
        </div>
    </header>
    <section>
        <!-- 게시판 선택 화면 -->
        <div class="b_wrapper">
            <div id="walk-list">
                <a href="https://www.google.com">산책 경로 추천</a>
            </div>
            <div id="walk-board">
                <a href="https://www.google.com">산책 친구 게시판</a>
            </div>
        </div>
	</section>
</body>
</html>