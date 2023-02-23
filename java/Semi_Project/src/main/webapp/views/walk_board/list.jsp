<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="${ path }/resources/css/list_style.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산책 게시판 목록</title>

<!-- 부트스트랩 코드 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<link rel="stylesheet" href="./06_walkboard_list.css">
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
            <h1 class="text-center">게시글 목록</h1>
        </div>
        <!-- 게시글 목록 메뉴 -->
        <div class="container" id="list-div">
            <!-- 우측 게시글 작성 버튼 -->
            <c:if test="${ not empty loginMember }">
 	           <button type="button" class="btn btn-outline-info" onclick="location.href='${ path }/walk_board/write'">작성하기</button>
            </c:if>
            
            <table class="table table-hover table-striped text-center" id="list-table">
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    <c:if test="${ empty list }">
                    	<tr>
                    		<td colspan="6">
                    			조회된 게시글이 없습니다.
                    		</td>
                    	</tr>
                    </c:if>
                    <c:if test="${ not empty list }">
                    	<c:forEach var="walk_Board" items="${ list }">
                    		<tr>
		                        <td>${ walk_Board.rowNum }</td>
		                        <td>
		                        	<a href="${ path }/walk_board/view?wbNo=${ walk_Board.wbNo }">
		                        		${ walk_Board.wbTitle }
		                        	</a>
		                        </td>
		                        <td>${ walk_Board.memNickname }</td>
		                        <td>${ walk_Board.createDate }</td>
		                        <td>${ walk_Board.wbViews }</td>
                    		</tr>
                    	</c:forEach>
                    </c:if>
            </table>
            <!-- 하단 목록 이동 버튼 -->
            <div id="num-click">
               		<ul class="pagination justify-content-center">
                	<!-- 맨 처음 목록으로 이동 -->
                    <li><button onclick="location.href='${ path }/walk_board/list?page=1'">&lt;&lt;</button></li>
                    
                    <!-- 이전 페이지로 이동 -->
                     <li><button onclick="location.href='${ path }/walk_board/list?page=${ pageInfo.prevPage }'">&lt;</button></li>
                    
                    <!-- 10개 페이지 목록 -->
                    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:choose>
							<c:when test="${ status.current == pageInfo.currentPage }">
								<li><button disabled>${ status.current }</button></li>
							</c:when>
							<c:otherwise>
								<li><button onclick="location.href='${ path }/walk_board/list?page=${ status.current }'">${ status.current }</button></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 다음 페이지로 이동 -->
                    <li><button onclick="location.href='${ path }/walk_board/list?page=${ pageInfo.nextPage }'">&gt;</button></li>
                    
                    <!-- 맨 마지막 페이지로 이동 -->
                   	<li><button onclick="location.href='${ path }/walk_board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button></li>
                	</ul>
            </div>
        </div>
        </section>
        <!-- 부트스트랩 코드 -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD" crossorigin="anonymous"></script>

        <!-- 부트스트랩 코드 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>

<jsp:include page="/views/common/footer.jsp" />