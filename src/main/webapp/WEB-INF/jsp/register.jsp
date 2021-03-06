<!DOCTYPE html>
<html class="no-js">
    <head>
        <base href="/School/" />
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
               
        <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
        <link rel="stylesheet" href="resources/css/main.css" type="text/css" media="screen">
      
        <link href="resources/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />
     
        <script src="resources/js/jplugins.js" type="text/javascript"></script>
        <script src="resources/js/main.js" type="text/javascript"></script>
        <script src="resources/js/modernizr-2.8.3.min.js" type="text/javascript"></script>
              
        <title>Register</title>
       
    </head>
    <body>
        <div align="center">
            <img src="resources/images/Webshop.png" width="609" height="103" alt="Webshop" /> 
        </div>
        <div align="center">
            <form method="post" action="login" class="sign-up">
                <h1 class="sign-up-title">Register</h1>
                <input type='text' class="sign-up-input" name='username' pattern="^[a-z\d\.]{5,}$" placeholder="Choose Username" required autofocus required autofocus oninvalid="this.setCustomValidity('Enter Valid Username')"
                       oninput="setCustomValidity('')"/>
                <input type="password" class="sign-up-input" name='password' pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$"  placeholder="Choose Password" required required autofocus oninvalid="this.setCustomValidity('Enter Valid Password.eg: one Uppercase,Number and min 8 chars')"
                       oninput="setCustomValidity('')" />
                  <input type='email' class="sign-up-input" name='email' pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" placeholder="Choose Email" oninvalid="this.setCustomValidity('Enter Valid Email')"
                       oninput="setCustomValidity('')"/>
                <input type="submit" value='REGISTER' class="sign-up-button" />               
                <div class="link">
                <h3>${msg} </h3>
                <p><a href="index">Back</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
