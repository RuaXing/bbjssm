<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><spring:message code="sys.site.title" arguments="${platformName}"/></title>
    <meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
    <meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">
    
    <link rel="shortcut icon" href="${staticPath}/common/favicon.ico">
    <html:css  name="bootstrap,font-awesome,animate,iCheck,toastr,bootstrapvalidator"/>
    <link href="${staticPath}/common/css/style.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
        <div class="col-lg-12">
            <div>
                <div class="logo-name">${platformName}</div>
            </div>
            <h3>欢迎使用 ${platformName}</h3>
           <form  id="loginform"  method="post" class="form-horizontal login-form" action=""  
                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                <div class="form-group ">
                	<div class="col-lg-12">
                        <input name="username" class="form-control" placeholder="<spring:message code="sys.login.username.placeholder"/>" required="">
                    </div>
                </div>
                <div class="form-group">
            	    <div class="col-lg-12">
                    	<input name="password" class="form-control" placeholder="<spring:message code="sys.login.password.placeholder"/>" required="">
                    </div>
                </div>
                <c:if test="${showCaptcha eq 1}">
                <div class="form-group">
               	   <div class="col-lg-6">
                     <input   name="jcaptchaCode" class="form-control" placeholder="<spring:message code="sys.login.captcha.placeholder"/>" required="">
                   </div>
                   <div class="col-lg-6">
                     <img id="img_jcaptcha"  src="${appPath}/jcaptcha.jpg" width="100" height="35" onclick="changeJcaptchaSrc();" />
                    </div>   
                </div>
                </c:if>
                
                
                <div class="form-group" >
                    <div class="col-lg-5">
                            <label><input id="rememberMe"  type="checkbox" name="rememberMe" value="1" class="i-checks"><spring:message code="sys.login.rememberMe"/></label>
                    </div>
 
                 </div>
                 <button type="submit" class="btn btn-primary block full-width m-b"><spring:message code="sys.login.submit.label"/></button>
                 <p class="text-muted text-center"><span>默认账号密码:<b>admin/123456</span></b></p>
                 
            </form>
        </div>
    </div>

    <!-- 全局js -->
    <html:js  name="jquery,bootstrap,iCheck,toastr,bootstrapvalidator"/>
    
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
        function changeJcaptchaSrc(){  
            document.getElementById("img_jcaptcha").src='${appPath}/jcaptcha.jpg?_='+(new Date()).getTime();  
        }  
    </script>
    <script type="text/javascript">
		$(document).ready(function() {
		     $("#loginform").bootstrapValidator();
		     var error="${error}";
		     if (error!="")
		     {
		    	 showToast(error,"error");
		     }
		});
		
		function showToast(msg,shortCutFunction)
		 {
			 toastr.options = {
					  "closeButton": true,
					  "debug": false,
					  "progressBar": true,
					  "positionClass": "toast-bottom-right",
					  "onclick": null,
					  "showDuration": "400",
					  "hideDuration": "1000",
					  "timeOut": "7000",
					  "extendedTimeOut": "1000",
					  "showEasing": "swing",
					  "hideEasing": "linear",
					  "showMethod": "fadeIn",
					  "hideMethod": "fadeOut"
			}
			toastr[shortCutFunction](msg,"提示");
		 }
	</script>
    

 

</body>

</html>