<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学习使我快乐 - 登陆页面</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <!--全局样式表-->
    <link href="./static/css/global.css" rel="stylesheet"/>
    <link rel="shortcut icon" href="./static/images/Logo_40.png" type="image/x-icon">
    <link rel="stylesheet" href="./static/css/login/font.css">
    <link rel="stylesheet" href="./static/css/login/xadmin.css">

</head>

<body class="login-bg">
<nav class="blog-nav layui-header">
    <div class="blog-container">
        <!-- 学习使我快乐 -->
        <a class="blog-logo" href="${ctx}/home">学习使我快乐</a>
        <!-- 导航菜单 -->
        <ul class="layui-nav" lay-filter="nav">
            <li class="layui-nav-item">
                <a href="${ctx}/home"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
            </li>
            <li class="layui-nav-item">
                <a href="${ctx}/article"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
            </li>
            <li class="layui-nav-item">
                <a href="${ctx}/resource"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
            </li>
            <li class="layui-nav-item">
                <a href="${ctx}/about"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
            </li>
        </ul>
        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<div class="login layui-anim layui-anim-up">
    <div class="message">学习使我快乐 - 博客登录</div>
    <div id="darkbannerwrap"></div>
    <form class="layui-form" action="${ctx}/doLogin" method="post">

        <input type="text" name="username" id="username" lay-verify="required|username" placeholder="请输入邮箱"
               autocomplete="off" class="layui-input">
        <hr class="hr15">
        <input type="password" name="password" id="password" lay-verify="required" placeholder="请输入密码"
               autocomplete="off" class="layui-input">
        <hr class="hr15">
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <input type="text" name="code" id="code" lay-verify="required|code" placeholder="请输入验证码"
                       autocomplete="off" class="layui-input">
            </div>
            <label class="field-wrap" style="cursor:pointer;">
                <img src="${ctx}/captchaServlet" id="captchaImg" align='absmiddle' height="40px"
                     style="margin-top: 5px" onclick="changeCaptcha()">
            </label>
            <span id="code_span" style="color: green"></span>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-inline">
                <p style="text-align: left"><a href="register.jsp">没有账号？前往注册</a></p>
            </div>
            <label class="field-wrap" style="cursor:pointer;">
                <p style="text-align: right"><a href="email.jsp">忘记密码？</a></p>
            </label>
        </div>
        <button style="width: 100%" class="layui-btn layui-btn-radius" lay-submit="" lay-filter="submit">登录</button>
        <hr class="hr15">
    </form>
</div>
<!--遮罩-->
<div class="blog-mask animated layui-hide"></div>
<!-- layui.js -->
<script src="./static/plug/layui/layui.js"></script>
<script src='./static/js/jquery/jquery.min.js'></script>
<script>

    $(function () {
        changeCaptcha();
    });

    function changeCaptcha() {
        $.ajax({
            type: 'get',
            url: '${ctx}/captcha',
            dataType: 'json',
            success: function (data) {
                if (data.code != 200) {
                    layer.msg("验证码错误", {icon: 5});
                } else {
                    $("#captchaImg").attr('src', 'data:image/jpeg;base64,' + data.data.image);

                }
            }
        })
    }

    layui.use(['form', 'layer'], function () {

        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;


        //监听提交
        form.on('submit(submit)', function () {
            var email = $("#username").val();
            var password = $("#password").val();
            var captcha = $("#code").val();
            var reg = new RegExp("^[a-z0-9A-Z]+[- | a-z0-9A-Z . _]+@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-z]{2,}$");

            if (email == null || email.length <= 0) {
                layer.msg("邮箱不能为空", {icon: 5});
                return false;
            }
            if (!reg.test(email)){
                layer.msg("邮箱格式不正确", {icon: 5});
                return false;
            }

            if (password.length < 6) {
                layer.msg("密码长度不能少于六位", {icon: 5});
                return false;
            }
            $.ajax({
                type: 'post',
                url: '${ctx}/doLogin',
                data: {"email": email, "password": password, "captcha": captcha},
                dataType: 'json',
                success: function (data) {
                    if (data.code != 200) {
                        layer.msg(data.msg, {icon: 2});
                        return false;
                    } else {
                        location = "${ctx}/home";
                    }
                }
            });
            //非常重要
            return false;

        });
    });


</script>
</body>
</html>