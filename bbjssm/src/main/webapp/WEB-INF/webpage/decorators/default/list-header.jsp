<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
<meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">

<html:css  name="favicon,bootstrap,font-awesome,animate,iCheck,datepicker,jqgrid,sweetalert"/>

<!-- 由于使用了自定义标签，jquery必须在之前 -->
<!-- 全局js -->
<html:js  name="jquery,common"/>
<link href="${staticPath}/common/css/style.css?v=4.1.0" rel="stylesheet">