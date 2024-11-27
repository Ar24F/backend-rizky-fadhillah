<?php

namespace App\Http\Requests\Product;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'merchant_id' => ['nullable', 'integer', 'exists:merchants,id'],
            'nama' => ['required', 'string', 'max:255'],
            'deskripsi' => ['nullable', 'string'],
            'harga' => ['required', 'numeric', 'min:0'],
            'kondisi' => ['required', 'in:Baru,Bekas - Seperti Baru,Bekas'],
            'berat' => ['required', 'numeric', 'min:0'],
            'kategori' => ['required', 'string'],
            'upload' => ['nullable', 'image', 'max:1024']
        ];
    }
}
