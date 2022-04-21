<?php
    session_start();
    if(isset($_SESSION['administrator']))
    {
        include "header.php";
?>

<?php
    include "footer.php";
    }else{
        header("Location: ../index.html");
    }
?>
