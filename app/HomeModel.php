<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HomeModel extends Model
{
    //
    protected $table = 'tb_rumah_sakit';
    protected $fillable = ['gambar', 'nama', 'lokasi', 'telp'];
}
