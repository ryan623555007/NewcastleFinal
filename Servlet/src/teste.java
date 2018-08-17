import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.json.JSONException;
import org.json.JSONObject;

public class teste {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String json = "{\"index\":\"HDF-PPI-A00-201607200005-B-1080-0450-0010-0015-C\"}";
		String url = "http://0.0.0.0:8081/trans1";
		String a = postHttpReq(json, url);
		System.out.print(a);
	}
	
public static  String postHttpReq(String json,String url) {
		
        HttpClient httpClient = new HttpClient();
        
        byte b[] = json.getBytes();//把字符串转换为二进制数据
        System.out.println(b);
        System.out.println("sas2");
        RequestEntity requestEntity = new ByteArrayRequestEntity(b);
 
        EntityEnclosingMethod postMethod = new PostMethod();
        postMethod.setRequestEntity(requestEntity);// 设置数据
        postMethod.setPath(url);// 设置服务的url
        postMethod.setRequestHeader("Content-Type", "application/json");// 设置请求头编码
 
        // 设置连接超时
        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(5 * 1000);
        // 设置读取超时
        httpClient.getHttpConnectionManager().getParams().setSoTimeout(20 * 1000);
 
        String responseMsg = "";
        int statusCode = 0;
        String prov = "";
        try {
        	
            statusCode = httpClient.executeMethod(postMethod);// 发送请求
        	
            responseMsg = postMethod.getResponseBodyAsString();// 获取返回值
            System.out.println(responseMsg);
            try {
				JSONObject jsonObject = new JSONObject(responseMsg);
				prov = jsonObject.getString("index");
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        } catch (HttpException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            postMethod.releaseConnection();// 释放连接
        }
 
        if (statusCode != HttpStatus.SC_OK) {
            System.out.println("HTTP服务异常" + statusCode);
        }
        return prov;
}
}
