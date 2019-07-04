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
            <a href="${ctx}/home" title="">网站首页</a>
            <a><cite>后台管理</cite></a>
        </blockquote>
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <ul class="layui-tab-title" style="text-align: center">
                <li class="layui-this">文章管理</li>
                <li>用户管理</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <div class="blog-main">
                        <div>
                            <table class="layui-table" lay-filter="articleManage">
                                <thead>
                                <tr>
                                    <th style="text-align: center; font-weight: bold">ID</th>
                                    <th style="text-align: center; font-weight: bold; width: 25%;">标题</th>
                                    <th style="text-align: center; font-weight: bold">类别</th>
                                    <th style="text-align: center; font-weight: bold">公开</th>
                                    <th style="text-align: center; font-weight: bold">创建时间</th>
                                    <th style="text-align: center; font-weight: bold">浏览量</th>
                                    <th style="text-align: center; font-weight: bold">评论数</th>
                                    <th style="text-align: center; font-weight: bold">推荐</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="article" items="${articles}">
                                    <tr>
                                        <td>${article.aId}</td>
                                        <td>${article.title}</td>
                                        <td>${article.category}</td>
                                        <c:if test="${article.personal eq '0'}">
                                            <td>是</td>
                                        </c:if>
                                        <c:if test="${article.personal eq '1'}">
                                            <td>否</td>
                                        </c:if>
                                        <td><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td>${article.pageView}</td>
                                        <td>${article.commentNum}</td>
                                        <c:if test="${article.recommend eq '0'}">
                                            <td>否</td>
                                        </c:if>
                                        <c:if test="${article.recommend eq '1'}">
                                            <td>是</td>
                                        </c:if>
                                        <td><a class="layui-btn layui-btn-xs setRecommend">推荐</a></td>
                                        <td><a href="${ctx}/detail?aId=${article.aId}" class="layui-btn layui-btn-xs">查看</a></td>
                                        <td><a href="${ctx}/modify?aId=${article.aId}" class="layui-btn layui-btn-xs">编辑</a></td>
                                        <td><a class="layui-btn layui-btn-danger layui-btn-xs deleteArticle" id="delete" lay-event="del">删除</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <%--分页项--%>
                        <div class="layui-elem-field">
                            <div id="page-info-article" class="page-info">
                                <ul class="pager pager-loose">
                                    <c:if test="${pageInfo.pageNum <= 1}">
                                        <li><a href="javascript:void(0);">上一页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum > 1}">
                                        <li><a href="${ctx}/admin?pageNum=${pageInfo.pageNum-1}">上一页</a></li>
                                    </c:if>
                                    <c:forEach begin="${pageInfo.navigateFirstPage}" end="${pageInfo.navigateLastPage}" var="pn">
                                        <c:if test="${pageInfo.pageNum==pn}">
                                            <li><a href="javascript:void(0);" style="background: #1ab188;color: #ffffff;">${pn}</a></li>
                                        </c:if>
                                        <c:if test="${pageInfo.pageNum!=pn}">
                                            <li><a href="${ctx}/admin?pageNum=${pn}">${pn}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${pageInfo.pageNum>=pageInfo.pages}">
                                        <li><a href="javascript:void(0);">下一页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.pageNum<pageInfo.pages}">
                                        <li><a href="${ctx}/admin?pageNum=${pageInfo.pageNum+1}">下一页</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div> <%--end 文章管理--%>
                <div class="layui-tab-item">
                    <div class="blog-main">
                        <div>
                            <table class="layui-table" lay-filter="userManage">
                                <thead>
                                <tr>
                                    <th style="text-align: center; font-weight: bold">ID</th>
                                    <th style="text-align: center; font-weight: bold">email</th>
                                    <th style="text-align: center; font-weight: bold">电话</th>
                                    <th style="text-align: center; font-weight: bold">昵称</th>
                                    <th style="text-align: center; font-weight: bold">激活</th>
                                    <th style="text-align: center; font-weight: bold">权限</th>
                                    <th style="text-align: center; font-weight: bold; width: 20%">描述</th>
                                    <th style="text-align: center; font-weight: bold">地址</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${users}">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.email}</td>

                                        <c:if test="${user.phone eq null}">
                                            <td>null</td>
                                        </c:if>
                                        <c:if test="${user.phone != null}">
                                            <td>${user.phone}</td>
                                        </c:if>

                                        <c:if test="${user.nickName eq null}">
                                            <td>null</td>
                                        </c:if>
                                        <c:if test="${user.nickName != null}">
                                            <td>${user.nickName}</td>
                                        </c:if>

                                        <c:if test="${user.state eq '1'}">
                                            <td>已激活</td>
                                        </c:if>
                                        <c:if test="${user.state eq '0'}">
                                            <td>未激活</td>
                                        </c:if>

                                        <c:if test="${user.enable eq '1'}">
                                            <td>高权限</td>
                                        </c:if>
                                        <c:if test="${user.enable eq '0'}">
                                            <td>低权限</td>
                                        </c:if>

                                        <c:if test="${user.description eq null}">
                                            <td>null</td>
                                        </c:if>
                                        <c:if test="${user.description != null}">
                                            <td>${user.description}</td>
                                        </c:if>

                                        <c:if test="${user.address eq null}">
                                            <td>null</td>
                                        </c:if>
                                        <c:if test="${user.address != null}">
                                            <td>${user.address}</td>
                                        </c:if>
                                        <c:if test="${user.enable == 1}">
                                            <td><a style="background-color: grey" class="layui-btn layui-btn-xs setAdminPermission">设置权限</a></td>
                                            <td><a style="background-color: grey" class="layui-btn layui-btn-danger layui-btn-xs deleteAdmin">删除</a></td>
                                        </c:if>
                                        <c:if test="${user.enable != 1}">
                                            <td><a class="layui-btn layui-btn-xs setPermission">设置权限</a></td>
                                            <td><a class="layui-btn layui-btn-danger layui-btn-xs deleteUser">删除</a></td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <%--分页项--%>
                        <div class="layui-elem-field">
                            <div id="page-info-user" class="page-info">
                                <ul class="pager pager-loose">
                                    <c:if test="${pageInfoUser.pageNum <= 1}">
                                        <li><a href="javascript:void(0);">上一页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfoUser.pageNum > 1}">
                                        <li><a href="${ctx}/admin?pageNum=${pageInfoUser.pageNum-1}">上一页</a></li>
                                    </c:if>
                                    <c:forEach begin="${pageInfoUser.navigateFirstPage}" end="${pageInfoUser.navigateLastPage}" var="pn">
                                        <c:if test="${pageInfoUser.pageNum==pn}">
                                            <li><a href="javascript:void(0);" style="background: #1ab188;color: #ffffff;">${pn}</a></li>
                                        </c:if>
                                        <c:if test="${pageInfoUser.pageNum!=pn}">
                                            <li><a href="${ctx}/admin?pageNum=${pn}">${pn}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${pageInfoUser.pageNum>=pageInfoUser.pages}">
                                        <li><a href="javascript:void(0);">下一页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfoUser.pageNum<pageInfoUser.pages}">
                                        <li><a href="${ctx}/admin?pageNum=${pageInfoUser.pageNum+1}">下一页</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
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
<script>

    $(function () {
        layui.use('layer', function () {
            var layer = layui.layer;

            $(".deleteArticle").click(function () {
                var aId = $(this).parents('tr').find('td').eq(0).html();
                layer.confirm("删除后无法找回哦！<br> 确认删除吗?", function () {
                    layer.msg(aId);
                    $.ajax({
                        url: "/delete",
                        data: {'aId': aId},
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

            $(".setPermission").click(function () {
                var id = $(this).parents('tr').find('td').eq(0).html();
                layer.confirm("真的要修改该用户的权限吗？", function () {
                    $.ajax({
                        url: "/setPermission",
                        data: {'id': id},
                        dataType: 'json',
                        success: function (data) {
                            if (data.message === 'setHighPer') {
                                layer.msg("权限设置成功！<br> 已设置为低权限");
                                setTimeout(location.reload(), 3000);
                            } else if(data.message === 'setLowPer'){
                                layer.msg("权限设置成功！<br> 已设置为高权限");
                                setTimeout(location.reload(), 3000);
                            }
                        }
                    })
                })
            });

            $(".setRecommend").click(function () {
                var aId = $(this).parents('tr').find('td').eq(0).html();
                layer.confirm("真的要修改该文章的推荐吗？", function () {
                    $.ajax({
                        url: "/setRecommend",
                        data: {'aId': aId},
                        dataType: 'json',
                        success: function (data) {
                            if (data.message === 'isRecommend') {
                                layer.msg("文章推荐设置成功！<br> 已设置为推荐");
                                setTimeout(location.reload(), 3000);
                            } else if(data.message === 'notRecommend'){
                                layer.msg("文章推荐设置成功！<br> 已设置为不推荐");
                                setTimeout(location.reload(), 3000);
                            }
                        }
                    })
                })
            });

            $(".deleteUser").click(function () {
                var id = $(this).parents('tr').find('td').eq(0).html();
                layer.confirm("真的确定要删除该用户吗？", function () {
                    $.ajax({
                        url: "/deleteUser",
                        data: {'id': id},
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

            $(".setAdminPermission").click(function () {
                layer.msg("不可以设置管理员权限", {icon: 5});
            });

            $(".deleteAdmin").click(function () {
                layer.msg("不可以删除管理员", {icon: 5});
            });
        })
    });

    $(".layui-tab-title li").click(function(){
        var picTabNum = $(this).index();
        console.log("当前下标是："+picTabNum);
        sessionStorage.setItem("picTabNum",picTabNum);
    });
    $(function(){
        var getPicTabNum = sessionStorage.getItem("picTabNum");
        $(".layui-tab-title li").eq(getPicTabNum).addClass("layui-this").siblings().removeClass("layui-this");
        $(".layui-tab-content>div").eq(getPicTabNum).addClass("layui-show").siblings().removeClass("layui-show");
    })

</script>
</body>
</html>