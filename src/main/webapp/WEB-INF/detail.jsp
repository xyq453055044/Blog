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
    <title>学习使我快乐 - 文章阅读</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet"/>
    <!-- 比较好用的代码着色插件 -->
    <link href="../static/css/prettify.css" rel="stylesheet"/>
    <!-- 本页样式表 -->
    <link href="../static/css/detail.css" rel="stylesheet"/>
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
            <li class="layui-nav-item  layui-this">
                <a href="article"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
            </li>
            <li class="layui-nav-item">
                <a href="${ctx}/resource"><i class="fa fa-tags fa-fw"></i>&nbsp;资源分享</a>
            </li>
            <li class="layui-nav-item">
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
                    <a href="javascript:;" style="color:#F0FFFF">${user.name}</a>
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
            <a href="${ctx}/article" title="文章专栏">文章专栏</a>
            <a><cite>${article.title}</cite></a>
        </blockquote>
        <div class="blog-main">
            <div class="layui-tab-content">
                <!-- 文章内容（使用Kingeditor富文本编辑器发表的） -->
                <div class="article-detail shadow">
                    <div class="article-detail-title">${article.title}</div>
                    <div class="article-detail-info">
                        <span>编辑时间：<fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                        <span>作者：${admin.name}</span>
                        <span>浏览量：${article.pageView}</span>
                    </div>
                    <div class="article-detail-content">${article.content}</div>
                </div>
                <!-- 评论区域 -->
                <div class="blog-module shadow" style="box-shadow: 0 1px 8px #a6a6a6;">
                    <fieldset class="layui-elem-field layui-field-title" style="margin-bottom:0">
                        <legend>来说两句吧</legend>
                        <div class="layui-field-box">
                            <form class="layui-form blog-editor" action="">
                                <input type="hidden" id="aId" name="aId" value="${article.aId}">
                                <input type="hidden" id="id" name="id" value="${user.id}">
                                <div class="layui-form-item">
                                    <textarea name="content" lay-verify="content" id="remarkEditor"
                                              placeholder="请输入内容" class="layui-textarea layui-hide"></textarea>
                                </div>
                                <div class="layui-form-item">
                                    <button class="layui-btn" lay-submit="formRemark" lay-filter="formRemark">提交评论
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="blog-module-title">最新评论</div>
                        <ul class="blog-comment">
                            <c:forEach var="comment" items="${comments}">
                                <li>
                                    <div class="comment-parent" id="comment-parent">
                                        <img src="../static/images/Logo_40.png" alt=""/>
                                        <c:set var="commentMap" value="${commentMaps.get(comment.byId)}"/>
                                        <div class="info">
                                            <span class="username">${commentMap}</span>
                                        </div>
                                        <div class="content">${comment.content}</div>
                                        <p class="info info-footer">
                                        <span class="time">
                                            <fmt:formatDate value="${comment.createTime}"
                                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </span>
                                            <a class="btn-reply" href="javascript:;"
                                               onclick="btnReplyClick(this)">回复</a>
                                        </p>
                                    </div>
                                    <hr/>
                                    <c:forEach var="allChildComments" items="${allChildComments}">
                                        <c:if test="${allChildComments.key == comment.cId}">
                                            <c:forEach var="childComment" items="${allChildComments.value}">
                                                <div class="comment-child">
                                                    <img src="../static/images/Absolutely.jpg" alt="Absolutely"/>
                                                    <div class="info">
                                                        <c:forEach var="user" items="${users}">
                                                            <c:if test="${user.id == childComment.byId}">
                                                                <span class="username">${user.name}</span>
                                                            </c:if>
                                                        </c:forEach>
                                                        <span>${childComment.content}</span>
                                                    </div>
                                                    <p class="info">
                                                    <span class="time">
                                                        <fmt:formatDate value="${childComment.createTime}"
                                                                        pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </span>
                                                    </p>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>
                                    <!-- 回复表单默认隐藏 -->
                                    <div class="replycontainer layui-hide">
                                        <form class="layui-form" action="">
                                            <input type="hidden" id="articleId" name="articleId" value="${article.aId}">
                                            <input type="hidden" id="cId" name="cId" value="${comment.cId}">
                                            <input type="hidden" id="byId" name="byId" value="${user.id}">
                                            <div class="layui-form-item">
                                        <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容"
                                                  class="layui-textarea" style="min-height:80px;"></textarea>
                                            </div>
                                            <div class="layui-form-item">
                                                <button class="layui-btn layui-btn-mini" lay-submit="formReply"
                                                        lay-filter="formReply">提交
                                                </button>
                                            </div>
                                        </form>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </fieldset>
                </div>
            </div>

            <div class="clear"></div>
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
<script src='../static/js/jquery/jquery.min.js'></script>
<!-- layui.js -->
<script src="../static/plug/layui/layui.js"></script>
<!-- 自定义全局脚本 -->
<script src="../static/js/global.js"></script>
<!-- 比较好用的代码着色插件 -->
<script src="../static/js/prettify.js"></script>
<!-- 本页脚本 -->
<script src="../static/js/detail.js"></script>

<script>

</script>
</body>
</html>