﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("url", request.getScheme()+"://"+request.getHeader("host")+request.getContextPath());
%>
<!DOCTYPE html>
<html>
  <base href="<%=basePath%>">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${init.webSite.title} - ${_res.login}</title>
    <link href="${url}/assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${url}/assets/css/font-awesome.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="${url}/assets/css/custom.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="${url}/favicon.ico" />

    <link rel="stylesheet" href="${url}/assets/css/pnotify.css" />
    <!-- jQuery -->
    <script src="${url}/assets/js/jquery.min.js"></script>
    <script src="${url}/assets/js/pnotify.js"></script>
    <script src="${url}/admin/js/login.js"></script>
  </head>

  <body class="login">
    <div>
      <div class="login_wrapper">
        <div class="animate form login_form">
          <section class="login_content">
            <form id="login_form" action="${url}/api/admin/login">
              <input type="hidden" id="redirectFrom" name="redirectFrom" value="${param.redirectFrom}">
              <h1>${_res.userNameAndPassword}</h1>
              <div>
                <input id="userName" name="userName" type="text" class="form-control" placeholder="${_res.userName}" required="" />
              </div>
              <div>
                <input name="password" type="password" class="form-control" placeholder="${_res.password}" required="" />
              </div>
              <div>
                <button class="btn btn-default" id="login_btn" type="button"> 
                <i class="fa fa-sign-in"></i>
                ${_res.login}
                </button>
              </div>
              <div class="separator">
                <div class="clearfix"></div>
                <br />
                <div>
                  <p><strong>${_res.copyright}</strong>  ${init.webSite.title} All Rights Reserved. </p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
