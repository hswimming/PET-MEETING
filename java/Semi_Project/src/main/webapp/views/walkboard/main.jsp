<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<link rel="stylesheet" href="${ path }/resources/css/wbmain.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>
    
	<section>
		<div id="title">
			<br>
			<h4>이동하고 싶은 게시판을 선택 하세요!</h4>
		</div>
    
		<!-- 게시판 선택 화면 -->
		<div class="b_wrapper">
			<img src="${ path }/image/walkmain.jpg" id="walkimg">
			<div id="walk-list" onclick="location.href=''"></div>
			<div id="walk-board" onclick="location.href='${ path }/walkBoard/list'"></div>
		</div>
	</section>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />