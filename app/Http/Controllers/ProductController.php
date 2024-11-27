<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Http\Requests\Product\StoreProductRequest;
use App\Http\Requests\Product\UpdateProductRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::where('merchant_id', auth()->id())->get();
        return response()->json([
            "data" => $products
        ]);
    }

    public function store(StoreProductRequest $request)
    {
        $fileName = 'default.jpg';
        if ($request->hasFile('upload')) {
            $file = $request->file('upload');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->storeAs('public/images/product', $fileName);
        }

        $product = Product::create([
            'merchant_id' => auth()->id(),
            'nama' => $request->nama,
            'deskripsi' => $request->deskripsi,
            'harga' => str_replace('.', '', $request->harga),
            'kondisi' => $request->kondisi,
            'berat' => str_replace('.', '', $request->berat),
            'kategori' => $request->kategori,
            'foto' => $fileName
        ]);

        return response()->json([
            'message' => 'Data product berhasil ditambahkan.',
            'data' => $product
        ]);
    }

    public function show(Product $product)
    {
        return response()->json([
            'data' => $product
        ]);
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        $fileName = $product->foto;
        if ($request->hasFile('upload')) {
            if ($product->foto && $product->foto !== 'default.jpg') {
                Storage::delete('public/images/product/' . $product->foto);
            }
            $file = $request->file('upload');
            $fileName = time() . '.' . $file->getClientOriginalExtension();
            $file->storeAs('public/images/product', $fileName);
        }

        $product->update([
            'merchant_id' => auth()->id(),
            'nama' => $request->input('nama'),
            'deskripsi' => $request->input('deskripsi'),
            'harga' => str_replace('.', '', $request->input('harga')),
            'kondisi' => $request->input('kondisi'),
            'berat' => str_replace('.', '', $request->berat),
            'kategori' => $request->input('kategori'),
            'foto' => $fileName
        ]);

        return response()->json([
            'message' => 'Data product berhasil diubah.',
            'data' => $product
        ]);
    }

    public function destroy(Product $product)
    {
        $product->delete();
        return response()->json([
            'message' => 'Data product berhasil dihapus.'
        ]);
    }

    public function allproduct()
    {
        $products = Product::all();
        return response()->json([
            "data" => $products
        ]);
    }
}
