<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
<meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">

<html:css  name="favicon,bootstrap,font-awesome,animate,sweetalert,iCheck,Validform"/>

<!--Loading style-->
<link type="text/css" rel="stylesheet" href="${staticPath}/uadmin/css/themes/style1/orange-blue.css" class="default-style">
<link type="text/css" rel="stylesheet" href="${staticPath}/uadmin/css/themes/style1/orange-blue.css" id="theme-change" class="style-change color-change">
<link type="text/css" rel="stylesheet" href="${staticPath}/uadmin/css/style-responsive.css">
<!-- 全局js -->
<html:js  name="jquery,bootstrap,laydate,common"/>
<style>
  .width-15{
		width:15%;
	}
	
	.width-35{
		width:35%
	}
	
	.width-50{
		
		width:50%
	}
  .white-bg {
	    background-color: #ffffff;
  }
  .table > thead > tr > th,
	.table > tbody > tr > th,
	.table > tfoot > tr > th,
	.table > thead > tr > td,
	.table > tbody > tr > td,
	.table > tfoot > tr > td {
	    vertical-align: middle;
	}
	.page-content {
	    padding: 10px 10px 10px 10px;
	    min-height: auto;
	    clear: both;
	}
</style>
