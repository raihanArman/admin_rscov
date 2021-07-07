@extends('layouts.default')
@section('content')
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <div class="row">
            <div class="col-md-10 mr-3">
                <h6 class="m-0 font-weight-bold text-primary">Daftar Rumah Sakit</h6>
            </div>
            <div class="col">
                <a href="/rumahsakit/create" class="btn btn-success btn-sm content-">
                    <i class="fas fa-fw fa-plus"></i>Data Rumah Sakit</a>
            </div>
        </div>

    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                @if (session()->has('success'))
                    <div class="alert alert-success alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>{{ session()->get('success') }}</strong>
                    </div>
                @endif

                @if ($message = Session::get('error'))
                    <div class="alert alert-danger alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>{{ $message }}</strong>
                    </div>
                @endif

                @if ($message = Session::get('warning'))
                    <div class="alert alert-warning alert-block">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>{{ $message }}</strong>
                    </div>
                @endif
            </div>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Rumah Sakit</th>
                    <th>Gambar</th>
                    <th>Lokasi</th>
                    <th>No Telp</th>
                    <th class="text-right">Aksi</th>
                </tr>
            </thead>
            <tbody>
            @forelse ($data as $item)
                <tr>
                    {{-- <td style="display: none">{{ $item->id }}</td> --}}
                    <td> {{ $loop->iteration }} </td>
                    <td>{{ $item->nama }}</td>
                    <td> <img src="/images/{{ $item->gambar }}" alt="" style="width: 50%;"> </td>
                    <td>{{ $item->lokasi }}</td>
                    <td>{{ $item->telp }}</td>
                    <td class="text-center">
                        <a href="/rumahsakit/{{$item->id}}/edit" class="badge badge-success">Ubah</a>
                        <a href="/rumahsakit/{{$item->id}}/delete" class="badge badge-danger" onclick="return confirm('yakin hapus ?')">Hapus</a>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" class="text-center p-5">
                        Data Not Available
                    </td>
                </tr>
            @endforelse
            </tbody>
        </table>
    </div>
</div>

@endsection
