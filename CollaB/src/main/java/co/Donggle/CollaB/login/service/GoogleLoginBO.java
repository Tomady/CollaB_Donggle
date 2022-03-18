package co.Donggle.CollaB.login.service;

import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;


import org.springframework.stereotype.Service;

import lombok.Getter;
import lombok.Setter;

@Service
@Getter
@Setter
public class GoogleLoginBO {
	
	private String googleAuthUrl = "https://oauth2.googleapis.com";
	private String googleLoginUrl = "https://accounts.google.com";
	private String googleRedirectUrl = "http://3.38.225.18:8080/CollaB/googlelogin.do";
	private String googleClientId = "28495026940-9nijn232vdbdkku31d3f62pv5hbmo4ga.apps.googleusercontent.com";
	private String googleSecret = "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";
	private String scopes = "profile,email,openid";
	
	
	

    public String googleInitUrl() {
        Map<String, Object> params = new HashMap<>();
        params.put("client_id", getGoogleClientId());
        params.put("redirect_uri", getGoogleRedirectUrl());
        params.put("response_type", "code");
        params.put("scope", getScopeUrl());

        String paramStr = params.entrySet().stream()
                .map(param -> param.getKey() + "=" + param.getValue())
                .collect(Collectors.joining("&"));

        return getGoogleLoginUrl()
                + "/o/oauth2/v2/auth"
                + "?"
                + paramStr;
    }



	private String getScopeUrl() {
		// TODO Auto-generated method stub
		   return scopes.replaceAll(",", "%20");
	}
}
