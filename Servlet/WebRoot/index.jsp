<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="alternate" type="application/rss+xml" title="egrappler.com" href="feed/index.html">
	<link href="http://fonts.googleapis.com/css?family=Raleway:700,300" rel="stylesheet"
        type="text/css">

<!-- <script src="js/jquery-2.1.3.min.js"></script> -->

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
      <h2> Introduce</h2>
      <h3 id="welcome"> Welcome</h3>
      <p> What is Urban Observatory?</p>
      
        <p> Urban Observatory is the largest set of publicly available real time urban data in the UK.</p>
      <p>    The sensors are gathering data across the city. With over 50 data types and counting, there is lots of live data for you to access.
      </p>

      <h3 id="benefits"> Benefits</h3>
      <ul>
        <li>data for everyone</li>
          Our data is always open and free to use. Whether you want to check out the current weather, download some observations for a school project or build your own app. If you need something more, you can commission sensors from the Urban Observatory, on your local streets to collect evidence for informing or even changing your community.
        <li>made for developers</li>
          Our data has been designed from the bottom up with developers in mind. A flexible RESTful API is available to select time-series, specific location or even specific sensors. Data can be downloaded in JSON or CSV format. Register for an API key to enable frequent requests. There are no plans to ever charge for the data.
          Explore the opportunities through our data portal. Let us know what you're doing so we can contact you with updates and developments
        <li>perfect for research</li>
          Research is at the core of the UO. All our data is published as open-data and available from the API or via download. We can also assist with the deployment of sensors for your research project and provide tools to manage and visualise your data in real-time
        <li>opportunities for business</li>
          Our commitment to open-data and platforms make it easy for you to use our data. Our expertise in analytical and monitoring services can help you build a better, evidence-based business case. Got an idea? Come and talk.
      </ul>
      <h3 id="future"> future</h3>
      <ul>
        <li>Integrated Urban Infrastructure Labs</li>
          UKCRIC will establish a network of interlinked urban infrastructure ‘observatories’, at sites across the UK, for the digital capture, mapping, sensing, monitoring, and testing of real urban infrastructure systems over the long term. The key objective is to capture the complex interrelations and interactions of real systems with the environment, people and society. The research will be enabled by close collaboration with local government and industrial partners.
        <li>A national network of urban laboratories</li>
          Deploying sensors across a variety of urban sites, this national ‘observatory’ will enable the digital capture, mapping, monitoring and testing of real cities and infrastructure at a variety of scales, over time.
      </ul>

      <h2> How to use</h2>

      <h3 id="data type"> Data Type</h3>
      <ul>
        <li>JSON</li>
          Please enter the name of the file you want to search in the input box below wei, for example: HDF-PPI-A00-201607200005-B-1080-0450-0010-0015-C.
          After searching, the system will return the result of a JSON file and a png image to help you analyze the provenance of this file.
      </ul>
        <h3 id="error"> If error</h3>
        If error when you use this system, please check if your input is correct or contact Urban Observatory.

    </div>
  </div>
</section>
<section class="vibrant centered">
  <div class="container">
    <h4> This system is made by Newcastle University and student Ryan, contact them please click<a href="http://www.urbanobservatory.ac.uk/"> here</a></h4>

  </div>
</section>


  </body>
</html>
