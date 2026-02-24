<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SiteController;

Route::get('/welcome', function () {
    return view('welcome');
});

Route::get('/hello/{name}', function ($name) {
    return "Hello, $name!";
});

Route::get('/', [SiteController::class, 'index']);
