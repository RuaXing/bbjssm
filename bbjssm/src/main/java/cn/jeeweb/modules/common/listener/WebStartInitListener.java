package cn.jeeweb.modules.common.listener;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import cn.jeeweb.core.utils.MessageUtils;
/**
 * http://blog.csdn.net/fcly2013/article/details/19984061 启动说明
 * http://blog.csdn.net/ma546659141/article/details/45958123 启动加载顺序
 * http://www.cnblogs.com/shijiaoyun/p/4933551.html 当前使用的
 * All rights Reserved, Designed By www.jeeweb.cn
 * @title:  WebStartInitListener.java   
 * @package cn.jeeweb.modules.common.listener   
 * @description:   程序启动完成打印一个日志
 * @author: 王存见   
 * @date:   2017年5月7日 下午2:35:48   
 * @version V1.0 
 * @copyright: 2017 www.jeeweb.cn Inc. All rights reserved. 
 *
 */
public class WebStartInitListener implements ApplicationListener<ContextRefreshedEvent> {

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		// 需要执行的逻辑代码，当spring容器初始化完成后就会执行该方法。
		printKeyLoadMessage();
	}
	
	/**
	 * 获取Key加载信息
	 */
	public boolean printKeyLoadMessage(){
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n======================================================================\r\n");
		sb.append("\r\n    欢迎使用 "+MessageUtils.getMessage("platform.name")+" "+MessageUtils.getMessage("platform.version")+"  - "+MessageUtils.getMessage("platform.copyright")+"  "+MessageUtils.getMessage("platform.website")+"\r\n");
		sb.append("\r\n======================================================================\r\n");
		System.out.println(sb.toString());
		return true;
	}
}