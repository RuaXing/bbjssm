<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>上传头像</title>
    <meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
	<meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">
	
    <html:css  name="favicon,bootstrap,font-awesome,animate,iCheck,Validform"/>
    <link href="${staticPath}/common/css/style.css?v=4.1.0" rel="stylesheet">
	<html:css name="bootstrap-fileinput" />
	<html:js  name="jquery,bootstrap"/>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>上传头像</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                         <form:form id="avatarForm" modelAttribute="data" action="${adminPath}/sys/user/avatar"  method="post" class="form-horizontal">
                            <form:hidden path="id" />
                            <form:fileinput showType="avatar" fileInputWidth="100px"  fileInputHeight="100px"  path="portrait"/>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-3" >
                                    <button class="btn btn-primary" type="submit">提交</button>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- 全局js -->
    <html:js  name="iCheck,Validform,bootstrap-fileinput"/>
	<!-- 自定义js -->
	<script src="${staticPath}/common/js/content.js?v=1.0.0"></script>
	<script type="text/javascript">
	        //初始化表单
			var validateForm;
			$(document).ready(function() {
			        validateForm = $("#avatarForm").Validform({
			        tiptype:3,
			        ajaxPost:true,
			        callback:function(result){
			        	$.Hidemsg();
						if(result.ret==0)
		              	{
		              	    top.layer.alert(result.msg, {icon: 0, title:'提示'});
		              	}else
		              	{
		              		top.layer.alert(result.msg, {icon: 0, title:'警告'});
		              	} 
					}
				});
			});
			//初始化checkbox样式
			$(document).ready(function() {
				$(".i-checks").iCheck({
			           checkboxClass: 'icheckbox_square-green',
			           radioClass: 'iradio_square-green',
			    });
			});
			
			 
	</script>

</body>

</html>