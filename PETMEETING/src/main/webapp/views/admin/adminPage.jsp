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
</style>


   <section id="adminSection">
   		
        <h4 style="text-align: center; margin-top: 10px">관리자 페이지</h4>
        <article>
			<ul id="adminNav">
				<li style="height: 10px; width: 100%; background-color: blanchedalmond"></li>
				<li><a href="${ path }/admin/manage">페이지 현황 보기</a></li>
				<li><a href="">산책 추천 게시판</a></li>
				<li><a href="">공지 사항 게시판</a></li>
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
                        <th>회원</th>
                        <td style="width: 90%;">1(0)</td>
                    </tr>
                    <tr>
                        <th style="width: 20%;">게시글</th>
                        <td>0(0)</td>
                    </tr>
                    <tr>
                        <th>댓글</th>
                        <td>0(0)</td>
                    </tr>
                </table>
            </div>
            <div>
                <table id="recentReply" class="adminTable">
                    <tr>
                        <th style="background-color: blanchedalmond;">최신 댓글</th>
                        <td style="background-color: blanchedalmond;"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td style="width: 500px;">0(0)</td>
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
                        <th style="background-color: blanchedalmond;">최근 게시글</th>
                        <td style="background-color: blanchedalmond;"></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td style="width: 400px;">0(0)</td>
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
    </section>


<jsp:include page="/views/common/footer.jsp" /> 
	