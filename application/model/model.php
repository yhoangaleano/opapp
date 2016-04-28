<?php

class Model
{
    /**
     * @param object $db A PDO database connection
     */

    function __construct($db)
    {

        try {
            $this->db = $db;
        } catch (PDOException $e) {
            exit('Database connection could not be established.');
        }
    }

    /**
     * Get all songs from database
     */
    public function consultar_cuenta()
    {
        $sql = "SELECT  * FROM TBL_Cuenta";
        $query = $this->db->prepare($sql);
        $query->execute();

    
        return $query->fetchAll();
    }


    public function consultar_productos(){
        $sql="SELECT * FROM `TBL_Producto`";
        $query=$this->db->prepare($sql);
        $query->execute();

        return $query->fetchAll();
    }

    public function consultar_cotizaciones($id){
        $sql="SELECT * FROM `TBL_Cotizaciones` WHERE `PK_ID_Cotizacion`=$id";
        $query=$this->db->prepare($sql);
        $query->execute();

    }

}
