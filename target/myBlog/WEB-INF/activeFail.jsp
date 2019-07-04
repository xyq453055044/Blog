<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <title>激活失败页面</title>
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../static/css/login/normalize.min.css">
    <link rel="stylesheet" href="../static/css/login/style.css">
    <style>
        canvas{
            position:absolute;
            width: 100%;
            height: 100%;
            top:0;
            left:0;
            background-color:black;
            z-index:-2;
        }
    </style>
</head>
<body>
<div class="form">
    <div class="tab-content">
        <div id="login">
            <h1 style="color: green">激活失败</h1>
            <div class="field-wrap">
                <span style="color: red; font-size: 25px">激活失败!!! ${fail}</span>
            </div>
            <div class="field-wrap">
                <a href="../register.jsp" class="field-wrap" style="font-size: 25px">重新注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="javascript:history.back(-1)" id="reBack" class="field-wrap" style="font-size: 25px">返回</a>
            </div>
        </div>

        <div id="signup">

        </div>
    </div><!-- tab-content -->
</div> <!-- /form -->
<canvas id=c></canvas>
<script src='../static/js/jquery/jquery.min.js'></script>
<script src="../static/js/login/index.js"></script>
<script src="../static/js/background/background.js"></script>
</body>
</html>