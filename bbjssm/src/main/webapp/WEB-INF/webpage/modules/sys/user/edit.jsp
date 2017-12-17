<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="sys.user.updateuser" /></title>
    <meta name="decorator" content="form"/> 
    <html:component name="bootstrap-fileinput" />
</head>
<body class="white-bg"  formid="userForm">
<form:form id="userForm" modelAttribute="data" method="post" class="form-horizontal">
  <form:hidden path="id" />
  <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
    <tbody>
      <tr>
        <td class="width-15 active text-right">
          <label>用户名:</label></td>
        <td class="width-35">${data.username}</td>
        <td class="width-15 active text-right">
          <label>
            <font color="red">*</font>姓名:</label></td>
        <td class="width-35">
          <form:input path="realname" class="form-control " datatype="*" nullmsg="请输入姓名！" htmlEscape="false" />
          <label class="Validform_checktip"></label>
        </td>
      </tr>
      <tr>
        <td class="width-15 active text-right">
          <label>
            <font color="red">*</font>邮箱:</label></td>
        <td class="width-35">
          <form:input path="email" class="form-control" datatype="e" nullmsg="请输入姓名！" htmlEscape="false" />
          <label class="Validform_checktip"></label>
        </td>
        <td class="width-15 active text-right">
          <label>
            <font color="red">*</font>联系电话:</label></td>
        <td class="width-35">
          <form:input path="phone" class="form-control" htmlEscape="false" datatype="m" nullmsg="请输入用户名！" />
          <label class="Validform_checktip"></label>
        </td>
      </tr>
      <tr>
        <td class="active">
          <label class="pull-right">
            <font color="red">*</font>用户角色:</label></td>
        <td colspan="3">
          <form:checkboxes path="roleIdList" nested="false" items="${allRoles}" defaultvalue="${roleIdList}" itemLabel="name" itemValue="id" htmlEscape="false" cssClass="i-checks required" /></td>
      </tr>
      <tr>
        <td class="width-15 active">
          <label class="pull-right">组织机构:</label></td>
        <td colspan="3">
          <form:treeselect title="请选择组织机构" path="organizationIds" nested="false" dataUrl="${adminPath}/sys/organization/treeData"  chkboxType="" labelName="parentname" labelValue="${organizationNames}" multiselect="true" /></td>
      </tr>
    </tbody>
  </table>
</form:form>
</body>
</html>