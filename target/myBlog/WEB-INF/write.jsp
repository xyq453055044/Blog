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
    <title>学习使我快乐 - 写博客</title>
    <link rel="shortcut icon" href="../static/images/Logo_40.png" type="image/x-icon">
    <!--Layui-->
    <link href="../static/plug/layui/css/layui.css" rel="stylesheet"/>
    <!--font-awesome-->
    <link href="../static/plug/font-awesome/css/font-awesome.min.css" rel="stylesheet"/>
    <!--全局样式表-->
    <link href="../static/css/global.css" rel="stylesheet"/>
    <!--本页样式表-->
    <link href="../static/css/timeline.css" rel="stylesheet"/>
    <!--分页样式表-->
    <link href="../static/css/pageInfo/page.css" rel="stylesheet">
    <style type="text/css">
        .w-e-text-container{
            height: 1000px !important;/*!important是重点，因为原div是行内样式设置的高度300px*/
        }
        .myEditor{
            height: 1040px;
            min-height:600px;
            width: 100%;
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
            <a><cite>写博客</cite></a>
        </blockquote>
        <div class="blog-main">
            <form class="layui-form layui-form-pane" action="${ctx}/doWrite">
                <input type="hidden" class="hiddenAId" value="${article.aId}">
                <div class="layui-form-item">
                    <label class="layui-form-label">文章标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" id="title" lay-verify="title" autocomplete="on"
                               placeholder="请输入标题"
                               class="layui-input" value="${article.title}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div id="myEditor"  lay-verify="editor" class="myEditor">${article.content}</div>
                    <textarea id="editor" name="editor" style="display: none"></textarea>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">文章类型</label>
                        <div class="layui-input-inline">
                            <select name="modules" id="modules" lay-verify="modules">
                                <option value="">请选择文章类型</option>
                                <c:forEach var="category" items="${categories}">
                                    <option value="${category.category}">${category.category}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span style="color: #2E8B57">或者</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="layui-inline">
                        <label class="layui-form-label">自定义类型</label>
                        <div class="layui-input-block">
                            <input type="text" name="category" id="category" lay-verify="category" autocomplete="off"
                                   placeholder="请输入文章类型"
                                   class="layui-input" value="${article.category}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">是否公开</label>
                    <div class="layui-input-block">
                        <input type="checkbox" checked="" name="open" id="open" lay-skin="switch" lay-text="ON|OFF">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" id="layerDemo">
                        <button class="layui-btn layui-btn-radius" data-method="notice" lay-submit lay-filter="submitBlog">发布博客</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="layui-btn layui-btn-radius" lay-submit lay-filter="saveDrift">保存为草稿</button>
                    </div>
                </div>
            </form>
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
    <li class="layui-nav-item">
        <a href="${ctx}/write"><i class="fa fa-pencil fa-fw"></i>&nbsp;写博客</a>
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
<%--本页脚本--%>
<script src="../static/js/write.js"></script>
<%--jQuery--%>
<script src="../static/js/jquery/jquery.min.js"></script>
<%--富文本编辑器--%>
<script src="../static/wangEditor/release/wangEditor.js"></script>
<script>
    var E = window.wangEditor;
    var editor = new E('#myEditor');
    // debug模式下，有 JS 错误会以throw Error方式提示出来
    editor.customConfig.debug = true;
    // 关闭粘贴样式的过滤
    editor.customConfig.pasteFilterStyle = false;
    // 插入网络图片的回调
    editor.customConfig.linkImgCallback = function(url) {
        console.log(url) // url 即插入图片的地址
    };
    editor.customConfig.zIndex = 100;

    var $content = $('#editor');
    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $content.val(html);
        console.log(html);
    };

    // 下面两个配置，使用其中一个即可显示“上传图片”的tab。但是两者不要同时使用！！！
    // editor.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
    // 上传图片到服务器
    editor.customConfig.uploadImgServer = '/upload';
    editor.customConfig.uploadFileName = 'fileName';
    // 将图片大小限制为 5M
    editor.customConfig.uploadImgMaxSize = 5 * 1024 * 1024;
    editor.customConfig.customAlert = function (info) {
        // info 是需要提示的内容
        $.alert.error(info);
    };
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            var url = result.data;
            insertImg(url);
        }
    };

    editor.create();

</script>
</body>
</html>