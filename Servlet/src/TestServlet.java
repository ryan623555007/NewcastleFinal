import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.EntityEnclosingMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.tomcat.jdbc.pool.interceptor.ResetAbandonedTimer;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *  This is the servlet that send http request to api and accept response data 
 * @author sunxiaoyong
 * @version 1.0
 * @date 2018/08/09
 */
public class TestServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public TestServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 *  
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//		HttpServletRequest request,HttpServletResponse response
		String provenanceID = request.getParameter("input");
		String json = "{\"index\":\""+provenanceID+"\"}";
		
//		String json = "{\"index\":\"HDF-PPI-A00-201607200005-B-1080-0450-0010-0015-C\"}";
		//String json = "{\"PubInfo\": {\"clinet\": \"10.70.128.132\",\"company\": \"月月鸟0820\"},\"Request\": {\"strBillId\": \"18221075148\",\"strCcsOpId\": \"1234\"}}";
		//JSONObject  json = new JSONObject();
		//int id = Integer.parseInt(name); 
		//System.out.println("sas");
		//json.put("index", "crtcdtctc");
		//String jsonstring = null;
		//jsonstring = json.toString();
		System.out.println(json);
		String url = "http://0.0.0.0:8081/trans1";
        String op = "";
        
        Resultt outpage = postHttpReq(json, url);
        System.out.println(op);
        System.out.println("客户端日志");
        System.out.println("\n客户端日志----POST方式调用HTTP服务,HTTP服务端响应报文如下:=============\n");
 
        System.out.println(op);
        System.out.println("\nauthor<pantp>================================================================\n");
		
        response.setContentType("application/json");
        PrintWriter writer = response.getWriter();
        System.out.println(outpage.getOther());
        
        //request.setAttribute("ProvContent", outPackage.);
        request.setAttribute("ProvContent", outpage.getProvContent());
        request.setAttribute("picture", outpage.getOther());
        System.out.println(outpage.getProvContent());
        System.out.println(outpage.getOther());
        request.getRequestDispatcher("../MyJsp.jsp").forward(request, response);
        
	}
	/**
	 * This method is used to set the request head, url and get the response data
	 * @param json
	 * @param url
	 * @return
	 */
	public static Resultt postHttpReq(String json,String url) {
		
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
        String outPackage="";
        int pict=2123;
        try {
        
            statusCode = httpClient.executeMethod(postMethod);// 发送请求
        	
            responseMsg = postMethod.getResponseBodyAsString();// 获取返回值
            
            System.out.println(responseMsg);
            try {
				JSONObject jsonObject = new JSONObject(responseMsg);
				
				outPackage = jsonObject.getString("prov");
				pict =  jsonObject.getInt("picture");
				
				System.out.println(outPackage);
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
        
        Resultt result = new Resultt(outPackage, pict);
        
        return result ;
    }

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	

}
