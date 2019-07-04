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
    <title>学习使我快乐 - 个人博客网站</title>
    <link rel="shortcut icon" href="static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="static/plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="static/css/global.css" rel="stylesheet"/>
    <!-- 本页样式表 -->
    <link href="static/css/home.css" rel="stylesheet"/>
    <%--分页样式表--%>
    <link href="static/css/pageInfo/page.css" rel="stylesheet">
    <style>
        .friendLinkPanel {
            position: absolute;
            left: 50%;
            bottom: -60%;
            display: none;
            width: 300px;
            background-color: #FFE4C4;
            padding: 10px;
            margin-left: -150px;
        }

        .layui-btn {
            width: 30%;
            margin-top: 8px;
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
            <li class="layui-nav-item layui-this">
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
            <c:if test="${user.enable eq '1'}">
                <li class="layui-nav-item">
                    <a href="${ctx}/write"><i class="fa fa-pencil fa-fw"></i>&nbsp;写博客</a>
                </li>
            </c:if>
            <li class="layui-nav-item" lay-unselect="">
                <c:if test="${empty user}">
                    <a href="login.jsp" style="color:#F0FFFF">登录</a>
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
    <!-- canvas -->
    <canvas id="canvas-banner" style="background: #393D49;"></canvas>
    <!--为了及时效果需要立即设置canvas宽高，否则就在home.js中设置-->
    <script type="text/javascript">
        var canvas = document.getElementById('canvas-banner');
        canvas.width = window.document.body.clientWidth - 10;//减去滚动条的宽度
        if (screen.width >= 992) {
            canvas.height = window.innerHeight * 1 / 3;
        } else {
            canvas.height = window.innerHeight * 2 / 7;
        }
    </script>
    <!-- 这个一般才是真正的主体内容 -->
    <div class="blog-container">
        <div class="blog-main">
            <!-- 网站公告提示 -->
            <div class="home-tips shadow">
                <i style="float:left;line-height:17px;" class="fa fa-volume-up"></i>
                <div class="home-tips-container">
                    <span style="color: #009688">博主的邮箱地址：2062882581@qq.com ,有什么问题可以发邮件给博主哦！</span>
                    <span style="color: red">网站有什么问题，欢迎大家及时通知博主：2062882581@qq.com</span>
                </div>
            </div>
            <!--左边文章列表-->
            <div class="blog-main-left">
                <c:if test="${articles.size() > 0}">
                    <c:forEach var="article" items="${articles}" varStatus="i">
                        <c:if test="${article.personal == '0'}">
                            <div class="article shadow">
                                <div class="article-left">
                                    <img src="static/images/cover/201703181909057125.jpg"
                                         alt="文章图片"/>
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
                                    <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a
                                            href="#">${article.category}</a></span>
                                    <span class="article-viewinfo"><i
                                            class="fa fa-commenting"></i>&nbsp;${article.commentNum}</span>
                                    <span class="article-viewinfo"><i
                                            class="fa fa-eye"></i>&nbsp;${article.pageView}</span>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>

                <c:if test="${articlesByCreateTime.size() > 0}">
                    <c:forEach var="article" items="${articlesByCreateTime}" varStatus="i">
                        <c:if test="${article.personal == '0'}">
                            <div class="article shadow">
                                <div class="article-left">
                                    <img src="static/images/cover/201703181909057125.jpg"
                                         alt="文章图片"/>
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
                                    <span><i class="fa fa-tag"></i>&nbsp;&nbsp;<a
                                            href="#">${article.category}</a></span>
                                    <span class="article-viewinfo"><i
                                            class="fa fa-commenting"></i>&nbsp;${article.commentNum}</span>
                                    <span class="article-viewinfo"><i
                                            class="fa fa-eye"></i>&nbsp;${article.pageView}</span>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:if>

                <div class="layui-elem-field">
                    <c:if test="${pageInfo != null}">
                        <div id="page-info" class="page-info">
                            <ul class="pager pager-loose">
                                <div>
                                    <li class="total-page"><a href="javascript:void(0);">共&nbsp;${pageInfo.navigateLastPage}&nbsp;页</a></li>
                                    <li>
                                        <div class="layui-form-item jump-page">
                                            <form action="${ctx}/home">
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
                                        <li><a href="${ctx}/home?pageNum=${pageInfo.pageNum-1}">上一页</a></li>
                                    </c:if>

                                    <c:if test="${pageInfo.pageNum>=pageInfo.pages}">
                                        <li><a href="javascript:void(0);">下一页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                        <li><a href="${ctx}/home?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
                                    </c:if>
                                </div>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
            <!--右边小栏目-->
            <div class="blog-main-right">
                <div class="blogerinfo shadow">
                    <div class="blogerinfo-figure">
                        <img src="static/images/Absolutely.jpg" alt="Absolutely"/>
                    </div>
                    <p class="blogerinfo-nickname">${admin.name}</p>
                    <p class="blogerinfo-introduce">${admin.description}</p>
                    <p class="blogerinfo-location"><i class="fa fa-location-arrow"></i>&nbsp;${admin.address}</p>
                    <hr/>
                    <div class="blogerinfo-contact">
                        <a target="_blank" title="QQ交流" href="javascript:layer.msg('启动QQ会话窗口')"><i
                                class="fa fa-qq fa-2x"></i></a>
                        <a target="_blank" title="给我写信" href="javascript:layer.msg('启动邮我窗口')"><i
                                class="fa fa-envelope fa-2x"></i></a>
                        <a target="_blank" title="新浪微博" href="javascript:layer.msg('转到你的微博主页')"><i
                                class="fa fa-weibo fa-2x"></i></a>
                        <a target="_blank" title="码云" href="javascript:layer.msg('转到你的github主页')"><i
                                class="fa fa-git fa-2x"></i></a>
                    </div>
                </div>
                <div></div><!--占位-->
                <div class="blog-module shadow">
                    <div class="blog-module-title">热文排行</div>
                    <ul class="fa-ul blog-module-ul">
                        <c:forEach var="article" items="${articlesByPageView}" begin="0" end="4">
                            <li style="margin-bottom: 5px">
                                <i class="fa-li fa fa-hand-o-right"></i>
                                <a href="${ctx}/detail?aId=${article.aId}">${article.title}</a>
                                <span style="color: #009688">(${article.pageView})</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">文章分类</div>
                    <ul class="fa-ul blog-module-ul">
                        <c:forEach var="category" items="${categories}">
                            <li style="margin-bottom: 5px">
                                <i class="fa-li fa fa-hand-o-right"></i>
                                <a href="${ctx}/article?category=${category.category}">${category.category}</a>
                                <span style="color: #009688">(${category.count} 篇)</span>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="blog-module shadow">
                    <div class="blog-module-title">一路走来</div>
                    <dl class="footprint">
                        <c:forEach var="yearAndMonth" items="${yearAndMonths}">
                            <li style="margin-bottom: 5px">
                                <a href="${ctx}/home?time=${yearAndMonth.yearAndMonth}">${yearAndMonth.yearAndMonth}</a>
                                <span style="font-weight: bold;color: #009688;">(${yearAndMonth.count}&nbsp;篇)</span>
                            </li>
                        </c:forEach>
                    </dl>
                </div>
                <div class="blog-module shadow">
                    <div class="blog-module-title">友情链接
                        <c:if test="${user.enable == '1'}">
                            <a id="friendLink" style="cursor: pointer"><i class="fa fa-pencil fa-fw"></i></a>
                        </c:if>
                    </div>
                    <ul class="fa-ul blog-module-ul friend-link">
                        <c:forEach var="link" items="${links}">
                            <li style="margin-top: 5px">
                                <i class="fa-li fa fa-hand-o-right"></i>
                                <a target="_blank" href="${link.linkUrl}" title="${link.linkUrl}">${link.linkContent}</a>
                                <c:if test="${user.enable == '1'}">
                                    <div class="layui-inline" style="float: right">
                                        <div class="findLinkId" style="display: none">${link.linkId}</div>
                                        <a class="deleteFriendLink"><i class="fa fa-trash fa-fw"></i></a>
                                    </div>
                                </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div id="friendLinkPanel" class="friendLinkPanel">
        <form class="layui-form" action="" method="post">
            <label class="field-wrap">
                <p style="margin-left:10px; font-size: 17px">添加链接</p>
            </label>
            <input type="text" name="linkUrl" id="linkUrl" lay-verify="required"
                   placeholder="http://..." autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
            <input type="text" name="linkContent" id="linkContent" lay-verify="required"
                   placeholder="请出入链接名" autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
            <div class="layui-form-item" style="margin-left: 10px">
                <input type="button" lay-submit="" lay-filter="submit" class="layui-btn" value="添加">
                <input type="button" class="layui-btn" id="goBack" value="返回">
            </div>
        </form>
    </div>
</div>
</div>
<!-- 底部 -->
<footer class="blog-footer">
    <p><span>Copyright</span><span>&copy;</span><span>2018</span><a href="http://www.blogsyxl.cn">学习使我快乐</a><span>Design By YXL</span></p>
    <%--<p><a href="http://www.miibeian.gov.cn/" target="_blank">蜀ICP备16029915号-1</a></p>--%>
</footer>
<!--侧边导航-->
<ul class="layui-nav layui-nav-tree layui-nav-side blog-nav-left layui-hide" lay-filter="nav">
    <li class="layui-nav-item layui-this">
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
<script src='./static/js/jquery/jquery.min.js'></script>
<!-- layui.js -->
<script src="static/plug/layui/layui.js"></script>
<!-- 全局脚本 -->
<script src="static/js/global.js"></script>
<!-- 本页脚本 -->
<script src="static/js/home.js"></script>

<script>
    $("#goBack").on("click", function () {
        $("#friendLinkPanel").hide();
    });

    $("#friendLink").on("click", function () {
        $("#friendLinkPanel").show();
    });

    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;
        //监听提交
        form.on('submit(submit)', function () {
            var linkContent = $("#linkContent").val();
            var linkUrl = $("#linkUrl").val();
            $("#friendLinkPanel").hide();
            $.ajax({
                url: "/friendLink",
                data: {"linkContent": linkContent, "linkUrl": linkUrl},
                dataType: "json",
                async: false,
                success: function () {
                    var html = '<li style="margin-top: 5px"> <i class="fa-li fa fa-hand-o-right"></i> <a target="_blank" href="' + linkUrl + '" title="Layui">' + linkContent + '</a></li>';
                    $(".friend-link").append(html);
                    layer.msg("添加成功", {icon: 1});
                }
            });
            return false;
        });

        $(".deleteFriendLink").click(function () {
            var linkId = $(this).parent('div').find(".findLinkId").html();
            console.log("linkId = " + linkId);
            layer.confirm("真的删除该友情链接吗?", function () {
                $.ajax({
                    method: "post",
                    url: "/removeFriendLink",
                    data: {'linkId': linkId},
                    dataType: 'json',
                    success: function (data) {
                        if (data.message === 'success') {
                            location.reload();
                        } else {
                            layer.msg("删除失败");
                        }
                    }
                })
            })
        });
    });

</script>
</body>
</html>
