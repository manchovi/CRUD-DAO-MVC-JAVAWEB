<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design for Bootstrap</title>
  <!-- MDB icon -->
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
  <!-- Font Awesome -->
  <!--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">-->

  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="../css/bootstrap.min.css">

</head>
<body>

  <button class="btn btn-success" data-toggle="modal" data-target="#ventanaModal">
    Abrir Modal
  </button>

  <div class="modal fade" id="ventanaModal" tabindex="-1" role="dialog" aria-labelledby="tituloVentana" aria-hidden="tue">
  <div class="modal-dialog" role="document">
  <div class="modal-content">
    <div class="modal-header">
      <h5 id="tituloVentana">Titulo de la Ventana Modal</h5>
      <button class="close" data-dismiss="modal" arial-label="cerrar">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <div class="modal-body">
      <div class="alert alert-success">
        <h6><strong>Tus datos se han guardado exitosamente.</strong></h6>
      </div>
    </div>
    <div class="modal-footer">
      <button class="btn btn-warning" type="button" data-dismiss="modal">
        Cerrar
      </button>
      <button class="btn btn-success" type="button">
        Aceptar
      </button>
    </div>
</div>
</div>
</div>

  <!-- jQuery -->
  <script type="text/javascript" src="../js/jquery.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="../js/bootstrap.min.js"></script>


</body>
</html>
