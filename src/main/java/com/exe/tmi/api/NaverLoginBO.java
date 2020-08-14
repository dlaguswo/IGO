package com.exe.tmi.api;
import java.io.IOException;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
public class NaverLoginBO {

private final static String CLIENT_ID = "0oxsugDYqfYhm6shdIs1";
private final static String CLIENT_SECRET = "Xb4wRyLXE5";
private final static String REDIRECT_URI = "http://183.99.243.229/tmi/guest/main/callback";

private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

public OAuth2AccessToken getAccessToken(String code, String state) throws IOException{

OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET).callback(REDIRECT_URI).state(state).build(NaverLoginApi.instance());
	
OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
	return accessToken;
}

public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
OAuth20Service oauthService =new ServiceBuilder()
.apiKey(CLIENT_ID)
.apiSecret(CLIENT_SECRET)
.callback(REDIRECT_URI).build(NaverLoginApi.instance());
OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
oauthService.signRequest(oauthToken, request);
Response response = request.send();
return response.getBody();
}
}