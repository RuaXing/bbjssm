<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="Thu, 19 Nov 1900 08:52:00 GMT">
    
    <title><spring:message code="sys.site.title" arguments="${platformName}"/></title>
    <meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
    <meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">
     
    <!--Loading bootstrap css-->
    <link type="text/css" rel="stylesheet" href="${staticPath}/vendors/jquery-ui-1.10.4.custom/css/ui-lightness/jquery-ui-1.10.4.custom.min.css">
    <html:css  name="favicon,bootstrap,font-awesome,animate,pace,Validform"/>

    <!--Loading style-->
    <link type="text/css" rel="stylesheet" href="${staticPath}/uadmin/css/themes/style1/orange-blue.css" class="default-style">
    <link type="text/css" rel="stylesheet" href="${staticPath}/uadmin/css/themes/style1/orange-blue.css" id="theme-change" class="style-change color-change">
    <link type="text/css" rel="stylesheet" href="${staticPath}/uadmin/css/style-responsive.css"> 
    
</head>

<body class=" ">
    <div>
        <!--BEGIN BACK TO TOP--><a id="totop" href="#"><i class="fa fa-angle-up"></i></a>
        <!--END BACK TO TOP-->
        <%@include file="../../../decorators/uadmin/topbar.jsp"%>
        <div id="wrapper">
            <%@include file="../../../decorators/uadmin/left.jsp"%>
            <!--BEGIN PAGE WRAPPER-->
            <div id="page-wrapper">
                <!--BEGIN TITLE & BREADCRUMB PAGE-->
                <div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
                    <div class="page-header pull-left">
                        <div class="page-title">控制台</div>
                    </div>
                    <ol class="breadcrumb page-breadcrumb pull-left">
                        <li><i class="fa fa-home"></i>&nbsp;<a href="${adminPath}">首页</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="hidden"><a href="#">控制台</a>&nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;&nbsp;</li>
                        <li class="active">控制台</li>
                    </ol>
                   
                    <div class="clearfix"></div>
                </div>
                <!--END TITLE & BREADCRUMB PAGE-->
                <!--BEGIN CONTENT-->
                <div class="page-content">
                     <%@include file="../../../decorators/uadmin/main.jsp"%>
			    </div>
			    <!--END CONTENT-->
    </div>
    <!--BEGIN FOOTER-->
    <div id="footer">
        <div class="copyright"><spring:message code="sys.site.bottom.copyright" /></div>
    </div>
    <!--END FOOTER-->
    <!--END PAGE WRAPPER-->
    </div>
    </div>
    <html:js  name="jquery,bootstrap,metisMenu,slimscroll,layer,pace,bootstrap-hover-dropdown,jquery-cookie,Validform"/>
    <script src="${staticPath}/uadmin/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${staticPath}/uadmin/js/jquery-ui.js"></script>
    <!--loading bootstrap js-->
    <script src="${staticPath}/uadmin/js/html5shiv.js"></script>
    <script src="${staticPath}/uadmin/js/respond.min.js"></script>
    <script src="${staticPath}/uadmin/js/jquery.menu.js"></script>
    <script src="${staticPath}/vendors/slimscroll/jquery.slimscroll.js"></script>
    <!--CORE JAVASCRIPT-->
    <script src="${staticPath}/uadmin/js/main.js"></script>
    <script>
		$(document).ready(function(){
			var list_theme = $('.dropdown-theme-setting > li > select#list_theme');
		    list_theme.on('change', function(){
		    	var theme=$(this).val();
		    	$.get('${adminPath}/theme/'+theme+'?url='+window.top.location.href,function(result){   
		    		//window.location.reload();
		    		window.top.location.href="${adminPath}";
		    	});
		    	//$.get('${adminPath}/theme/'+theme+'?url='+window.top.location.href,function(result){   window.location.reload();});
		    });
		});
		
		var changePasswordForm;
		function changePassword(){
			changePasswordForm.ajaxPost();
		}
		$(document).ready(function() {
			    changePasswordForm=$("#changePasswordForm").Validform({
				tiptype:function(msg,o,cssctl){
					if(!o.obj.is("form")){
						var objtip=o.obj.siblings(".Validform_checktip");
						cssctl(objtip,o.type);
						objtip.text(msg);
					}
				},beforeSubmit:function(curform){
					try{
						var beforeFunc=beforeSubmit;
						if(beforeFunc&&typeof(beforeFunc)=="function"){
							return beforeFunc(curform); 
						}
					}catch(err){
						
					}
					return true;	
				},callback:function(result){
					if(result.ret==0)
	              	{
	              	    top.layer.alert(result.msg, {icon: 0, title:'提示'});
	              	    //运行回调
	          	        callFunc();
	              	}else
	              	{
	              		top.layer.alert(result.msg, {icon: 0, title:'警告'});
	              	}
				}
			});
		});
	</script>
</body>

</html>