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

Route::get('/trigger_php_log', function () {
    // 自定义一条日志信息
    $message = "This is a custom error log message.";
    // 使用 error_log 函数写入日志
    error_log($message);
    // 写入一条错误日志
    Log::error('This is an error message');
});
