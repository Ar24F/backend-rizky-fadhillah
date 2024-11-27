<?php

namespace App\Http\Requests\Product;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'merchant_id' => ['nullable', 'integer', 'exists:merchants,id'],
            'nama' => ['sometimes', 'required', 'string', 'max:255'],
            'deskripsi' => ['nullable', 'string'],
            'harga' => ['sometimes', 'required', 'numeric', 'min:0'],
            'kondisi' => ['sometimes', 'required', 'in:Baru,Bekas - Seperti Baru,Bekas'],
            'berat' => ['sometimes', 'required', 'numeric', 'min:0'],
            'kategori' => ['sometimes', 'required', 'string'],
            'upload' => ['nullable', 'image', 'max:1024']
        ];
    }
}
