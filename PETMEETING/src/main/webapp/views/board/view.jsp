<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        section>div#board-write-container{
            width:600px; margin:0 auto; text-align:center;
        }
        section>div#board-write-container h2{
            margin:10px 0;
        }
        table#tbl-board{
            width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both;
        }
        table#tbl-board th{
            width: 125px; border:1px solid; padding: 5px 0; text-align:center;
        } 
        table#tbl-board td{
            border:1px solid; padding: 5px 0 5px 10px; text-align:left;
        }
        div#comment-container button#btn-insert{
            width:60px;height:50px; color:black; background-color:pink;position:relative;top:-20px;
        }
        
        table#tbl-comment{
            width:580px; margin:0 auto; border-collapse:collapse; clear:both;
        } 
        table#tbl-comment tr td{
            border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;
        }
        table#tbl-comment tr td:first-of-type{
            padding: 5px 5px 5px 50px;
        }
        table#tbl-comment tr td:last-of-type{
            text-align:right; width: 100px;
        }
        table#tbl-comment button.btn-delete{
            display:none;
        }
        table#tbl-comment tr:hover{
            background:lightgray;
        }
        table#tbl-comment tr:hover button.btn-delete{
            display:inline;
        }
        table#tbl-comment sub.comment-writer {
            color:navy; font-size:14px
        }
        table#tbl-comment sub.comment-date {
            color:tomato; font-size:10px
        }
    </style>
</head>
<body>
    <section id="content">   
        <div id="board-write-container">
            <h2 style="text-align: center; font-size: 2em;">게시판</h2>
            <table id="tbl-board" >
                <tr>
                    <th>카테고리</th>
                    <td>${ board.boardName }</td>
                </tr>
                <tr>
                    <th>글번호</th>
                    <td>${ board.boardNumber }</td>
                </tr>
                <tr>
                    <th>제 목</th>
                    <td>${ board.boardTitle }</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${ board.createDate }</td>
                </tr>
                
                <tr>
                    <th>작성자</th>
                    <td>${ board.memberNickName }</td>
                </tr>
                <tr>
                    <th>대상자</th>
                    <td>${ board.subjectId }</td>
                </tr>
                <tr>
                    <th>조회수</th>
                    <td>${ board.views }</td>
                </tr>
             <!--    <tr>
                    <th>첨부파일</th>
                    <td>
                    </td>
                </tr> -->
                <tr>
                    <th>내 용</th>
                    <td>${ board.boardContent }</td>
                </tr>
                <tr>
                    <th colspan="2">
                    <c:if test="${ not empty loginMember && loginMember.id == board.memberId }">
                        <button type="button" onclick="location.href='${ path }/board/update?boardNo=${ board.boardNo }'">수정</button>
                        <button type="button" id="btnDelete">삭제</button>
                        </c:if>
                        <button type="button" onclick="location.href='${ path }/board/list'">목록</button>
                    </th>
                </tr>
            </table>
            <div id="comment-container">
                <div class="comment-editor">
                    <form action="" method="POST">
                        <input type="hidden" name="boardNo" value="">
                        <input type="hidden" name="writer" value="">
                        <textarea name="content" cols="55" rows="3"></textarea>
                        <button type="submit" id="btn-insert">등록</button>	    			
                    </form>
                </div> 
            </div>
            <table id="tbl-comment">
                <tr class="level1">
                    <td>
                        <sub class="comment-writer">monimon</sub>
                        <sub class="comment-date">2023.02.07</sub>
                        <br>
                        컨텐츠
                    </td>
                    <td>
                        <button>삭제</button>
                    </td>
                </tr>
            </table>
        </div>
    </section>
    
 <script type="text/javascript">
 	$(document).ready(() => {
 		$('#btnDelete').on('click', () => {
 			if(confirm('정말로 게시글을 삭제할까요?' )) {
 				location.replace('${ path }/board/delete?no=${ board.boardNo }');
 			}
 		});
 		
 		
 	}); 
 </script>   
    
    
    
</body>
</html>
<jsp:include page="/views/common/footer.jsp" />