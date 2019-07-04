<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title>学习使我快乐 - 博客管理</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet"/>
    <!--本页样式表-->
    <link href="../static/css/article.css" rel="stylesheet"/>
    <%--分页样式表--%>
    <link href="../static/css/pageInfo/page.css" rel="stylesheet">
    <link href="../static/citySelect/css/select.css" rel="stylesheet">

    <style>
        body{
            background: url("../static/images/background_modify.jpg") no-repeat center 0;
        }
    </style>
</head>
<body>
<!-- 导航 -->
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
            <c:if test="${user.admin eq '1'}">
                <li class="layui-nav-item">
                    <a href="${ctx}/write"><i class="fa fa-pencil fa-fw"></i>&nbsp;写博客</a>
                </li>
            </c:if>
            <li class="layui-nav-item" lay-unselect="">
                <c:if test="${empty user}">
                    <a href="../login.jsp" style="color:#F0FFFF">登录</a>
                </c:if>
                <c:if test="${not empty user}">
                    <a href="javascript:;" style="color:#F0FFFF">${user.name}</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${ctx}/modifyUser">修改信息</a></dd>
                        <c:if test="${user.admin eq '1'}">
                            <dd><a href="${ctx}/admin">后台管理</a></dd>
                        </c:if>
                        <dd><a href="${ctx}/logout">退出登录</a></dd>
                    </dl>
                </c:if>
            </li>
        </ul>
        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<!-- 主体（一般只改变这里的内容） -->
<div class="blog-body">
    <div class="blog-container">
        <blockquote class="layui-elem-quote sitemap layui-breadcrumb shadow">
            <a href="${ctx}/home" title="">网站首页</a>
            <a><cite>修改信息</cite></a>
        </blockquote>
        <div class="blog-main">
            <header class="layui-elip" style="text-align: center; font-size: 30px; font-weight: bold">信息修改</header>
            <div style="width: 30%;margin: 20px auto;">
                <form class="layui-form layui-form-pane" action="">
                    <input type="hidden" name="id" id="id" value="${user.id}">
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 80%">
                            <input type="text" name="username" lay-verify="username" disabled="disabled"
                                   autocomplete="off" class="layui-input" value="${user.email}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">必填</div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 80%">
                            <input type="password" name="password" id="password" lay-verify="password" placeholder="请输入密码"
                                   autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">选填</div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 80%">
                            <input type="text" name="phone" lay-verify="phone|required" placeholder="请输入电话" autocomplete="off"
                                   class="layui-input" value="${user.phone}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">必填</div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 80%">
                            <input type="text" name="name" lay-verify="required" placeholder="请输入昵称"
                                   autocomplete="off" class="layui-input" value="${user.name}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">必填</div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 80%">
                            <input type="text" name="description" lay-verify="" placeholder="请输入描述"
                                   autocomplete="off" class="layui-input" value="${user.description}">
                        </div>
                        <div class="layui-form-mid layui-word-aux">选填</div>
                    </div>
                    <div class="layui-form-item" id="addressDiv">
                        <div class="layui-input-inline" style="width: 40%">
                            <select name="P1" lay-filter="province" id="province">
                                <option></option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width: 40%">
                            <select name="C1" lay-filter="city" id="city">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="userAddress" id="userAddress" value="${user.address}">
                    <div class="layui-form-item">
                        <div class="layui-input-inline" style="width: 100%">
                            <button style="width: 80%" class="layui-btn layui-btn-warm layui-btn-radius"
                                    lay-submit="" lay-filter="submit">修改</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<!-- 底部 -->
<footer class="blog-footer" style="margin-bottom: 0px">
    <p><span>Copyright</span><span>&copy;</span><span>2018</span><a href="http://www.blogsyxl.cn">学习使我快乐</a><span>Design By YXL</span>
    </p>
</footer>
<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item">
        <a href="${ctx}/home"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item layui-this">
        <a href="${ctx}/article"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
    </li>
    <li class="layui-nav-item">
        <a href="${ctx}/resource"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
    </li>
    <li class="layui-nav-item">
        <a href="${ctx}/about"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
    </li>
</ul>
<!--分享窗体-->
<div class="blog-share layui-hide">
    <div class="blog-share-body">
        <div style="width: 200px;height:100%;">
            <div class="bdsharebuttonbox">
                <a class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                <a class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                <a class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                <a class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
            </div>
        </div>
    </div>
</div>
<!--遮罩-->
<div class="blog-mask animated layui-hide"></div>
<!-- layui.js -->
<script src="../static/plug/layui/layui.js"></script>
<!-- 全局脚本 -->
<script src="../static/js/global.js"></script>
<script src='../static/js/jquery/jquery.min.js'></script>
<script src='../static/citySelect/js/select.js'></script>
<script>
    layui.use(['form', 'layer'], function(){
        var form = layui.form;
        var layer = layui.layer;

        // 自定义验证规则
        form.verify({
            password: function (value) {
                if(value.length > 0){
                    if(value.length < 6 || value.length > 20){
                        return "密码长度在6位到20位之间";
                    } else if(value.indexOf(" ") !== -1){
                        return "密码中不能包含空格";
                    }
                }
            }
        });

        //监听提交
        form.on('submit(submit)', function(data){
            var id = data.field.id;
            var password = data.field.password;
            var phone = data.field.phone;
            var name = data.field.name;
            var description = data.field.description;
            var province = data.field.P1;
            var city = data.field.C1;
            $.ajax({
                url: "/submitModify",
                data: {"id": id, "password": password, "phone": phone, "name": name,
                    "description": description, "province": province, "city": city},
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                async: false,
                success: function (res) {
                    var message = res['message'];
                    console.log("message = " + message);
                    if(message === 'success'){
                        layer.msg("修改成功", {icon: 1});
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>