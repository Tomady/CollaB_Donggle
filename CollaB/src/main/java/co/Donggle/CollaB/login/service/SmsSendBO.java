package co.Donggle.CollaB.login.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class SmsSendBO {
	
	private final static String api_key = "NCSAP8IUJUIAMGSO";
	private final static String api_secret = "SUHHM4TKAYXA2HEM09DQKFB8ZLVUD385";
	private final static String toNumb = "010-9518-5177"; 

	public String smsSend(String tel, int randomnum) {
		String text = "CollaB입니다. 본인확인 인증번호("+ randomnum + ")입력시 정상 처리 됩니다.\n3분 이내에 입력해 주세요.";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		  HashMap<String, String> set = new HashMap<String, String>();
		    set.put("to", toNumb); 

		    set.put("from", tel); 
		    set.put("text", text); 
		    set.put("type", "sms"); 

		    
		    JSONObject result = coolsms.send(set); 

		    if ((boolean)result.get("status") == true) {
		      
		    	return "Yes";
		    } else {
		     
		    	return "No";
		    }

		 
	}
	
	
}
