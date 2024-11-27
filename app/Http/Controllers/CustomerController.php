<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;

use Illuminate\Support\Facades\Auth;

class CustomerController extends Controller
{
    public function profile()
    {
        $user = User::with('customer')->find(Auth::id());
        return response()->json([
            'data' => $user
        ]);
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        $request->validate([
            'nama' => ['sometimes', 'required', 'string', 'max:255'],
            'email' => ['sometimes', 'required', 'string', 'lowercase', 'email', 'max:255', Rule::unique('users', 'email')->ignore($user->id)],
            'password' => ['sometimes', 'required'],
            'no_hp' => ['sometimes', 'required', 'string', 'max:20'],
            'alamat' => ['nullable', 'string'],
            'provinsi' => ['nullable', 'string', 'max:255'],
            'kota' => ['nullable', 'string', 'max:255'], 
        ]);

        $user->update([
            'nama' => $request->nama,
            'email' => $request->email,
            'password' => $request->filled('password') ? Hash::make($request->string('password')) : $user->password
        ]);
        
        $user->customer->update([
            'no_hp' => str_replace('-', '', $request->no_hp),
            'alamat' => $request->alamat,
            'provinsi' => $request->provinsi,
            'kota' => $request->kota
        ]);

        return response()->json([
            'message' => 'Data profile berhasil diubah.',
            'data' => $user
        ]);
    }
}
