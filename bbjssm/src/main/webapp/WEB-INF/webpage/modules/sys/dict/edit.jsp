<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="sys.dict.edittitle" /></title>
    <meta name="decorator" content="form"/> 
    
</head>

<body class="white-bg"  formid="dictForm">
    <form:form id="dictForm" modelAttribute="data"  method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		        <tr>
		         <td  class="width-15 active text-right">	
		              <label><font color="red">*</font>字典标签:</label>
		         </td>
		         <td class="width-35" >
		             <form:input path="label" class="form-control " datatype="*" nullmsg="请输入字典标签名称！" htmlEscape="false" />
		             <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	<label><font color="red">*</font>字典值编码:</label></td>
		         <td  class="width-35" >
		             <form:input path="value" class="form-control"  htmlEscape="false"  datatype="*" errormsg="字典值必须为英文" nullmsg="请输入字典值编码！"/>
		             <label class="Validform_checktip"></label>
		         </td>
		      </tr>
		      <tr>
		         <td  class="width-15 active text-right">	
		              <label><font color="red">*</font>排序:</label>
		         </td>
		         <td class="width-35" >
		             <form:input path="sort" class="form-control " datatype="n" nullmsg="请输入排序值！" errormsg="请输入数字" htmlEscape="false" />
		             <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	<label><font color="red">*</font>备注:</label></td>
		         <td class="width-35" colspan="3" ><form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control "/></td>
		      </tr>
		   </tbody>
		</table>   
	</form:form>
</body>
</html>