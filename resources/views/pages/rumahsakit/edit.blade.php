@extends('layouts.default')

@section('title')
    Edit Kategori
@endsection

@section('content')
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Edit Rumah Sakit</h6>
        </div>
        <div class="card-body">
            <form action="/rumahsakit/{{$data->id}}/update" method="post" enctype="multipart/form-data">
                @csrf
                <div class="form-group col-md">
                    <label for="">Nama Rumah Sakit</label>
                    <input type="text" value="{{ $data->nama  }}" name="name" class="form-control" placeholder="Nama Rumah Sakit..." required>
                </div>
                <div class="form-group col-md">
                    <label for="">Lokasi</label>
                    <input type="text" value="{{ $data->lokasi  }}" name="location" class="form-control" placeholder="Lokasi..." required>
                </div>
                <div class="form-group col-md">
                    <label for="">No Telp</label>
                    <input type="text" value="{{ $data->telp  }}" name="telp" class="form-control" placeholder="Telp..." required>
                </div>
                <div class="form-group col-md">
                    <label for="formFile" class="form-label ">Gambar</label>
                    @error('image')
                    <div class="text-muted"></div>
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            @foreach ($errors->all() as $error)
                                {{ $error }}
                            @endforeach
                        </div>
                    @endif
                    @enderror
                    <input
                        type="file"
                        name="image"
                        value="{{ old('image') ? old('image') : $data->gambar }}"
                        id="formFile"
                        accept="image/*"
                        class="form-control @error('image') is-invalid @enderror">
                </div>

                <div class="form-group col-md">
                    <button type="submit" class="btn btn-primary btn-block">Update</button>
                </div>
            </form>
        </div>
    </div>

@endsection
