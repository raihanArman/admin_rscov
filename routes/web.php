<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');
Route::get('/rumahsakit', [\App\Http\Controllers\RumahSakitController::class, 'index'])->name('rumahsakit');
Route::get('/rumahsakit/create', 'RumahSakitController@create');
Route::post('/rumahsakit/insert', 'RumahSakitController@insert');
Route::get('/rumahsakit/{id}/edit', [\App\Http\Controllers\RumahSakitController::class, 'edit'])->name('rumahsakit.edit');
Route::post('/rumahsakit/{id}/update',  [\App\Http\Controllers\RumahSakitController::class, 'update'])->name('rumahsakit.update');
Route::get('/rumahsakit/{id}/delete', [\App\Http\Controllers\RumahSakitController::class, 'delete'])->name('rumahsakit.delete');
