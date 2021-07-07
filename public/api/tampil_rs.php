<?php

    require_once 'koneksi.php';
    $res = array();
    $data = array();

    if($_SERVER['REQUEST_METHOD'] == 'GET'){

        $query = "SELECT * FROM tb_rumah_sakit";
        $sql = mysqli_query($con, $query);
        if($sql){
            while($row = mysqli_fetch_array($sql)){
                array_push($data, array(
                    "id" => $row['id'],
                    "nama" => $row['nama'],
                    "lokasi" => $row['lokasi'],
                    "telp" => $row['telp'],
                    "gambar" => $row['gambar'] 
                ));
            }
            $res = array(
                "status" => "sukses",
                "message" => "Berhasil menampilkan data",
                "data" => $data
            );

        }else{
            echo 'ampas';
        }

        echo json_encode($res);

    }

?>