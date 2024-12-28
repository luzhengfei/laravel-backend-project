<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    // 输出环境变量
    $value = env('APP_NAME', false);
    echo $value;
    return view('welcome');
});

Route::get('/greeting', function () {
    // 写入一条错误日志
    Log::error('This is an error message');
});
