package co.Donggle.CollaB.login.service;

import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class FacebookLoginBO {
	
	private final static String F_CLIENT_ID= "363829778707435";
  	private final static String F_CLIENT_SECRET= "b7d3a49b5c37d447d3141fe669139561";
  	private final static String F_REDIRECT_URI= "https://localhost/CollaB/facebookLogin.do";
  	
  	public String getAuthorizationUrl(){

        //로그인 버튼연결 주소 생성
    		String facebookUrl = "https://www.facebook.com/v2.8/dialog/oauth?"+
    				"client_id="+F_CLIENT_ID+
    				"&redirect_uri="+F_REDIRECT_URI+
    				"&scope=public_profile,email";

    		return facebookUrl;
    	}
  	
	public String requestFaceBooktAccesToken(HttpSession session, String code) throws Exception {

  		String facebookUrl = "https://graph.facebook.com/v2.8/oauth/access_token?"+
  						 	"client_id=" + F_CLIENT_ID +
  						 	"&redirect_uri=" + F_REDIRECT_URI +
  						 	"&client_secret=" + F_CLIENT_SECRET +
  						 	"&code="+code;

  		HttpClient client = HttpClientBuilder.create().build();
  		HttpGet getRequest = new HttpGet(facebookUrl);
  		String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
  	

  		JSONParser jsonParser = new JSONParser();
  		JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
  		String faceBookAccessToken = (String) jsonObject.get("access_token");
  	

//  		session.setAttribute("faceBookAccessToken", faceBookAccessToken);

  		return faceBookAccessToken;
  	}
	
	public String facebookUserDataLoadAndSave(String accessToken, HttpSession session) throws Exception {
  	    String facebookUrl = "https://graph.facebook.com/me?"+
  	            "access_token="+accessToken+
  	            "&fields=id,name,email,picture";

  	    HttpClient client = HttpClientBuilder.create().build();
  	    HttpGet getRequest = new HttpGet(facebookUrl);
  	    String rawJsonString = client.execute(getRequest, new BasicResponseHandler());
  	

  	    JSONParser jsonParser = new JSONParser();
  	    JSONObject jsonObject = (JSONObject) jsonParser.parse(rawJsonString);
  	  

  		
  	    return jsonObject.toString();
  	}
	
	
}
