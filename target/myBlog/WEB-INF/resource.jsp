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
    <title>学习使我快乐 - 资源分享</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet"/>
    <!-- 本页样式表 -->
    <link href="../static/css/resource.css" rel="stylesheet"/>

    <style>
        .addResPanel {
            position: absolute;
            left: 50%;
            top: 25%;
            display: none;
            width: 300px;
            background-color: #FFE4C4;
            padding: 10px;
            margin-left: -150px;
        }
    </style>
</head>
<body class="layui-layout-body">
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
            <li class="layui-nav-item layui-this">
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
            <c:if test="${user.enable eq '1'}">
                <li class="layui-nav-itemed" style="float: right;margin-top: 20px"  id="addRes">
                    <a style="cursor: pointer"><i class="fa fa-book fa-fw"></i>&nbsp;添加资源</a>
                </li>
            </c:if>
        </ul>
        <!-- 手机和平板的导航开关 -->
        <a class="blog-navicon" href="javascript:;">
            <i class="fa fa-navicon"></i>
        </a>
    </div>
</nav>
<!-- 主体（一般只改变这里的内容） -->
<div class="blog-body layui-layout layui-layout-admin">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                    <c:forEach var="resourceParent" items="${resourceParents}">
                        <li class="layui-nav-item layui-nav-itemed">
                            <a class="" style="cursor: pointer">${resourceParent.parentName}</a>
                            <c:forEach var="secondLevel" items="${secondLevels}">
                                <c:if test="${secondLevel.fkParentId eq resourceParent.parentId}">
                                    <dl class="layui-nav-child">
                                        <dd>
                                            <a href="${ctx}/resource?name=${secondLevel.childName}">${secondLevel.childName}</a>
                                        </dd>
                                    </dl>
                                </c:if>
                            </c:forEach>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>

        <div class="layui-body addResource" style="margin-left: 10px">
            <!-- 内容主体区域 -->
            <c:forEach var="resourceChild" items="${resourceChildren}">
                <div class="resource shadow" style="margin-top: 10px">
                    <h1 class="resource-title">
                        <a>${resourceChild.childName}</a>
                    </h1>
                    <p class="resource-abstract">${resourceChild.introduction}<br>密码：${resourceChild.pass}</p>
                    <div class="resource-info">
                        <span class="create-time">
                            <i class="fa fa-clock-o fa-fw"></i>
                            <fmt:formatDate pattern="yyyy-MM-dd" value="${resourceChild.createTime}"/>
                        </span>
                        <div class="clear"></div>
                    </div>
                    <div class="resource-footer">
                        <div style="display: none;" id="child-res-id">${resourceChild.childId}</div>
                        <c:if test="${user.enable eq '1'}">
                            <a class="layui-btn removeRes" id="removeRes" style="cursor: pointer;" title="删除">
                                <i class="fa fa-times fa-fw download"></i>删除
                            </a>
                        </c:if>
                        <a class="layui-btn" href="${resourceChild.url}" title="${resourceChild.url}" target="_blank">
                            <i class="fa fa-download fa-fw download"></i>下载
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="layui-footer res-footer" style="background-color: #393D49">
            <!-- 底部固定区域 -->
            <p>
                <span>Copyright</span><span>&copy;</span><span>2018</span><a href="http://www.blogsyxl.cn">学习使我快乐</a><span>Design By YXL</span>
            </p>
        </div>

        <div id="addResPanel" class="addResPanel" style="z-index: 999">
            <form class="layui-form" action="" method="post">
                <label class="field-wrap">
                    <p style="margin-left:10px; font-size: 17px">添加资源</p>
                </label>
                <input type="text" name="resFirstLevel" id="resFirstLevel" lay-verify="required" autofocus
                       placeholder="请输入资源一级类别" autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
                <input type="text" name="resSecondLevel" id="resSecondLevel" lay-verify="required"
                       placeholder="请输入资源二级类别" autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
                <input type="text" name="resUrl" id="resUrl" lay-verify="required"
                       placeholder="请输入资源链接" autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
                <input type="text" name="resPass" id="resPass" lay-verify=""
                       placeholder="请出入资源密码" autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
                <input type="text" name="resIntro" id="resIntro" lay-verify="required"
                       placeholder="请出入资源描述" autocomplete="off" class="layui-input" style="width:280px;margin: 8px auto">
                <div class="layui-form-item" style="margin-left: 10px">
                    <input type="button" lay-submit="" lay-filter="submit" class="layui-btn" value="添加">
                    <input type="button" class="layui-btn" id="go_back" value="返回">
                </div>
            </form>
        </div>
    </div>
</div>

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
<!--jQuery-->
<script src='../static/js/jquery/jquery.min.js'></script>
<!-- layui.js -->
<script src="../static/plug/layui/layui.js"></script>
<!-- 全局脚本 -->
<script src="../static/js/global.js"></script>

<script>
    $("#go_back").on("click", function () {
        $("#addResPanel").hide();
    });

    $("#addRes").on("click", function () {
        $("#addResPanel").show();
    });

    layui.use(['form', 'layer'], function () {
        var form = layui.form;
        var layer = layui.layer;
        //监听提交
        form.on('submit(submit)', function () {
            var resFirstLevel = $("#resFirstLevel").val();
            var resSecondLevel = $("#resSecondLevel").val();
            var resUrl = $("#resUrl").val();
            var resPass = $("#resPass").val();
            var resIntro = $("#resIntro").val();
            console.log("resFirstLevel = "+resFirstLevel+" resSecondLevel = "+resSecondLevel+" resUrl = "
                +resUrl+" resPass = "+resPass+" resIntro = "+resIntro);
            $("#addResPanel").hide();
            $.ajax({
                url: "/addResource",
                data: {"resFirstLevel": resFirstLevel,"resSecondLevel": resSecondLevel, "resUrl": resUrl, "resPass": resPass, "resIntro": resIntro},
                dataType: "json",
                async: false,
                success: function () {
                    layer.msg("添加成功", {icon: 1});
                    location.reload();
                }
            });
            return false;
        });

        $(".removeRes").click(function () {
            var childResId = $(this).parent('div').find("#child-res-id").html();
            layer.confirm("真的删除资源吗?", function () {
                $.ajax({
                    method: "post",
                    url: "/removeRes",
                    data: {'childResId': childResId},
                    dataType: 'json',
                    success: function () {
                        layer.msg("删除成功");
                        location.reload();
                    }
                })
            })
        });
    });
</script>
</body>
</html>