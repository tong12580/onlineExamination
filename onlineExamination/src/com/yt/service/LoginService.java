package com.yt.service;

public interface LoginService {
	
	String login(String studentid,String password);

	String power(String studentid, String password);
	
	String sex(String studentid, String password);
}
