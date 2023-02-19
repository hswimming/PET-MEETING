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
<title>산책 게시판 게시글 작성 화면</title>
<link rel="stylesheet" href="${ path }/resources/css/write_style.css">
<script src="${ path }/resources/js/jquery-3.6.3.js"></script>

<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
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
            <h2>게시판 작성</h2>
        </div>
        <div id="t_wrapper">
            <!-- 게시판 작성 화면 -->
            <table>
                <tr>
                    <td style="width: 50%;">제목</td>
                    <td colspan="2">
                        <input type="text" name="content_title" id="content_title" placeholder="제목을 작성해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td style="width: 50%;">작성자</td>
                    <td colspan="2">
                        <input type="text" name="content" id="content">
                    </td>
                </tr>
                <tr>
                    <td>첨부파일</td>
                    <td><input type="file" name="file" id="upfile"></td>
                </tr>
            </table>
        </div>
        <!-- 게시글 내용 입력 칸 -->
        <div id="content_box">
            <!-- 2. TEXT 편집 툴을 사용할 textarea -->
            <textarea name="content" id="editor"></textarea>
        </div>
        <!-- 등록 버튼 -->
        <div id="btn">
            <div id="btn1"><input type="submit" value="등록"></div>
            <div id="btn2"><input type="reset" value="취소"></div>
        </div>
    </section>

    <!-- 3. CKeditor5를 생성할 textarea 지정 -->
    <script>
        ClassicEditor.create( document.querySelector( '#editor' ), {
            language: 'ko',
        } )
        
        // removePlugins: [ 'ImageUpload' ]

        .catch( error => {
                console.error( error );
            } );
    </script>
</body>
</html>