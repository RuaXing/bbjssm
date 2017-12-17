<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="sys.role.edittitle" /></title>
    <meta name="decorator" content="form"/> 
    
</head>

<body class="white-bg"  formid="roleForm">
    <form:form id="roleForm" modelAttribute="data"  method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		       <tr>
		         <td  class="width-15 active text-right">	
		              <label><font color="red">*</font>角色名称:</label>
		         </td>
		         <td class="width-35" >
		             <form:input path="name" class="form-control " datatype="*" nullmsg="请输入角色名称！" htmlEscape="false" />
		             <label class="Validform_checktip"></label>
		         </td>
		         <td  class="width-15 active text-right">	
		          	<label><font color="red">*</font>角色编码:</label>
		         </td>
		         <td  class="width-35" >
		             <form:input path="code" class="form-control"  htmlEscape="false"  datatype="*"  nullmsg="请输入角色编码！"/>
		             <label class="Validform_checktip"></label>
		         </td>
		      </tr>
		      <tr>
				<td class="active">
				   <label class="pull-right"><font color="red">*</font>是否系统数据:</label>
				</td>
				<td>
				     <form:radiobuttons path="isSys"   dict="sf" defaultvalue="0"  htmlEscape="false" cssClass="i-checks required" />
				</td>
				<td class="active">
				   <label class="pull-right"><font color="red">*</font>是否可用:</label>
				</td>
				<td>
				     <form:radiobuttons path="usable"   dict="sf" defaultvalue="1"  htmlEscape="false" cssClass="i-checks required" />
				</td>
			  </tr>
			  <tr>
		         <td  class="width-15 active text-right">	
		              <label>备注:</label>
		         </td>
		         <td class="width-35" colspan="3" >
		              <form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control "/>
		         </td>
		      </tr>
		   </tbody>
		</table>   
	</form:form>
</body>
</html>