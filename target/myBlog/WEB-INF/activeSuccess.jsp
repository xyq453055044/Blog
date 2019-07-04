<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <title>邮箱激活成功页面</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <link rel="stylesheet" href="../static/css/login/font.css">
    <link rel="stylesheet" href="../static/css/login/xadmin.css">

</head>
<body class="login-bg">
<div class="login layui-anim layui-anim-up">
    <div class="message">学习使我快乐 - 邮箱激活成功</div>
    <div class="tab-content">
        <div>
            <div class="field-wrap">
                <span style="color: green; font-size: 23px">激活成功!!!&nbsp;&nbsp;<span id="waiting" style="color: red; font-size: 35px">3</span>&nbsp;&nbsp;秒后跳转到登录页</span>

            </div>
        </div>

        <div id="signup">

        </div>
    </div><!-- tab-content -->
</div>
<!-- layui.js -->
<script src="../static/plug/layui/layui.js"></script>
<script src='../static/js/jquery/jquery.min.js'></script>
<script>
    function waiting(second){
        if(second > 0){
            second --;
            document.getElementById("waiting").innerHTML = second;
            setTimeout("waiting(" + second+ ")", 1000);
        }else{
            window.location.href = "../login.jsp";
        }
    }

    window.onload = function(){
        setTimeout("waiting(3)",1000)
    }
</script>
</body>
</html>