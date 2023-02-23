<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판글목록페이지</title>
</head>
<body>
   <style>
   section {
   margin:auto;
   
   width:70%;
   }
        section#board-list-container{
            width:600px; margin:0 auto; text-align:center;
        }
        section#board-list-container h2{
            margin:10px 0;
        }
        table#tbl-board{
            width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both;
        }
        table#tbl-board th, table#tbl-board td{
            border:1px solid; padding: 5px 0; text-align:center;
        } 
        button#btn-add{
			float:right;
        }
        div#pageBar{
            margin-top:10px; text-align:center;
        }
    </style>
    <section id="content">
		<div id="board-list-container">
		<h2 style="text-align: center; font-size: 2em;">정보공유방</h2>
		<c:if test="${ not empty loginMember }">
			<button id="btn-add" onclick="location.href='${ path }/board/write'">글쓰기</button><br><br>
		</c:if>
              
		<select name="category" id="category" style="margin-bottom: 5px;">
			<option selected>선택</option>
			<option value="introduce">펫 다이어리</option>
			<option value="review">펫미팅 후기</option>
			<option value="info">정보 공유</option>
			<option value="qna">문의 / 건의</option>
			<option value="notice">공지사항</option>
			<option value="report">신고하기</option>
		</select>
		<select name="writingnumber" id="writingnumber" style="float: right; margin-bottom: 5px;">
			<option value="five">5개씩 보기</option>
			<option value="ten" selected>10개씩 보기</option>
		</select>
	
	

		<table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
				<!-- <th>첨부파일</th> -->
			</tr>
			<c:if test="${ empty list }">
				<tr>
				<td colspan="5">
				조회된 게시글이 없습니다.
				</td>
			</tr>
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="board" items="${ list }">
					<tr>
						<td>${ board.rowNum }</td>
						<td>
							<a href="${ path }/board/view?boardNo=${ board.boardNo} ">
								${ board.boardTitle }
							</a>
						</td>
						<td>${ board.memberCode }</td>
						<td>${ board.createDate }</td>
						<td>
								<span> - </span>
						</td>
						<td>${ board.views }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>

		<div id="pageBar">
			<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.prevPage }'">&lt;</button>
			                  
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:choose>
					<c:when test="${ status.current == pageInfo.currentPage }">
						<button disabled>${ status.current }</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='${ path }/board/list?page=${ status.current }'">${ status.current }</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>


                  <button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>
                  <button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
              </div>
          </div>
      </section>
<jsp:include page="/views/common/footer.jsp" />