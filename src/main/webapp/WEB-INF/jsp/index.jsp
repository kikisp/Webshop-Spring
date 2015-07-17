

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <base href="/School/" />
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
        <link rel="stylesheet" href="resources/css/normalize.css" type="text/css" media="screen">
        <link rel="stylesheet" href="resources/css/main.css" type="text/css" media="screen">
        <link href="resources/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
        
        <script src="resources/js/jplugins.js" type="text/javascript"></script>
        <script src="resources/js/main.js" type="text/javascript"></script>
        <script src="resources/js/modernizr-2.8.3.min.js" type="text/javascript"></script>
        
        <title>Welcome</title>
        
    </head>
    <body>

        <div align="center">
            <img src="resources/images/Webshop.png" width="609" height="103" alt="Webshop" /> 
        </div>
        <div align="center">
            <form method="post" action="shop" class="sign-up">
                <h1 class="sign-up-title">Login</h1>
                <input type='text' class="sign-up-input" name='username' placeholder="Enter Username"  required autofocus oninvalid="this.setCustomValidity('Enter Username Here')"
                       oninput="setCustomValidity('')">
                <input type='password' class="sign-up-input" name='password' placeholder="Enter Password" required  oninvalid="this.setCustomValidity('Enter Password Here')"
                       oninput="setCustomValidity('')"/>
                <input type="submit" value='LOGIN' class="sign-up-button" />
                <div class=link>
                    <h2>${msg}</h2>
                    <p><a href="register">Register</a></p>

                </div>
            </form>  
        </div>
    </body>
</html>
