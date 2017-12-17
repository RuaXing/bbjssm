<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title><spring:message code="sys.site.title" arguments="${platformName}"/></title>
    <meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
    <meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">
    <html:css  name="favicon,bootstrap,font-awesome,animate"/>
    <link href="${staticPath}/common/css/style.css" rel="stylesheet">  
    
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <%@include file="../inspinia/left.jsp"%>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                       <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                       <div class="navbar-form-custom">
                           <div  class="logotext">
                              <spring:message code="sys.site.title" arguments="${platformName}"/>
                           </div>
                       </div>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i> <span class="label label-warning">${oaNotificationCount}</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">
                         		<c:forEach items="${oaNotifications}" var="oaNotification">
                                <li>
                                    <div class="dropdown-messages-box">
                                        <a href="#" class="pull-left">
                                            <img alt="image" class="img-circle" src="${appPath}/${oaNotification.createBy.portrait}">
                                        </a>
                                        <div class="media-body ">
                                            <strong>${oaNotification.createBy.realname}</strong>${fn:substring(oaNotification.content, 0, 50)}
                                            <br>
                                            <small class="text-muted"><fmt:formatDate value="${oaNotification.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
                                        </div>
                                    </div>
                                </li>
                                <li class="divider"></li>
                                </c:forEach>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="${adminPath}/oa/oanotification">
                                            <i class="fa fa-envelope"></i> <strong> 查看所有通知</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i> 主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="${adminPath}/main">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a></li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
                    </ul>
                </div>
                <a href="${adminPath}/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${adminPath}/main" frameborder="0" data-id="${adminPath}/main" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right"><spring:message code="sys.site.bottom.copyright" />
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">
                <ul class="nav nav-tabs navs-2">
                    <li class="active">
                        <a data-toggle="tab" href="#tab-1"><i class="fa fa-gear"></i>主题</a>
                    </li>
                    <li class="">
                    	<a data-toggle="tab" href="#tab-2">通知</a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定宽度</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
			                         <a href="#" class="s-skin-0">默认皮肤 </a>
			                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
			                        <a href="#" class="s-skin-1">蓝色主题</a>
			                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
			                        <a href="#" class="s-skin-3">黄色/紫色主题</a>
			                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 最新通知</h3>
                            <small><i class="fa fa-tim"></i>您当前有${oaNotificationCount}条通知</small>
                        </div>
                        <div>
                        	<c:forEach items="${oaNotifications}" var="oaNotification">
                            <div class="sidebar-message">
                                <a href="#">
                                    <div class="pull-left text-center">
                                        <img alt="image" class="img-circle message-avatar" src="${appPath}/${oaNotification.createBy.portrait}">
                                    </div>
                                    <div class="media-body">
                                        ${fn:substring(oaNotification.content, 0, 50)}
                                        <br>
                                        <small class="text-muted"><fmt:formatDate value="${oaNotification.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
                                    </div>
                                </a>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </div>
       
    </div>

 	<!-- 全局js -->
	<html:js  name="jquery,bootstrap,metisMenu,slimscroll,layer,pace"/>
	<!-- 自定义js -->
	<script src="${staticPath}/inspinia/js/inspinia.js"></script>
	<script type="text/javascript" src="${staticPath}/common/js/contabs.js"></script>
	
</body>

</html>