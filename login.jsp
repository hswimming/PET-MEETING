<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
<style>
    #container {
        margin-top: 5%;
        margin-left: 5%;
    }
    
    .btn_login {
        display: inline-block;
        top: 70px;
        width: 120px;
        height: 80px;
        border-radius: 6px;
        border: solid 1px rgba(0, 0, 0, .15);
        background-color: #03c75a;
        box-sizing: border-box;
    }

    
    div #wrap.wrap {
        letter-spacing: -.5px;
    }
    
    /* div {
        display: block;
    } */
    
    .login_wrap {
        box-sizing: border-box;
        width: 460px;
        margin: 0 auto;
    }
    
    .find_wrap {
        padding: 20px 0 30px;
        list-style: none;
        /* display: inline-block; */
        display: inline-flex;
        
        /* text-align: center; */
    }

    .find_text {
        font-size: 14px;
        line-height: 17px;
        text-decoration: none;
    }

</style>
    <section>
        <div id="container" class="container">
            <h1 id="login" style="text-align: center;">Login</h1>
            <div class="content">
                <div class="login_wrap">

                    <form action="" method="POST">
                        <div>
                            <input type="text" id="id" name="id" class="input_text" placeholder="아이디" maxlength="16">
                        </div>
                        <br>
                        <div>
                            <input type="password" id="password" name="password" class="input_text" placeholder="비밀번호" maxlength="16">
                        </div>
                        <div class="btn_login_wrap"> 
                            <button type="submit" class="btn_login" id="btn_login">
                                <span class="btn_login_text">로그인</span>
                            </button>
                        <br>
                        </div>
                        <div>
                            <label for="saveid">
                                <input type="checkbox" id="saveid" name="saveid" class="input_save">
                                <span style="font-size: small;">아이디 저장</span>
                            </label>
                        </div>
                    </form>
                    <ul class="find_wrap" id="find_wrap">
                        <li><a href="" class="find_text">아이디 / 비밀번호 찾기<br></a></li>
                        <li><a href="${ path }/member/signup" class="find_text" style="padding: 50px;">회원가입</a></li>
                    </div>
                    </ul>
            </div>
        </div>
    </section>

<jsp:include page="/views/common/footer.jsp" /> 