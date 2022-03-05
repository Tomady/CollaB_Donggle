package co.Donggle.CollaB.login.service;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class GoogleLoginResponse {
	private String accessToken; 
	private String expiresIn; 
	private String refreshToken; 
	private String scope;
	private String tokenType; 
	private String idToken;
}
