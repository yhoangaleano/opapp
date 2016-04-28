<?php

/**
 * Class Songs
 * This is a demo class.
 *
 * Please note:
 * Don't use the same name for class and method, as this might trigger an (unintended) __construct of the class.
 * This is really weird behaviour, but documented here: http://php.net/manual/en/language.oop5.decon.php
 *
 */
class Controlador extends Controller
{

    function __construct() {

    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
    header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    $method = $_SERVER['REQUEST_METHOD'];
    if($method == "OPTIONS") {
        die();
    }
    parent::__construct();
}


public function consultar_cuenta(){

$Cuentas=$this->model->consultar_cuenta();

echo json_encode($Cuentas);

}



public function consultar_productos(){

    $Productos=$this->model->consultar_productos();

echo json_encode($Productos);



}

public function consultar_cotizaciones($id){
    $Cotizaciones=$this->model>consultar_cotizaciones($id);

    echo json_encode($Cotizaciones);
}


}
