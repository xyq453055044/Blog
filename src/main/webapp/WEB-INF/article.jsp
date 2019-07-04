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
    <title>学习使我快乐 - 文章专栏</title>
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
            <li class="layui-nav-item layui-this">
                <a href="${ctx}/article"><i class="fa fa-file-text fa-fw"></i>&nbsp;文章专栏</a>
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
            <a><cite>文章专栏</cite></a>
        </blockquote>
        <div class="blog-main">
            <div class="blog-main-left">
                <c:forEach var="article" items="${articles}">
                    <div class="article shadow">
                        <div class="article-left">
                            <img src="../static/images/cover/201703181909057125.jpg"
                                 alt="基于laypage的layui扩展模块（pagesize.js）！"/>
                        </div>
                        <div class="article-right">
                            <div class="article-title">
                                <a href="${ctx}/detail?aId=${article.aId}">${article.title}</a>
                            </div>
                            <div class="article-abstract truncate">${article.content}</div>
                        </div>
                        <div class="clear"></div>
                        <div class="article-footer">
                            <span><i class="fa fa-clock-o"></i>&nbsp;&nbsp;
                                <fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </span>
                            <span class="article-author"><i class="fa fa-user"></i>&nbsp;&nbsp;${admin.name}</span>
                            <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a href="#">${article.category}</a></span>
                            <span class="article-viewinfo"><i class="fa fa-eye"></i>&nbsp;${article.commentNum}</span>
                            <span class="article-viewinfo"><i
                                    class="fa fa-commenting"></i>&nbsp;${article.pageView}</span>
                        </div>
                    </div>
                </c:forEach>
                <div class="layui-elem-field">
                    <div id="page-info" class="page-info">
                        <ul class="pager pager-loose">
                            <div>
                                <li class="total-page"><a href="javascript:void(0);">共&nbsp;${pageInfo.navigateLastPage}&nbsp;页</a></li>
                                <li>
                                    <div class="layui-form-item jump-page">
                                        <form action="${ctx}/article">
                                            <select name="pageNum" class="selectPageNum">
                                                <c:forEach begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" var="pn">
                                                    <c:if test="${pageNumber == pn}">
                                                        <option value ="${pn}" selected>${pn}</option>
                                                    </c:if>
                                                    <c:if test="${pageNumber != pn}">
                                                        <option value ="${pn}">${pn}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            <input type="submit" class="jump" value="跳转" style="cursor: pointer">
                                        </form>
                                    </div>
                                </li>
                                <c:if test="${pageInfo.pageNum <= 1}">
                                    <li><a href="javascript:void(0);">上一页</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum > 1}">
                                    <li><a href="${ctx}/article?pageNum=${pageInfo.pageNum-1}">上一页</a></li>
                                </c:if>

                                <c:if test="${pageInfo.pageNum>=pageInfo.pages}">
                                    <li><a href="javascript:void(0);">下一页</a></li>
                                </c:if>
                                <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                    <li><a href="${ctx}/article?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
                                </c:if>
                            </div>
                        </ul>
                    </div>
                </div>

            </div>
            <div class="blog-main-right">
                <div class="blog-search">
                    <form class="layui-form" action="${ctx}/home">
                        <div class="layui-form-item">
                            <div class="search-keywords shadow">
                                <input type="text" name="keyword" lay-verify="required|search" placeholder="输入关键词搜索文章"
                                       autocomplete="off" class="layui-input">
                            </div>
                            <div class="search-submit shadow">
                                <%--<a class="search-btn" lay-submit="" lay-filter="formSearch"><i class="fa fa-search"></i></a>--%>
                                <button class="layui-btn" lay-submit="" lay-filter="formSearch">搜索</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="article-category shadow">
                    <div class="article-category-title">分类导航</div>
                    <c:forEach var="category" items="${categories}">
                        <a href="${ctx}/article?category=${category.category}">${category.category}</a>
                    </c:forEach>
                    <div class="clear"></div>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">作者推荐</div>
                    <ul class="fa-ul blog-module-ul">
                        <c:forEach var="recommend" items="${recommends}">
                            <li>
                                <i class="fa-li fa fa-hand-o-right"></i>
                                <a href="${ctx}/detail?aId=${recommend.aId}">${recommend.title}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">随便看看</div>
                    <ul class="fa-ul blog-module-ul">
                        <c:forEach var="randomLook" items="${randomLooks}">
                            <li>
                                <i class="fa-li fa fa-hand-o-right"></i>
                                <a href="${ctx}/detail?aId=${randomLook.aId}">${randomLook.title}</a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!--右边悬浮 平板或手机设备显示-->
                <div class="category-toggle"><i class="fa fa-chevron-left"></i></div>
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
<!-- layui.js -->
<script src="../static/plug/layui/layui.js"></script>
<!-- 全局脚本 -->
<script src="../static/js/global.js"></script>
<script>
    layui.use(['form', 'layer', 'laypage'], function(){
        var laypage = layui.laypage;
        var layer = layui.layer;
        var form = layui.form;
        //监听提交
        form.on('submit(formSearch)', function(){
            console.log("搜索成功");
        });

        //调用分页
        laypage.render({
            elem: 'page-info',
            count: data.length,
            jump: function(obj){
                //模拟渲染
                document.getElementById('pager').innerHTML = function(){
                    var arr = [];
                    var thisData = data.concat().splice(obj.curr*obj.limit - obj.limit, obj.limit);
                    layui.each(thisData, function(index, item){
                        arr.push('<li>'+ item +'</li>');
                    });
                    return arr.join('');
                }();
            }
        });
    });
</script>
</body>
</html>