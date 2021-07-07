<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    //
    public function index(){
        $data = DB::table('tb_rumah_sakit')->count();
        return view('pages/home/index', ['data' => $data]);
    }
}
