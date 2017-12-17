<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="sys.datasource.title" /></title>
  <meta name="decorator" content="list"/>
</head>
<body title="<spring:message code="sys.datasource.title" />">
<grid:grid id="datasourceGridId" url="${adminPath}/sys/datasource/ajaxList">
	<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
	<grid:column label="sys.common.opt"  name="opt" formatter="button" width="100"/>
	<grid:button groupname="opt" function="delete"/>
    <grid:column label="数据库关键字"  name="dbKey"  query="true"  />
    <grid:column label="数据库类型"  name="dbType"  dict="dbtype" query="true"  queryMode="select"  />
    <grid:column label="驱动类"  name="driverClass"  />
    <grid:column label="数据源地址"  name="url"  />
    <grid:column label="数据库名称"  name="dbName"  />
    <grid:column label="数据库用户名"  name="dbUser"  />
    <grid:column label="数据库密码"  name="dbPassword"  />

	<grid:toolbar  function="create"/>
	<grid:toolbar  function="update" />
	<grid:toolbar  function="delete" />
	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset" />
</grid:grid>
</body>
</html>