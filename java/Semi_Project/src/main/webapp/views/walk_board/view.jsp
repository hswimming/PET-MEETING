<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/view_style.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책 게시판 게시글 보기 화면</title>
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
    </header> --%>
    
    <section>
        <div id="board_title">
            <h2>게시글 보기</h2>
        </div>
        <!-- 게시글 상세 조회 -->
        <div id="table_wrapper">
            <table id="tbl">
                <tr>
                    <th colspan="2">제목</th>
                    <td>${ walk_board.wbTitle }</td>
                </tr>
                <tr>
                    <th>글번호</th>
                    <td>${ walk_board.wbNo }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ walk_board.memNickname }</td>
                </tr>
                <tr>
                	<th>강아지 정보</th>
                	<td>${ walk_board.name }</td>
                	<td>${ walk_board.kind }</td>
                	<td>${ walk_board.size }</td>
                	<td>${ walk_board.gender }</td>
                	<td>${ walk_board.neutered }</td>
                	<td>${ walk_board.vaccine }</td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td>${ walk_board.wbViews }</td>
                </tr>
                <!-- <tr>
                    <th>첨부파일</th>
                    <td></td>
                </tr> -->
                <tr>
                    <th colspan="2">내용</th>
                    <td>${ walk_board.wbContent }</td>
                </tr>
                <tr>
                    <td colspan="2" id="table-box"></td>
                </tr>
                <!-- 로그인 했을 때 보이는 버튼 -->
                <tr>
                    <th colspan="2">
                    <c:if test="${ not empty loginMember && loginMember.nickname == walk_board.memNickname }">
                        <button type="button" onclick="location.href='${ path }/board/update?wbNo=${ walk_board.wbNo }'">수정</button>
                        <button type="button" id="btnDelete">삭제</button>
                    </c:if>
                        <button type="button" onclick="location.replace('${ path }/board/list')">목록</button>
                    </th>
                </tr>
            </table>
        </div>
        <!-- 댓글 작성 -->
        <div id="comment">
            <form action="${ path }/board/comment" method="POST">
                <input type="hidden" name="walk_boardwbNo" value="${ walk_board.wbNo }">
                <textarea name="" id="commentContent" cols="90" rows="3"></textarea>
                <button type="submit" id="replybtn">등록</button>
            </form>
        </div>
        <!-- 댓글 조회 -->
        <div id="reply">
            <table id="reply-table">
            	<c:forEach var="comments" items="${ walk_board.comments }">
                <tr>
                    <td>
                        <sub>${ comments.wcNickname }</sub>
                        <sub>${ comments.createDate }</sub>
                        <br>
                        <span>${ comments.wbComment }</span>
                    </td>
                    <td>
                    	<c:if test="${ not empty loginMember && loginMember.nickname == walk_board.memNickname }">
	                        <button type="submit" id="commentbtn">삭제</button>
                    	</c:if>
                    </td>
                </tr>
            	</c:forEach>
            </table>
        </div>
    </section>
<script>
	$(document).ready(() => {
		$('#btnDelete').on('click', () => {
			if (confirm('정말로 게시글을 삭제 하시겠습니까?')) {
				location.replace('${ path }/board/delete?wbNo=${ walk_board.wbNo }');
			}
		});
		
	/* 	$('#commentContent').on('focus', () => {
			if (${ empty loginMember }) {
				alert('로그인 후 이용 해주세요.');
				
				$('#userId').focus();
			}
		}); */
	});
</script>
    
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />