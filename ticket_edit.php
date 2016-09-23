<?php
include_once('inc/session.php');
include_once('inc/dbconfig.php');

if(isset($_GET['edit_id'])) {
  $id = $_GET['edit_id'];

  $sql_query = "SELECT * FROM vTickets WHERE ID=$id";
  if($result = $connection->query($sql_query)) {
    $rowTicket = $result->fetch_array();
  }
}

/*
if(isset($_POST['btn-edit'])) {
  $cognome  = $_POST['cognome'];
  $nome     = $_POST['nome'];
  $comuneId    = $_POST['comuneId'];

  $sql_cmd = "UPDATE clienti SET cognome='$cognome', nome='$nome', comuneId='$comuneId' WHERE ID=$id";
  if($connection->query($sql_cmd)) {
    echo "<script>window.location.href='clienti.php?saved=true';</script>";
  } else {
    echo "<script>alert('Errore di salvataggio record.');</script>";
  }

}
*/
?>

<!DOCTYPE html>
<html lang="it">

<head>
  <?php include('html/layout/head.php'); ?>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <?php include('html/layout/navbar.php'); ?>

        <div id="page-wrapper">
            <?php include('html/layout/pageHeader.php'); ?>

            <!-- /.row -->
            <div class="row">
              <!-- Page Content -->

              <form action="#" method="POST">
                <div class="form-group col-md-6">
                    <label>Cliente</label>
                    <input class="form-control" type="text" 
                           value="<?php echo $rowTicket['Cliente']; ?>" readonly>
                </div>
                <div class="form-group col-md-6">
                    <label>Stato</label>
                    <input class="form-control" type="text" 
                           value="<?php echo $rowTicket['Stato']; ?>" readonly>
                </div>
                <div class="form-group col-md-6">
                    <label>Categoria</label>
                    <input class="form-control" type="text" 
                           value="<?php echo $rowTicket['Categoria']; ?>" readonly>
                </div>
                <div class="form-group col-md-6">
                    <label>Operatore</label>
                    <input class="form-control" type="text" 
                           value="<?php echo $rowTicket['Operatore']; ?>" readonly>
                </div>
                <div class="form-group col-md-6">
                    <label>Reparto</label>
                    <input class="form-control" type="text" 
                           value="<?php echo $rowTicket['Reparto']; ?>" readonly>
                </div>
                <div class="form-group col-md-12">
                    <label>Oggetto</label>
                    <input class="form-control" type="text" 
                           value="<?php echo $rowTicket['Oggetto']; ?>" readonly>
                </div>
                <div class="form-group col-md-12">
                    <label>Descrizione</label>
                    <textarea class="form-control" 
                              rows="5" readonly><?php echo $rowTicket['Descrizione']; ?></textarea>
                </div>
              </form>


            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- script section -->
    <?php include('html/layout/script.php'); ?>
</body>

</html>
