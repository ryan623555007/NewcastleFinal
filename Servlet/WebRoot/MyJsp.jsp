<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery.min.js"></script> 
 
<script type="text/javascript" src="js/prettify/prettify.js"></script> 
<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js?lang=css&skin=sunburst"></script>
<script src="js/layout.js"></script>
 <script src="js/jquery.localscroll-1.2.7.js" type="text/javascript"></script>
 <script src="js/jquery.scrollTo-1.4.3.1.js" type="text/javascript"></script>
 
 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!--  <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script> -->
 <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/prettify.css">
	<style>
	.docs-content img{
	height:500px;
	/* width:1500px; */
	}
	</style>
  </head>
  
  <body>
      <nav>
  <div class="container">
    <h1>Provenance</h1>
    <div id="menu">

    <a id="menu-toggle" href="#" class=" ">&#9776;</a> </div>
</nav>
<header>
  <div class="container">

    <h2 class="docs-header"> Welcome to Provenance search system</h2>
  </div>
    <form class="form-inline" role="form" action="servlet/TestServlet" method="post">
        <div class="form-group">
        <!-- <label class="sr-only" for="name">name</label> -->
        	<input type="text" class="form-control" name="input" id="input"  placeholder="Enter file name">
             <button type="submit" class="btn btn-default">submit</button>
        </div>
    </form>
</header>
<section>
  <div class="container">
    <ul class="docs-nav" id="menu-left">
      <li><strong>Introduce</strong></li>
      <li><a href="#welcome" class=" ">Welcome</a></li>
      <li><a href="#benefits" class=" ">Benefits</a></li>
      <li><a href="#future" class=" ">Future</a></li>
      <li class="separator"></li>
      <li><strong>How to use</strong></li>
      <li><a href="#data type" class=" ">Data Type</a></li>
      <li><a href="#error" class=" ">If error</a></li>
    </ul>

    <div class="docs-content">
      <pre>${requestScope.ProvContent }</pre>
      

  <%-- ${requestScope.picture } --%>
  <img alt="" src="image/${requestScope.picture}.png" >
  </div>
</section>
      <section class="vibrant centered">
  <div class="container">
    <h4> This system is made by Newcastle University and student Ryan, contact them please click<a href="http://www.urbanobservatory.ac.uk/"> here</a></h4>

  </div>
</section>
  </body>
</html>
