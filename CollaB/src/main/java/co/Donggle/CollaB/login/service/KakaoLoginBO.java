package co.Donggle.CollaB.login.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoLoginBO {
	private final static String KAKAO_AUTHOR_URL = "https://kauth.kakao.com/oauth/authorize?";
	private final static String K_CLIENT_ID = "3f1f202997e3b37e832aa0c1983ea15a";
	private final static String K_REDIRECT_URL = "http://localhost/CollaB/kakaologin.do";
	private final static String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	private final static String KAKAO_USERINFO_URL = "https://kapi.kakao.com/v2/user/me";
//	private final static String KAKAO_LOGOUT_URL = "https://kapi.kakao.com/v1/user/logout";
	private final static String KAKAO_LOGOUT_URL = "https://kauth.kakao.com/oauth/logout?";
	private final static String KAKAO_LOGOUT_REDIRECT_URL = "http://localhost/CollaB/kakaoLogout.do";


	public String getAuthorizationUrl() {
		
		String kakaoUrl = KAKAO_AUTHOR_URL +
				"client_id=" + K_CLIENT_ID +
				"&redirect_uri=" + K_REDIRECT_URL +
				"&response_type=code";
		
		return kakaoUrl;
	}
	
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";

		try {
			URL url = new URL(KAKAO_TOKEN_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code&client_id=3f1f202997e3b37e832aa0c1983ea15a"
					+ "&redirect_uri=http://localhost/CollaB/kakaologin.do" + "&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}
	
	public HashMap<String, Object> getUserInfo(String access_Token) {

		HashMap<String, Object> userInfo = new HashMap<>();
	
		try {
			URL url = new URL(KAKAO_USERINFO_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");

			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			userInfo.put("nickname", nickname);
			userInfo.put("profile_image", profile_image);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return userInfo;
	}
	
	
	public String kakaoLogout() {
		String kakaoLogoutUrl = KAKAO_LOGOUT_URL +
				"client_id=" + K_CLIENT_ID + 
				"&logout_redirect_uri=" + KAKAO_LOGOUT_REDIRECT_URL;
		
		return kakaoLogoutUrl;
		
	}
//public void kakaoLogout(String access_Token) {
//		
//		
//		try {
//			URL url = new URL(K_KAKAO_LOGOUT_URL);
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("POST");
//			conn.setRequestProperty("Authorization", "Bearer "+ access_Token);
//			
//			int responseCode = conn.getResponseCode();
//			System.out.println("responseCode : "+ responseCode);
//			
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			
//			 String result = "";
//		     String line = "";
//		        
//		     while((line = br.readLine())!= null) {
//		    	 result += line;
//		     }
//		     System.out.println(result);
//		}catch(IOException e) {
//			e.printStackTrace();
//		}
//	}
}
