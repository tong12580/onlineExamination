package com.yt.action;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthenticationInterceptor extends AbstractInterceptor {

	/**
	 * 自定义权限拦截器
	 * 继承自拦截器类
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//通过invocation获取本次调用的上下文
		Map<String,Object> sessionValues =invocation.getInvocationContext().getSession();
		String account =(String) sessionValues.get("username");
		if(account==null){
			return Action.LOGIN;
		}
		return invocation.invoke();
	}

}
