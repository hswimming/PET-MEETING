<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<style>
    body {
        font-family: '돋움';
    }

    div {
        display: block;
    }

    label {
        cursor: pointer;
    }

    .box {
        display: block;
        position: relative;
        width: 40%;
        height: 51px;
        border: solid 1px #dadada;
        /* border: none; */
        padding: 10px 110px 10px 14px;
        vertical-align: top;
        padding-right: 14px;
        box-sizing: border-box;
    }

    .info {
        display: block;
        position: relative;
        width: 100%;
        height: 29px;
        padding-right: 25px;
        line-height: 29px;
        border: none;
        font-size: 15px;
        box-sizing: border-box;
        z-index: 10;
    }

    .signup_content {
        padding-left: 35%;
    }

    .infotitle {
        font-size: medium;
        font-family: ;
    }

</style>

<section>
    <h1 style="text-align: center;">회원가입</h1>

    <div id="container" >
        <form action="${ path }/member/signup" id="signup_form" method="POST">
            <div id="content">
                <div class="signup_content">
                    <div class="">
                        <div>
                            <h3 class="infotitle">
                                <label for="getid">아이디</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="id" name="id" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getpwd">비밀번호</label>
                            </h3>
                            <span class="box">
                                <input type="password" id="password" name="password" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getpwd2">비밀번호 확인</label>
                            </h3>
                            <span class="box"> 
                                <input type="password" id="ckpassword" name="ckpassword" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getname">이름</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="name" name="name" class="info" maxlength="16" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getnickname">닉네임</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="nickname" name="nickname" class="info" maxlength="8" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getphone">전화번호</label>
                            </h3>
                            <span class="box">
                                <input type="tel" id="phone" name="phone" class="info" maxlength="12" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getaddress">주소</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="address" name="address" class="info" maxlength="50" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getemail">이메일</label>
                            </h3>
                            <span class="box">
                                <input type="email" id="email" name="email" class="info" maxlength="40" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getbirth">생년월일</label>
                            </h3>
                            <span class="box">
                                <input type="text" id="birth" name="birth" class="info" maxlength="8" required>
                            </span>
                        </div>
                        <div>
                            <h3 class="infotitle">
                                <label for="getgender">성별</label>
                            </h3>
                                <label for="male">남</label>
                                <input type="radio" id="male" name="gender" value="M" required>
                                <label for="female">녀</label>
                                <input type="radio" id="female" name="gender" value="F" required>
                        </div>
                        
                    </div>
                </div>
            </div>
            <button type="submit" id="signup">가입하기</button>
            <button><a href="${ path }/">취소</a></button>
        </form>
    </div>
</section>
 

<jsp:include page="/views/common/footer.jsp" /> 