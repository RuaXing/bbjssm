<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="decorator" content="single"/>
    <title>短信配置</title>
    <html:css  name="iCheck,Validform"/>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-6">
	                <div class="portlet box  portlet-grey">
	                     <div class="portlet-header">
	                        <div class="caption">云通讯配置<a href="http://www.yuntongxun.com/" target="_blank">http://www.yuntongxun.com/</a></div>
	                        <div class="tools">
		                        <i class="fa fa-chevron-up"></i>
		                        <i class="fa fa-refresh"></i><i class="fa fa-times"></i>
		                     </div>
	                    </div>
	                    <div class="portlet-body">
	                         <form:form id="cloudSmsForm" modelAttribute="cloudSms" action="${adminPath}/sys/setting/cloudsms" method="post" class="form-horizontal">
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>服务器：</label>
	                                <div class="col-sm-8">
	                                	<form:input path="serverip" class="form-control"  datatype="*"   htmlEscape="false" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>端口：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="serverport" class="form-control" defaultvalue="25"   datatype="*"    htmlEscape="false" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>主帐号：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="accountsid"   defaultvalue=""   datatype="*"  htmlEscape="false" cssClass="form-control" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>主帐号令牌：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="accounttoken"    defaultvalue=""   datatype="*"  htmlEscape="false" cssClass="form-control" />
	                                </div>
	                            </div>
	  							<div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>应用ID：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="appid"   datatype="*"  htmlEscape="false" cssClass="form-control" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>测试联系电话：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="testphone"  nested="false" htmlEscape="false" cssClass="form-control" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>测试模板ID：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="testtemplateId"  nested="false" htmlEscape="false" cssClass="form-control" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>测试数据参数：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="testdata"  nested="false" htmlEscape="false" cssClass="form-control" />
	                                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 多个参数以英文都好隔开如："test,test"</span>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group">
	                                <div class="col-sm-4 col-sm-offset-3" >
	                                    <input class="btn btn-primary"  type="button" onclick="saveSmsSet();" value="提交" />
	                                    <input  class="btn btn-warning" style="dispaly:none;" type="button" onclick="testSms();" value="测试" />
	                                </div>
	                            </div>
	                        </form:form>
	                    </div>
	                </div>
                </div>
                <div class="col-sm-6">
	                <div class="portlet box  portlet-grey">
	                     <div class="portlet-header">
	                        <div class="caption">互亿无线 <a href="http://www.ihuyi.com/" target="_blank">http://www.ihuyi.com/</a></div>
	                         <div class="tools">
		                        <i class="fa fa-chevron-up"></i>
		                        <i class="fa fa-refresh"></i><i class="fa fa-times"></i>
		                     </div>
	                    </div>
	                    <div class="portlet-body">
	                         <form:form id="hySmsForm" modelAttribute="hySms" action="${adminPath}/sys/setting/hysms" method="post" class="form-horizontal">
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>APIID：</label>
	                                <div class="col-sm-8">
	                                	<form:input path="apiid" class="form-control"  datatype="*"   htmlEscape="false" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label"><font color="red">*</font>APIKEY：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="apikey" class="form-control" defaultvalue="25"   datatype="*"    htmlEscape="false" />
	                                </div>
	                            </div>
	                             <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label">测试电话：</label>
	                                <div class="col-sm-8">
	                                    <form:input path="testphone" nested="false"   htmlEscape="false" cssClass="form-control" />
	                                </div>
	                            </div>
	                            <div class="form-group col-sm-12">
	                                <label class="col-sm-4 control-label">测试文本：</label>
	                                <div class="col-sm-8">
	                                    <form:textarea path="testcontent"  cssClass="form-control" nested="false" rows="3" cols="30" />
	                                </div>
	                            </div>
	                            
	                            <div class="form-group">
	                                <div class="col-sm-4 col-sm-offset-3" >
	                                    <input  class="btn  btn-primary" style="dispaly:none;" type="button" onclick="saveHySms();" value="提交" />
	                                    <input  class="btn  btn-warning" style="dispaly:none;" type="button" onclick="testHySms();" value="测试" />
	                                </div>
	                            </div>
	                        </form:form>
	                    </div>
	                </div>
                </div>
            </div>
        </div>

    </div>


    <!-- 全局js -->
    <html:js  name="iCheck,Validform"/>

	<!-- 自定义js -->
	<script src="${staticPath}/common/js/content.js?v=1.0.0"></script>
			
	<script type="text/javascript">
	        //初始化表单
			var validateForm;
			$(document).ready(function() {
			        validateForm = $("#cloudSmsForm").Validform({
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
			
			function saveSmsSet(){
				$("#cloudSmsForm").attr("action", "${adminPath}/sys/setting/cloudsms");
				validateForm.ajaxPost();
				return false;
			}
			
			function testSms(){
				$("#cloudSmsForm").attr("action", "${adminPath}/sys/setting/testCloudSms");
				validateForm.ajaxPost();
				return false;
			}
			
			   //初始化表单
			var validateHyForm;
			$(document).ready(function() {
				validateHyForm = $("#hySmsForm").Validform({
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
			
			function saveHySms(){
				$("#hySmsForm").attr("action", "${adminPath}/sys/setting/hysms");
				validateHyForm.ajaxPost();
				return false;
			}
			
			function testHySms(){
				$("#hySmsForm").attr("action", "${adminPath}/sys/setting/testHySms");
				validateHyForm.ajaxPost();
				return false;
			}
	</script>

</body>

</html>
