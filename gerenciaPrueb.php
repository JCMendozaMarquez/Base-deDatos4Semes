<?php
include ("conexion.php");
$con=conectar();

$sql="SELECT*  from gerencia" ;
$query=mysqli_query($con,$sql);

$row=mysqli_fetch_array($query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <LINK REL=StyleSheet HREF="csslogin2.css" TYPE="text/css" MEDIA=screen>
    <LINK REL=StyleSheet HREF="jssLogin2.js" TYPE="text/css" MEDIA=screen>
</head>
<body>
    
<div class="login-form">
        <h1>Vini</h1>
        <div class="form-group ">
          <input type="text" class="form-control" placeholder="Username " id="UserName">
          <i class="fa fa-user"></i>
        </div>
        <div class="form-group log-status">
          <input type="password" class="form-control" placeholder="Password" id="Passwod">
          <i class="fa fa-lock"></i>
        </div>
         <span class="alert">Invalid Credentials</span>
         <a class="link" href="#">Lost your password?</a>
        <button type="button" class="log-btn" >Log in</button>
        
      </div>

      
</body>
</html>
