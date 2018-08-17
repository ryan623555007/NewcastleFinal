import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;

import java.util.Scanner;

public class Client {
	 /**
     * 发送post请求,客户端采用二进制流发送,服务端采用二进制流介绍
     * @param json  入参的json格式的报文
     * @param url    http服务器的地址
     * @return  返回响应信息
     */
    public static String postHttpReq(String json,String url) {
    	
        HttpClient httpClient = new HttpClient();
        
        byte b[] = json.getBytes();//把字符串转换为二进制数据
        RequestEntity requestEntity = new ByteArrayRequestEntity(b);
 
        EntityEnclosingMethod postMethod = new PostMethod();
        postMethod.setRequestEntity(requestEntity);// 设置数据
        postMethod.setPath(url);// 设置服务的url
        postMethod.setRequestHeader("Content-Type", "text/html;charset=GBK");// 设置请求头编码
 
        // 设置连接超时
        httpClient.getHttpConnectionManager().getParams().setConnectionTimeout(
                5 * 1000);
        // 设置读取超时
        httpClient.getHttpConnectionManager().getParams().setSoTimeout(20 * 1000);
 
        String responseMsg = "";
        int statusCode = 0;
        try {
            statusCode = httpClient.executeMethod(postMethod);// 发送请求
            responseMsg = postMethod.getResponseBodyAsString();// 获取返回值
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
        return responseMsg;
    }
    
    //POST方式发送HTTP请求
    public static void main(String[] args) {
        String json = "{\"PubInfo\": {\"clinet\": \"10.70.128.132\",\"company\": \"月月鸟0820\"},\"Request\": {\"strBillId\": \"18221075148\",\"strCcsOpId\": \"1234\"}}";
        String url = "http://0.0.0.0:8081/trans1";
        String outPackage = null;
        outPackage = postHttpReq(json, url);
        System.out.println("客户端日志");
        System.out
                .println("\n客户端日志----POST方式调用HTTP服务,HTTP服务端响应报文如下:=============\n");
 
        System.out.println(outPackage);
 
        System.out
                .println("\nauthor<pantp>================================================================\n");
//        Scanner sc = null;
//        try {
//            sc = new Scanner(System.in); 
//            System.out.println("请输入您想查询的provenance file name："); 
//            String ID = sc.nextLine(); 
//            
//        }catch(Exception e) {
//            e.printStackTrace();
//        }
//        finally {
//            if(sc != null){
//                sc.close();
//                sc = null;
//            }
//        }
    }
 
}

