<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/main_style.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책 게시판 선택 화면</title>
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
    </header> --%>
    
    <section>
    <!-- 헤더 연결 후 스타일 적용이 안돼서 임시로 복붙 (여기서부터) -->
    <div id="title">
    	<h1>이동하고 싶은 게시판을 선택 하세요!</h1>
    </div>
    <!-- 헤더 연결 후 스타일 적용이 안돼서 임시로 복붙 (여기까지) -->
        <!-- 게시판 선택 화면 -->
        <div class="b_wrapper">
            <div id="walk-list">
                <a href="https://www.google.com">산책 경로 추천</a>
            </div>
            <div id="walk-board">
                <a href="${ path }/board/search">산책 친구 찾기</a>
            </div>
        </div>
    </section>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />