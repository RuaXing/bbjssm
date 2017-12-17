/**
 * Copyright (c) 2005-2012 https://github.com/zhangkaitao
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 */
package cn.jeeweb.modules.sys.security.shiro.web.filter.sync;

import org.apache.shiro.web.filter.PathMatchingFilter;

import cn.jeeweb.modules.sys.security.shiro.ShiroConstants;
import cn.jeeweb.modules.sys.security.shiro.session.mgt.OnlineSession;
import cn.jeeweb.modules.sys.security.shiro.session.mgt.eis.OnlineSessionDAO;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 
 * All rights Reserved, Designed By www.jeeweb.cn
 * 
 * @title: SyncOnlineSessionFilter.java
 * @package cn.jeeweb.modules.sys.security.shiro.web.filter.sync
 * @description: 同步当前会话数据到数据库
 * @author: 王存见
 * @date: 2017年6月26日 下午5:54:52
 * @version V1.0
 * @copyright: 2017 www.jeeweb.cn Inc. All rights reserved.
 *
 */
public class SyncOnlineSessionFilter extends PathMatchingFilter {

	private OnlineSessionDAO onlineSessionDAO;

	public void setOnlineSessionDAO(OnlineSessionDAO onlineSessionDAO) {
		this.onlineSessionDAO = onlineSessionDAO;
	}

	/**
	 * 同步会话数据到DB 一次请求最多同步一次 防止过多处理 需要放到Shiro过滤器之前
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		OnlineSession session = (OnlineSession) request.getAttribute(ShiroConstants.ONLINE_SESSION);
		// 如果session stop了 也不同步
		if (session != null && session.getStopTimestamp() == null) {
			onlineSessionDAO.syncToDb(session);
		}
		return true;
	}

}
