<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; Charset=gb2312">
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <title>学习使我快乐 - 关于本站</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet"/>
    <!-- 本页样式表 -->
    <link href="../static/css/about.css" rel="stylesheet"/>

    <style>
        .introduction-blog {
            position: absolute;
            left: 50%;
            top: 30%;
            display: none;
            width: 400px;
            background-color: #FFE4C4;
            padding: 10px;
            margin-left: -200px;
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
            <li class="layui-nav-item layui-this">
                <a href="${ctx}/about"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
            </li>
            <c:if test="${user.enable eq '1'}">
                <li class="layui-nav-item">
                    <a href="${ctx}/write"><i class="fa fa-pencil fa-fw"></i>&nbsp;写博客</a>
                </li>
            </c:if>
            <li class="layui-nav-item" lay-unselect="">
                <c:if test="${empty user}">
                    <a href="../login.jsp" style="color:#F0FFFF">登录</a>
                </c:if>
                <c:if test="${not empty user}">
                    <a href="javascript:;" style="color:#F0FFFF">${user.nickName}</a>
                    <dl class="layui-nav-child">
                        <dd><a href="${ctx}/modifyUser">修改信息</a></dd>
                        <c:if test="${user.enable eq '1'}">
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
            <a href="${ctx}/home" title="网站首页">网站首页</a>
            <a><cite>关于本站</cite></a>
        </blockquote>
        <div class="blog-main">
            <div class="layui-tab layui-tab-brief shadow" lay-filter="tabAbout">
                <ul class="layui-tab-title">
                    <li class="layui-this">关于博客</li>
                    <li>关于作者</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="aboutinfo">
                            <div class="aboutinfo-figure">
                                <img src="../static/images/qiubixiong.jpg" style="height: 120px" alt="学习使我快乐"/>
                            </div>
                            <p class="aboutinfo-nickname">学习使我快乐
                                <%--<c:if test="${user.enable == 1}">
                                    <a class="version-panel-id"><i class="fa fa-pencil fa-fw"></i></a>
                                </c:if>--%>
                            </p>
                            <p class="aboutinfo-introduce">一个Java程序员的个人博客，记录博主学习和成长之路，分享Java方面技术和源码</p>
                            <p class="aboutinfo-location">
                                <i class="fa fa-link"></i>&nbsp;&nbsp;
                                <a target="_blank" href="http://www.blogsyxl.cn">www.blogsyxl.cn</a>
                            </p>
                            <hr/>
                            <div class="aboutinfo-contact">
                                <a target="_blank" title="网站首页" href="${ctx}/home"><i class="fa fa-home fa-2x"
                                                                                      style="font-size:2.5em;position:relative;top:3px"></i></a>
                                <a target="_blank" title="文章专栏" href="${ctx}/article"><i
                                        class="fa fa-file-text fa-2x"></i></a>
                                <a target="_blank" title="资源分享" href="${ctx}/resource"><i class="fa fa-tags fa-2x"></i></a>
                                <a target="_blank" title="关于本站" href="${ctx}/about"><i class="fa fa-info fa-2x"></i></a>
                            </div>

                            <fieldset class="layui-elem-field layui-field-title">
                                <legend>简介
                                    <c:if test="${user.enable == 1}">
                                        <a id="modify-intro"><i class="fa fa-pencil fa-fw"></i></a>
                                    </c:if>
                                </legend>

                                <div class="layui-field-box aboutinfo-abstract">
                                    <p>${aboutBlog.abBlogIntro}</p>
                                    <c:forEach var="blogVersion" items="${blogVersions}">
                                        <h1>${blogVersion.blogVerTitle}
                                                <%--<c:if test="${user.enable == 1}">
                                                    <a class="version-panel-id">
                                                        <i class="fa fa-pencil fa-fw"></i>
                                                    </a>
                                                </c:if>--%>
                                        </h1>
                                        <p>${blogVersion.blogVerContent}</p>
                                    </c:forEach>
                                    <h1 style="text-align:center;">The End</h1>
                                </div>
                            </fieldset>
                        </div>

                        <%--博客简介面板--%>
                        <div id="introduction-panel" class="introduction-blog">
                            <form class="layui-form" action="" method="post">
                                <label class="field-wrap">
                                    <p style="margin-left:10px; font-size: 17px">修改博客简介</p>
                                </label>
                                <input type="hidden" id="blog-intro-id" name="blogIntroId"
                                       value="${aboutBlog.abBlogId}">
                                <div class="layui-form-item">
                                    <textarea name="update-intro" lay-verify="required" id="update-intro"
                                              class="layui-textarea" placeholder="请输入博客简介"
                                              style="width:380px;margin: 8px auto;">${aboutBlog.abBlogIntro}</textarea>
                                </div>
                                <div class="layui-form-item" style="margin-left: 10px">
                                    <input type="button" lay-submit="" lay-filter="submit-blog-intro"
                                           class="layui-btn layui-btn-self" value="修改">
                                    <input type="button" class="layui-btn layui-btn-self go-back" id="go-back"
                                           value="返回">
                                </div>
                            </form>
                        </div>

                        <%--博客版本信息面板--%>
                        <div id="version-panel" class="introduction-blog">
                            <form class="layui-form" action="" method="post">
                                <label class="field-wrap">
                                    <p style="margin-left:10px; font-size: 17px">版本信息</p>
                                </label>
                                <div class="layui-form-item">
                                    <textarea name="version-info" lay-verify="" id="version-info" class="layui-textarea"
                                              style="width:380px;margin: 8px auto;"></textarea>
                                </div>
                                <div class="layui-form-item" style="margin-left: 10px">
                                    <input type="button" lay-submit="" lay-filter="submit-version-info"
                                           class="layui-btn layui-btn-self" value="确定">
                                    <input type="button" class="layui-btn layui-btn-self" id="hidden-version-panel"
                                           value="返回">
                                </div>
                            </form>
                        </div>

                    </div><!--关于网站End-->
                    <div class="layui-tab-item">
                        <div class="aboutinfo">
                            <div class="aboutinfo-figure">
                                <img src="../static/images/qiubixiong.jpg" style="height: 120px" alt="学习使我快乐"/>
                            </div>
                            <p class="aboutinfo-nickname">学习使我快乐</p>
                            <p class="aboutinfo-introduce">目前是一名学生，软件工程，熟悉Java开发，略懂Web前端。对分布式，高并发感兴趣。</p>
                            <p class="aboutinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;江苏 - 南京</p>
                            <hr/>
                            <div class="aboutinfo-contact">
                                <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i
                                        class="fa fa-qq fa-2x"></i></a>
                                <a target="_blank" title="给我写信" href="javascript:layer.msg('跳转到邮箱')"><i
                                        class="fa fa-envelope fa-2x"></i></a>
                                <a target="_blank" title="新浪微博" href="javascript:layer.msg('跳转到微博主页')"><i
                                        class="fa fa-weibo fa-2x"></i></a>
                                <a target="_blank" title="码云" href="javascript:layer.msg('跳转到github主页')"><i
                                        class="fa fa-git fa-2x"></i></a>
                            </div>
                            <fieldset class="layui-elem-field layui-field-title">
                                <legend>简介
                                    <c:if test="${user.enable == 1}">
                                        <a id="modify-intro"><i class="fa fa-pencil fa-fw"></i></a>
                                    </c:if>
                                </legend>
                                <div class="layui-field-box aboutinfo-abstract abstract-bloger">
                                    <p style="text-align:center;">学习使我快乐，本站的作者，目前是一名学生。</p>
                                    <h1>个人信息</h1>
                                    <p>暂无</p>
                                    <h1>个人介绍</h1>
                                    <p>一个没有故事的男同学，没什么介绍......</p>
                                    <h1 style="text-align:center;">The End</h1>
                                </div>
                            </fieldset>
                        </div>
                    </div><!--关于作者End-->

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 底部 -->
<footer class="blog-footer">
    <p><span>Copyright</span><span>&copy;</span><span>2018</span><a href="http://www.blogsyxl.cn">学习使我快乐</a><span>Design By YXL</span>
    </p>
</footer>
<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item">
        <a href="../home.jsp"><i class="fa fa-home fa-fw"></i>&nbsp;网站首页</a>
    </li>
    <li class="layui-nav-item">
        <a href="article.jsp"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
    </li>
    <li class="layui-nav-item">
        <a href="resource.jsp"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
    </li>
    <li class="layui-nav-item layui-this">
        <a href="about.jsp"><i class="fa fa-info fa-fw"></i>&nbsp;关于本站</a>
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
<!-- 本页脚本 -->
<script src="../static/js/about.js"></script>
<!-- jQuery -->
<script src='../static/js/jquery/jquery.min.js'></script>
<script>
    $("#go-back").on("click", function () {
        $("#introduction-panel").hide();
    });

    $("#modify-intro").on("click", function () {
        $("#introduction-panel").show();
    });

    // $("#hidden-version-panel").on("click", function () {
    //     $("#version-panel").hide();
    // });
    //
    // $(".version-panel-id").on("click", function () {
    //     $("#version-panel").show();
    // });

    layui.use(['layer', 'jquery', 'form', 'layedit'], function () {
        var form = layui.form;
        var $ = layui.jquery;
        var layedit = layui.layedit;
        var layer = layui.layer;

        // 文本编辑器
        layedit.build('update-intro', {
            height: 100,
            tool: ['face', '|', 'strong', '|', 'italic', '|', 'underline', '|', 'link']
        });

        // 文本编辑器
        layedit.build('version-info', {
            height: 100,
            tool: ['face', '|', 'strong', '|', 'italic', '|', 'underline', '|', 'link']
        });

        //监听修改博客信息提交
        form.on('submit(submit-blog-intro)', function () {
            var content = $("#update-intro").val();
            var blogIntroId = $("#blog-intro-id").val();
            $("#introduction-panel").hide();
            $.ajax({
                method: 'post',
                url: '/submitBlogIntro',
                data: {'content': content, 'blogIntroId': blogIntroId},
                dataType: 'json',
                async: false,
                success: function (data) {
                    var message = data['message'];
                    if (message === "success") {
                        layer.msg("修改成功", {icon: 1});
                    } else {
                        layer.msg("修改失败", {icon: 5});
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>