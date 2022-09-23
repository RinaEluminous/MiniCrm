<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


// Route::post('register', [App\Http\Controllers\Api\PassportAuthController::class, 'register']);
// Route::post('login', [App\Http\Controllers\Api\PassportAuthController::class, 'login']);
// Route::middleware('auth:api')->group(function () {
//     Route::resource('posts', App\Http\Controllers\Api\PostController::class);
// });

Route::group(['middleware' => ['cors', 'json.response']], function () {

    // ...

    // public routes
    Route::post('/reg', [App\Http\Controllers\Api\PassportAuthController::class, 'reg'])->name('reg.api');
    Route::post('/login',[App\Http\Controllers\Api\PassportAuthController::class, 'login'])->name('login.api');
    // ...

});

Route::middleware('auth:api')->group(function () {
    // our routes to be protected will go in here
    Route::post('/logout', [App\Http\Controllers\Api\PassportAuthController::class, 'logout'])->name('logout.api');
    Route::resource('posts', App\Http\Controllers\Api\PostController::class);

    
});