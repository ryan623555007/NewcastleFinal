<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<!-- 	<link rel="stylesheet" type="text/css" href="styles.css"> -->
<style>
        h1{
            font-weight: bold;
            text-align:center;
            /*line-height:center;*/
        }
        #container{
            height:800px;
            width:1600px;
            position:absolute;

            background-color:#D3D3D3;
        }
        #div img{
            position: absolute;
            width:100%;
            height: auto;
            top:0px;
            margin-top: 0px;

        }
        #div span{
            font-size: 30px;
            position: absolute;
            font-weight: bold;
            text-align:center;
            left:500px;
            top:200px;
        }
        #div #form1{
            position: absolute;
            left:750px;
            top: 250px;
        }
        #form1 .form-control{
        position:relative;
        box-sizing: border-box;
  		text-align:center;
  		font-size:1.4em;
  		height:1.0em;
  		border-radius:4px;
  		border:1px solid #c8cccf;
  		color:#6a6f77;
  		-web-kit-appearance:none;
  		-moz-appearance: none;
  		display:block;
  		outline:0;
  		padding:0 1em;
  		text-decoration:none;
  		float:left;
  		width:70%;
        }
        #form .sub-control{
        	left:100px;
        	position:relative;
        	float:right;
        	
        }
 </style>
 
  </head>
  <body>
<div id="container" >
<div id="div">
                <img src="img/newcastle.jpg" alt="earth" title="earth"/>
                <span>Welcome to Newcastle Provenance search system!</span>
                    <div id="form1">
                        <form action="servlet/TestServlet" method="post">
                            <input type="text" class="form-control" name="input" id="input" placeholder="enter Provenance ID" >
							<input type="submit" class="sub-control" name="sub"> 
                        </form>
                
                    </div>
            </div>
</div>
</div>
    <!-- 
    <script type="text/javascript">
	$('#submit').click(function(){
		var id = $("#IDinput").val();
		
		$.ajax({
                type : "post",//提交方式
                url : "TestServlet",//servlet路经
                //pass data to servlet
                data : {
                    provId : id
                },
                //warning information
                statusCode : {
                    404 : function() {
                        alert("pleae check the path!");
                    }
                },
                //success information
                success : function(data, textStatus) {
                    alert("success! happy!happy!happy!");
                    $("#resText").text(data);
                }
            })
   });
   </script>  -->
  </body>
</html>
