package co.Donggle.CollaB.login.service;

import java.io.*;
import java.net.URL;
import java.net.URLEncoder;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.HttpsURLConnection;
import java.util.Random;
import java.util.HashMap;
import java.util.Map.Entry;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;


public class Https
{

	public JSONObject postRequest(String url_string, HashMap<String, String> params) {
		JSONObject obj = new JSONObject();
		try {
			obj.put("status", false);

			String salt = salt();
			String timestamp = getTimestamp();
			String signature = getSignature(params.get("api_secret"), salt, timestamp); 
			String boundary = salt + timestamp;
			String delimiter = "\r\n--" + boundary + "\r\n";

			params.put("salt", salt);
			params.put("signature", signature);
			params.put("timestamp", timestamp);

			StringBuffer postDataBuilder = new StringBuffer();
			postDataBuilder.append(delimiter);
			
			String image = null;
			String image_path = null;
			for (Entry<String, String> entry : params.entrySet()) {
				String key = entry.getKey();
				String value = entry.getValue();
				
				if (key == "image") {
					image = value;
					continue;
				}				
				if (key == "image_path") {
					image_path = value;
					continue;
				}				
				postDataBuilder = setPostData(postDataBuilder, key, value, delimiter);
				if(postDataBuilder == null) {
					obj.put("message", "postRequest data build fail");
				   	return obj;
				}
			}
			
			URL url = new URL(url_string);
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection(); // connect
			connection.setDoInput(true);
			connection.setDoOutput(true);
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Connection", "Keep-Alive");
			connection.setRequestProperty("Content-Type", "multipart/form-data;boundary=" + boundary);
			connection.setUseCaches(false);
			DataOutputStream outputStream = new DataOutputStream(new BufferedOutputStream(connection.getOutputStream()));

			
			if(image != null) {
			
				if(image_path == null) image_path = "./";
				
		
				postDataBuilder.append(setFile("image", image));				
				postDataBuilder.append("\r\n");
				FileInputStream fileStream = new FileInputStream(image_path + image);
				outputStream.writeUTF(postDataBuilder.toString());
				
			
				int maxBufferSize = 1024;
				int bufferSize = Math.min(fileStream.available(), maxBufferSize);
				byte[] buffer = new byte[bufferSize];
		
				int byteRead = fileStream.read(buffer, 0, bufferSize);
		
				while (byteRead > 0) {
					outputStream.write(buffer);
					bufferSize = Math.min(fileStream.available(), maxBufferSize);
					byteRead = fileStream.read(buffer, 0, bufferSize);
				}
				fileStream.close();
			} else {
				outputStream.writeUTF(postDataBuilder.toString());
			}
			outputStream.writeBytes(delimiter); 
			outputStream.flush();
			outputStream.close();

			String response = null;
			String inputLine; 
			int response_code = connection.getResponseCode();
			BufferedReader in = null;
		
			if (response_code != 200) {
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			}

			while ((inputLine = in.readLine()) != null) {					
				response = inputLine;
			}

			if (response != null) {
				obj = (JSONObject) JSONValue.parse(response);
				obj.put("status", true);
				if (obj.get("code") != null) {
					obj.put("status", false);
				}
			} else {
				obj.put("status", false);
				obj.put("message", "response is empty");
			}
		} catch (Exception e) {
			obj.put("status", false);
			obj.put("message", e.toString());
		}
		return obj;
	}


	public JSONObject request(String url_string, HashMap<String, String> params) {
		JSONObject obj = new JSONObject();
		try {
			obj.put("status", true);
			String charset = "UTF8";
			String salt = salt();
			String timestamp = getTimestamp();
			String signature = getSignature(params.get("api_secret"), salt, timestamp); // getSignature

			String data = url_string + "?";
			data = data + URLEncoder.encode("api_key", charset) + "=" + URLEncoder.encode(params.get("api_key"), charset);
			data = setGetData(data, "signature", signature, charset);
			data = setGetData(data, "salt", salt, charset);
			data = setGetData(data, "timestamp", timestamp, charset);

			params.remove("api_secret");

			for (Entry<String, String> entry : params.entrySet()) {
				String key = entry.getKey();
				String value = entry.getValue();
				data = setGetData(data, key, value, charset);
				if(data == null) {
					obj.put("status", false);
					obj.put("message", "request data build fail");
				   	return obj;
				}
			}

			URL url = new URL(data);
			HttpsURLConnection connection = (HttpsURLConnection) url.openConnection(); // connect
			connection.setRequestMethod("GET");
			
			BufferedReader in = null;
			int response_code = connection.getResponseCode();
			if (response_code != 200) {
		
				in = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
			} else {
				in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			}

			String response = null;
			String inputLine; 
			while ((inputLine = in.readLine()) != null) {
				response = inputLine;
			}

			if (response != null) {
			
				try {
					obj = (JSONObject) JSONValue.parse(response);
				} catch (Exception e) {
					try {
						JSONArray reponse_array = (JSONArray) JSONValue.parse(response);
						obj.put("data", reponse_array);
					} catch (Exception ex) {
						obj.put("status", false);
					}
				}
				obj.put("status", true);
				if (obj.get("code") != null) {
					obj.put("status", false);
				}
			} else {
				obj.put("status", false);
				obj.put("message", "response is empty");
			}
		} catch (Exception e) {
			obj.put("status", false);
			obj.put("message", e.toString());
		}
		return obj;
	}

	public String setFile(String key, String fileName) {
		return "Content-Disposition: form-data; name=\"" + key
				+ "\";filename=\"" + fileName
				+ "\"\r\nContent-type: image/jpeg;\r\n";
	}

	
	public StringBuffer setPostData(StringBuffer builder, String key, String value, String delimiter) {
		try {
			builder.append(setValue(key, value));
			builder.append(delimiter);
		} catch(Exception e) {
			return null;
		}

		return builder;
	}

	
	public String setGetData(String data, String key, String value, String charSet) {
		try {
			data += "&"
				+ URLEncoder.encode(key, charSet)
				+ "="
				+ URLEncoder.encode(value, charSet);
		} catch(Exception e) {
			return null;
		}

		return data;
	}

	
	public String salt() {
		String uniqId = "";
		Random randomGenerator = new Random();

	
		for (int length = 1; length <= 10; ++length) {
			int randomInt = randomGenerator.nextInt(10); 
			uniqId += randomInt + "";
		}

		return uniqId;
	}

	
	public String getSignature(String api_secret, String salt, String timestamp) {
		String signature = "";
		
		try {
			String temp = timestamp + salt;
			SecretKeySpec keySpec = new SecretKeySpec(api_secret.getBytes(), "HmacMD5");
			Mac mac = Mac.getInstance("HmacMD5");
			mac.init(keySpec);

			byte[] result = mac.doFinal(temp.getBytes());
			char[] hexArray = "0123456789ABCDEF".toCharArray();
			char[] hexChars = new char[result.length * 2];

			for (int i = 0; i < result.length; i++) {
				int positive = result[i] & 0xff;
				hexChars[i * 2] = hexArray[positive >>> 4];
				hexChars[i * 2 + 1] = hexArray[positive & 0x0F];
			}
			signature = new String(hexChars);
		} catch (Exception e) {
			signature = e.getMessage();
		}

		return signature;
	}


	public String getTimestamp() {
		long timestamp_long = System.currentTimeMillis() / 1000;
		String timestamp = Long.toString(timestamp_long);
		return timestamp;
	}

	
	public String setValue(String key, String value) {
		return "Content-Disposition: form-data; name=\"" + key + "\"\r\n\r\n"+ value;
	}
}
