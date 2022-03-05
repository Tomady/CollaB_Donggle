package co.Donggle.CollaB.login.service;

import java.util.Properties;

import java.util.HashMap;

import org.json.simple.JSONObject;


public class Coolsms extends Https {
	final String URL = "https://api.coolsms.co.kr";
	private String sms_url = URL + "/sms/1.5/";
	private String senderid_url = URL + "/senderid/1.1/";
	private String api_key;
	private String api_secret;	
	private String timestamp;
	private Https https = new Https();
	Properties properties = System.getProperties();

	
	public Coolsms(String api_key, String api_secret) {
		this.api_key = api_key;
		this.api_secret = api_secret;
	}
	

	public JSONObject send(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
		
			params = setBasicInfo(params);
			params.put("os_platform", properties.getProperty("os_name"));
			params.put("dev_lang", "JAVA " + properties.getProperty("java.version"));
			params.put("sdk_version", "JAVA SDK 1.1");

			// Send message 
			response = https.postRequest(sms_url + "send", params);	
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}
	

	public JSONObject sent(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
			// 기본정보 입력
			params = setBasicInfo(params);
			
			response = https.request(sms_url + "sent", params); // GET방식 전송	
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}


	public JSONObject cancel(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
		
			params = setBasicInfo(params);
			
			response = https.postRequest(sms_url + "cancel", params);	

			if (response.get("message") == "response is empty") {
				response.put("status", true);
				response.put("message", null);
			}
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}

	public JSONObject balance() {
		JSONObject response = new JSONObject();
		try {
		
			HashMap<String, String> params = new HashMap<String, String>();
			params = setBasicInfo(params);

				
			response = https.request(sms_url + "balance", params);
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}


	public JSONObject register(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
		
			params = setBasicInfo(params);
			
	
			response = https.postRequest(senderid_url + "register", params);	
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}


	public JSONObject verify(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
		
			params = setBasicInfo(params);
			
	
			response = https.postRequest(senderid_url + "verify", params);	
			if (response.get("message") == "response is empty") {
				response.put("status", true);
				response.put("message", null);
			}
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}


	public JSONObject delete(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
		
			params = setBasicInfo(params);
	
			response = https.postRequest(senderid_url + "delete", params);	
			if (response.get("message") == "response is empty") {
				response.put("status", true);
				response.put("message", null);
			}
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}


	public JSONObject setDefault(HashMap<String, String> params) {
		JSONObject response = new JSONObject();
		try {
			
			params = setBasicInfo(params);
			
			response = https.postRequest(senderid_url + "set_default", params);	
			if (response.get("message") == "response is empty") {
				response.put("status", true);
				response.put("message", null);
			}
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}


	public JSONObject list() {
		JSONObject response = new JSONObject();
		try {
		
			HashMap<String, String> params = new HashMap<String, String>();
			params = setBasicInfo(params);

			response = https.request(senderid_url + "list", params);	
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}

	public JSONObject getDefault() {
		JSONObject response = new JSONObject();
		try {
			HashMap<String, String> params = new HashMap<String, String>();
			params = setBasicInfo(params);
			response = https.request(senderid_url + "get_default", params);	
		} catch (Exception e) {
			response.put("status", false);
			response.put("message", e.toString());
		}
		return response;
	}

	private HashMap<String, String> setBasicInfo(HashMap<String, String> params) {
		params.put("api_secret", this.api_secret);
		params.put("api_key", this.api_key);
		return params;
	}
}
