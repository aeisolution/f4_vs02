<?php
   include('dbconfig.php');
   session_start();

   if(isset($_SESSION['login_user'])) {
     $user_check = $_SESSION['login_user'];
     $sql_query = "SELECT utenti.username, operatori.ID FROM utenti";
     $sql_query .= " LEFT JOIN operatori ON utenti.Username = operatori.Username";
     $sql_query .= " WHERE utenti.username = '$user_check' ";

     $result = $connection->query($sql_query);

     $row = $result->fetch_array();
     $login_session = $row['username'];
     $login_operatoreId = $row['ID'];


   } else {
     header("location:login.php");
   }
?>
