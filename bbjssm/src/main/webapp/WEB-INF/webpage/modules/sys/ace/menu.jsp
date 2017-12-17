<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:forEach items="${menus}" var="menu">
     <c:if test="${menu.parentId == null && menu.isshow eq '1'}">
	<li class="">
	    <c:choose>
			   <c:when test="${empty menu.url}">  
				   <a href="#" class="dropdown-toggle">
						<i class="menu-icon fa ${menu.menuIcon}"></i>
						<span class="menu-text">
							${menu.name}
						</span>
						<b class="arrow fa fa-angle-down"></b>
				  </a> 
			   </c:when>
			   <c:otherwise> 
				  <a class="J_menuItem"  href="${adminPath}/${menu.url}">
							<i class="menu-icon fa ${menu.menuIcon}"></i>
							<span class="menu-text">${menu.name}</span>
				  </a>
			   </c:otherwise>
		</c:choose>
		<b class="arrow"></b>
        
		<ul class="submenu">
		     <c:forEach items="${menus}" var="secondMenu">
				  <c:if test="${secondMenu.parentId == menu.id && secondMenu.isshow eq '1'}">
					<li class="">
						 <c:choose>
							   <c:when test="${empty secondMenu.url}">  
								   <a href="#" class="dropdown-toggle">
										<i class="menu-icon fa ${secondMenu.menuIcon}"></i>
										<span class="menu-text">
											${secondMenu.name}
										</span>
										<b class="arrow fa fa-angle-down"></b>
								  </a> 
							   </c:when>
							   <c:otherwise> 
								  <a class="J_menuItem"  href="${adminPath}/${secondMenu.url}">
											<i class="menu-icon fa ${secondMenu.menuIcon}"></i>
											<span class="menu-text">${secondMenu.name}</span>
								  </a>
							   </c:otherwise>
						</c:choose>
						<b class="arrow"></b>
						<ul class="submenu">
							 <c:forEach items="${menus}" var="thirdMenu">
							     <c:if test="${thirdMenu.parentId == secondMenu.id && thirdMenu.isshow eq '1'}">
							     <li class="">
							         <c:choose>
										   <c:when test="${empty thirdMenu.url}">  
											   <a href="#" class="dropdown-toggle">
													<i class="menu-icon fa ${thirdMenu.menuIcon}"></i>
													<span class="menu-text">
														${thirdMenu.name}
													</span>
													<b class="arrow fa fa-angle-down"></b>
											  </a> 
										   </c:when>
										   <c:otherwise> 
											  <a class="J_menuItem"  href="${adminPath}/${thirdMenu.url}">
														<i class="menu-icon fa ${thirdMenu.menuIcon}"></i>
														<span class="menu-text">${thirdMenu.name}</span>
											  </a>
										   </c:otherwise>
									</c:choose>
									<b class="arrow"></b>
							     </li>
							     </c:if>
							 </c:forEach>
						</ul>
					</li>
			   </c:if>
			</c:forEach>
		</ul>
	</li>
   </c:if>
</c:forEach>