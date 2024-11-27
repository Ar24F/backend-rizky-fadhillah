<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AuthenticatedSessionController extends Controller
{
    public function store(LoginRequest $request)
    {
        $request->authenticate();
        
        $user = Auth::user();

        $token = $user->createToken($user->nama);

        return response()->json([
            "message" => "Selamat datang ".$user->nama,
            "token" => $token->plainTextToken,
            "data" => $user
        ]);
    }

    public function destroy(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            "message" => "Berhasil logout!"
        ]);
    }
}
