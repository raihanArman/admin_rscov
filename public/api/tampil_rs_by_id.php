<?php

    require_once 'koneksi.php';
    $res = array();
    $data = array();

    if($_SERVER['REQUEST_METHOD'] == 'GET'){

        $id = $_GET['id_rs'];

        $query = "SELECT * FROM tb_rumah_sakit WHERE id = $id";
        $sql = mysqli_query($con, $query);
        if($sql){
            $row = mysqli_fetch_array($sql);
            $data['id'] = $row['id'];
            $data['nama'] = $row['nama'];
            $data['lokasi'] = $row['lokasi'];
            $data['telp'] = $row['telp'];
            $data['gambar'] = $row['gambar'];
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