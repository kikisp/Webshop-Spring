<!DOCTYPE html>
<html>
    <head>
        <base href="/School/" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/style.css" type="text/css" media="screen">
        <title>Shop</title>
       
    </head>
    <body>
        <div align="center">
            <img src="resources/images/Webshop.png" width="609" height="103" alt="Webshop" /> 
        </div>
        <div align="center">
            <form method="post" action="login" class="sign-up">
                <h1 class="sign-up-title">Register</h1>
                <input type='text' class="sign-up-input" name='username' placeholder="Username" required autofocus>
                <input type='text' class="sign-up-input" name='password' placeholder="Password" required />
                  <input type='email' class="sign-up-input" name='email' placeholder="Email">
                <input type="submit" value='REGISTER' class="sign-up-button" />
                <h3>${msg} </h3>
                <div>
                <p><a href="index">Back</a></p>
                </div>
            </form>
        </div>
    </body>
</html>
