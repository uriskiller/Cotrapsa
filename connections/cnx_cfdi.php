
<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $db = "cotrapsaadmin";

    $conn = new mysqli($servername,$username,$password)
    or die("Error con la conexion a Base de Datos".$conn -> connect_error);

    $database = mysqli_select_db ($conn, $db)
    or die("No se encontr� Base de Datos".$conn -> connect_error);

?>
