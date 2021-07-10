<?php

    require_once 'koneksi.php';
    $res = array();
    $data = array();

    set_time_limit(300);

    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        $locationUser = $_GET['location_user'];
        $latUser = $_GET['lat_user'];
        $longUser = $_GET['long_user'];

        $queryTempAlamat = "TRUNCATE TABLE tb_temp_alamat";
        mysqli_query($con, $queryTempAlamat);
        
        $queryTempJarak = "TRUNCATE TABLE tb_temp_jarak";
        mysqli_query($con, $queryTempJarak);

        $queryTempUrutan = "TRUNCATE TABLE tb_temp_urutan";
        mysqli_query($con, $queryTempUrutan);


        // Metode A Star
        $queryInsertAsal = "INSERT INTO tb_temp_alamat(lokasi) VALUES('$locationUser')";
        $sqlInsertAsal = mysqli_query($con, $queryInsertAsal);
        if($sqlInsertAsal){
            $query = "SELECT * FROM tb_rumah_sakit";
            $sql = mysqli_query($con, $query);
            if($sql){

                //Insert Temp Alamat
                while($row = mysqli_fetch_array($sql)){
                    $addressTujuan = str_replace(" ", "+", $row['lokasi']);

                    $jsonTujuan = file_get_contents("https://maps.google.com/maps/api/geocode/json?address=".$addressTujuan."&sensor=false&key=AIzaSyBtnPVw4o2H1ZvDtRT8l8OTKCzS60eV0as");
                    $jsonTujuan = json_decode($jsonTujuan);

                    $latTujuan = $jsonTujuan->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
                    $longTujuan = $jsonTujuan->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};

                    $urlApi = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$latUser.","."$longUser"."&destinations=".$latTujuan.","."$longTujuan"."&key=AIzaSyBtnPVw4o2H1ZvDtRT8l8OTKCzS60eV0as";
        
                    $result = file_get_contents($urlApi);
    
                    $dataJson = json_decode($result, true);
                    $jarak = $dataJson['rows'][0]['elements'][0]['distance']['value'];

                    $queryInsertTujuan = "INSERT INTO tb_temp_alamat(lokasi, jarak) VALUES('$row[lokasi]', '$jarak')";
                    mysqli_query($con, $queryInsertTujuan);
                    
                }


                // Insert Temp Jarak & Heuristik  
                $queryTempAlamatAsal = "SELECT * FROM tb_temp_alamat";
                $sqlTempAlamatAsal = mysqli_query($con, $queryTempAlamatAsal);
                if($sqlTempAlamatAsal){
                    while($dataAsal = mysqli_fetch_array($sqlTempAlamatAsal)){

                        $queryTempAlamatTujuan = "SELECT * FROM tb_temp_alamat";
                        $sqlTempAlamatTujuan = mysqli_query($con, $queryTempAlamatTujuan);
                        if($sqlTempAlamatTujuan){
                            while($dataTujuan = mysqli_fetch_array($sqlTempAlamatTujuan)){
                            
    
                                $addressAsal = str_replace(" ", "+", $dataAsal['lokasi']);
                                $addressTujuan = str_replace(" ", "+", $dataTujuan['lokasi']);
    
                                $jsonAsal = file_get_contents("https://maps.google.com/maps/api/geocode/json?address=".$addressAsal."&sensor=false&key=AIzaSyBtnPVw4o2H1ZvDtRT8l8OTKCzS60eV0as");
                                $jsonAsal = json_decode($jsonAsal);
    
                                $latAsal = $jsonAsal->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
                                $longAsal = $jsonAsal->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};
    
                                $jsonTujuan = file_get_contents("https://maps.google.com/maps/api/geocode/json?address=".$addressTujuan."&sensor=false&key=AIzaSyBtnPVw4o2H1ZvDtRT8l8OTKCzS60eV0as");
                                $jsonTujuan = json_decode($jsonTujuan);
    
                                $latTujuan = $jsonTujuan->{'results'}[0]->{'geometry'}->{'location'}->{'lat'};
                                $longTujuan = $jsonTujuan->{'results'}[0]->{'geometry'}->{'location'}->{'lng'};
    
                                $urlApi = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=".$latAsal.","."$longAsal"."&destinations=".$latTujuan.","."$longTujuan"."&key=AIzaSyBtnPVw4o2H1ZvDtRT8l8OTKCzS60eV0as";
                    
                                $result = file_get_contents($urlApi);
                
                                $dataJson = json_decode($result, true);
                                $jarak = $dataJson['rows'][0]['elements'][0]['distance']['value'];
    
                                $heuristik = ($latTujuan - $latAsal) + ($longTujuan - $longTujuan);

                                $nilai = $jarak+$heuristik;
    
                                $queryInsert = "INSERT INTO tb_temp_jarak(id_asal, id_tujuan, jarak, heuristik, nilai) VALUES('$dataAsal[id_lokasi]', $dataTujuan[id_lokasi], '$jarak', '$heuristik', '$nilai')";
                                mysqli_query($con, $queryInsert);
                                
                            }
                        }  
                    }
                }




            }
        }else{
            echo 'ampas';
        }



        // Cari Urutan
        $query = "SELECT * FROM tb_temp_alamat";
        $sql = mysqli_query($con, $query);
        if($sql){
            while($row = mysqli_fetch_array($sql)){
                $queryDelete = "DELETE FROM tb_temp_jarak WHERE id_asal = $row[id_lokasi] AND id_tujuan = $row[id_lokasi]";
                mysqli_query($con, $queryDelete);
            }
        }

        $query = "SELECT COUNT(*) as jumlah FROM tb_temp_alamat";
        $sql = mysqli_query($con, $query);
        if($sql){
            $row = mysqli_fetch_array($sql);

            $jumlah = $row['jumlah'];
            $urutan = 1;

            $titik = 1;
            for($a = 1; $a<=$jumlah; $a++){
                $queryAll = "SELECT * FROM tb_temp_alamat";
                $sqlAll = mysqli_query($con, $queryAll);
                if($sqlAll){
                    
                    $queryMinData = "SELECT * FROM tb_temp_jarak WHERE id_asal = $titik";
                    $sqlMinData = mysqli_query($con, $queryMinData);
                    if($sqlMinData){
                        $rowMinData = mysqli_fetch_array($sqlMinData);

                        $titik2 = $rowMinData['id_tujuan'];
                        $min = $rowMinData['nilai'];

                        while($row = mysqli_fetch_array($sqlAll)){
                            if($titik != $row['id_lokasi']){
                                $queryMin = "SELECT * FROM tb_temp_jarak WHERE id_asal = $titik AND id_tujuan = $row[id_lokasi]";
                                $sqlMin = mysqli_query($con, $queryMin);
                                if($sqlMin){

                                    $data1 = mysqli_fetch_array($sqlMin);

                                    $nilai1 = $data1['nilai'];
                                    if($nilai1 < $min){
                                        $min = $nilai1;
                                        $titik2 = $data1['id_tujuan'];
                                    }


                                }else{
                                    echo 'ampas';
                                }
                            }
                        }


                        // titik2 masukkan di database


                        $queryGetLokasi = "SELECT * FROM tb_temp_alamat WHERE id_lokasi = $titik2";
                        $sqlGetLokasi = mysqli_query($con, $queryGetLokasi);
                        if($sqlGetLokasi){
                            $row = mysqli_fetch_array($sqlGetLokasi);

                            $queryUrutan = "INSERT INTO tb_temp_urutan VALUES ($a, $titik2, '$row[lokasi]', '$row[jarak]')";
                            $sqlUrutan = mysqli_query($con, $queryUrutan);
                            if($sqlUrutan){

                                $queryDeleteTitik = "DELETE FROM tb_temp_alamat WHERE id_lokasi = $titik2";
                                $sqlDeleteTitik = mysqli_query($con, $queryDeleteTitik);
                                if($sqlDeleteTitik){         
                                    
                                    $queryDeleteTitikY = "DELETE FROM tb_temp_alamat WHERE id_lokasi = $titik";
                                    mysqli_query($con, $queryDeleteTitikY);
                                    

                                    $titik = $titik2; 
                                }else{
                                    echo 'gagal delete';
                                }

                            }else{
                                echo 'gagal kevin **';
                            }
                        }else{
                            echo 'gagal sterlin **';
                        }

                        $queryDeleteTitikX = "DELETE FROM tb_temp_jarak WHERE id_tujuan = $titik";
                        mysqli_query($con, $queryDeleteTitikX);

                    }else{
                        echo 'ampas';
                    }
                }else{
                    
                }
            }

        }

        
        // Tampilkan Urutan
        $query = "SELECT * FROM tb_temp_urutan";
        $sql = mysqli_query($con, $query);
        if($sql){
            while($row = mysqli_fetch_array($sql)){
                if($row['id'] != 1){
                    $queryRs = "SELECT * FROM tb_rumah_sakit WHERE lokasi = '$row[lokasi]'";
                    $sqlRs = mysqli_query($con, $queryRs);
                    if($sqlRs){
                        $rowRs = mysqli_fetch_array($sqlRs);
                        array_push($data, array(
                            "id" => $rowRs['id'],
                            "nama" => $rowRs['nama'],
                            "lokasi" => $rowRs['lokasi'],
                            "telp" => $rowRs['telp'],
                            "gambar" => $rowRs['gambar'],
                            "jarak" => $row['jarak'] 
                        ));
                    }
                }
            }

            $res = array(
                "status" => "sukses",
                "message" => "Berhasil menampilkan data",
                "data" => $data
            );
            echo json_encode($res);
        }

    }

?>