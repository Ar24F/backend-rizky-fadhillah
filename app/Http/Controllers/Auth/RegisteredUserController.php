<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Merchant;
use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class RegisteredUserController extends Controller
{
    public function store(Request $request)
    {
        $request->validate([
            'nama' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'role' => ['required', 'string'],
            'no_hp' => ['required', 'string', 'max:20'],
            'alamat' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string', 'max:255'],
            'kota' => ['nullable', 'string', 'max:255'], 
        ]);

        $user = User::create([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => Hash::make($request->string('password')),
            'role' => $request->role,
        ]);

        if ($request->role == 'Merchant') {
            Merchant::create([
                'user_id' => $user->id,
                'no_hp' => str_replace('-', '', $request->no_hp),
                'alamat' => $request->alamat
            ]);
        } elseif ($request->role == 'Customer') {

            Customer::create([
                'user_id' => $user->id,
                'no_hp' => str_replace('-', '', $request->no_hp),
                'alamat' => $request->alamat,
                'provinsi' => $request->provinsi,
                'kota' => $request->kota
            ]);
        }

        $token = $user->createToken($user->nama);

        return response()->json([
            "message" => "Registrasi Berhasil",
            "token" => $token->plainTextToken,
            "data" => $user
        ]);
    }
}
