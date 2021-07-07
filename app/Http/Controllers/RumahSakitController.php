<?php

namespace App\Http\Controllers;

use App\Category;
use App\Http\Requests\RumahSakitRequest;
use Illuminate\Http\Request;
use App\HomeModel;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Redirect;

class RumahSakitController extends Controller
{
    public function index(){
        $data = HomeModel::all();
        return view('pages/rumahsakit/index', ['data' => $data]);
    }

    public function create(){
        return view('pages/rumahsakit/create');
    }

    public function insert(RumahSakitRequest $request){
        $data = $request->all();
        $data['nama'] = $request->name;
        $data['lokasi'] = $request->location;
        $data['telp'] = $request->telp;
        if($request->hasFile('image'))
        {
            $image = $request->file('image');
            $image_name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images');
            $image->move($destinationPath, $image_name);
        }
        $data['gambar'] = $image_name;

        \App\HomeModel::create($data);
        $data = HomeModel::all();
        return Redirect::route('rumahsakit')->with( ['data' => $data])->with('success', 'Berhasil input data');
    }

    public function edit($id){
        $data = HomeModel::find($id);
        return view('pages/rumahsakit/edit', ['data' => $data]);
    }

    public function update(Request $request, $id){
        $data = $request->all();
        $data['nama'] = $request->name;
        $data['lokasi'] = $request->location;
        $data['telp'] = $request->telp;

        $item = \App\HomeModel::findOrFail($id);
        $data['gambar'] = $item->gambar;
        if($request->hasFile('image'))
        {
            File::delete($item->image);
            $image = $request->file('image');
            $image_name = time().'.'.$image->getClientOriginalExtension();
            $destinationPath = public_path('/images');
            $image->move($destinationPath, $image_name);
            $data['gambar'] = $image_name;
        }

        $item->update($data);

        $data = HomeModel::all();
        return Redirect::route('rumahsakit')->with( ['data' => $data])->with('success', 'Berhasil update data');

    }


    public function delete($id){
        $data = \App\HomeModel::find($id);
        if($data->image != ""){
            File::delete($data->image);
        }
        $data->delete($data);
        $data = HomeModel::all();
        return Redirect::route('rumahsakit')->with( ['data' => $data])->with('success', 'Berhasil hapus data');
    }

}
