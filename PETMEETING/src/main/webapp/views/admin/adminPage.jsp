<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/views/common/header.jsp" />

<style>
	#adminNav {
		list-style-type: none;
   		padding: 0;
   		margin: 0;
	}
	
	#adminNav li {
		height: 70px;
		text-align: center;
	}
	
	#adminNav a {
		 display: block;
  		 text-decoration: none;
  		 color: black;
  		 height: 100%;
   		 line-height: 70px;
	}
	
	#adminNav a:hover {
		background-color: blanchedalmond;
	}
	
	#recentBoard td div{
		float: left;
		margin-right: 50px;
				

	}
</style>


   <section id="adminSection">
        <h4 style="text-align: center; margin-top: 10px">관리자 페이지</h4>
        <article>
			<ul id="adminNav">
				<li style="height: 10px; width: 100%; background-color: blanchedalmond"></li>
				<li><a href="${ path }/admin/manage">페이지 현황 보기</a></li>
				<li><a href="${ path }/walkboard/walklist">산책 추천 게시판</a></li>
				<li><a href="${ path }/board/list?boardCode=B5&page=1">공지 사항 게시판</a></li>
			</ul>
        </article>
        <article>
            <div>
                <table id="allStatus" class="adminTable">
                    <tr>
                        <th style="background-color: blanchedalmond;">현황</th>
                        <td style="background-color: blanchedalmond;"></td>
                    </tr>
                    <tr>
                        <th>전체 회원 수</th>
                        <td style="width: 90%;">${ countMember }</td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">게시글</th>
                        <td>${ countBoard }</td>
                    </tr>
                    <tr>
                    </tr>
                </table>
            </div>
            <div>
                <table id="recentReply" class="adminTable">
                    <tr>
                        <th style="background-color: blanchedalmond;">산책 게시판 <br> 최신글</th>
                        <td style="background-color: blanchedalmond;"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td style="width: 500px;"></td>
                    </tr>
                    <tr>
                        <th style="width: 100px;"></th>
                        <td></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td></td>
                    </tr>
                </table>
            </div>
        </article>
        <article>
            <div>
                <table id="recentBoard" class="adminTable">
                    <tr>
                        <th style="background-color: blanchedalmond;">게시판 최신글</th>
                        <td style="background-color: blanchedalmond;"></td>
                    </tr>
                    <tr>
                        <th>1</th>
                        <td style="width: 400px;" id="recentBoard">
                        	<div>${ board.boardTitle }</div>
                        	<div style="overflow: hidden;">${ board.boardContent }</div>
                        	<div>${ board.memberNickName }</div>
                        </td>
                    </tr>
                    <tr>
                        <th style="width: 100px;">2</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td></td>
                    </tr>
                </table>
            </div>
            <a id="pageMove" href='#indexMove'></a>
        </article>
    </section>

	<script>
		$(document).ready(() => {
			$('#pageMove').get(0).click();
		});
	</script>

<jsp:include page="/views/common/footer.jsp" /> 
	