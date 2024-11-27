<?php

namespace App\Http\Controllers;

use App\Models\Transaksi;
use App\Models\Product;
use App\Http\Requests\Transaksi\StoreTransaksiRequest;
use App\Http\Requests\Transaksi\UpdateTransaksiRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Auth;

class TransaksiController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $transaksis = Transaksi::with('customer.user')
            ->whereHas('product', function ($query) use ($user) {
                $query->where('merchant_id', $user->merchant->id);
            })
        ->get();
        return response()->json([
            "data" => $transaksis
        ]);
    }

    public function store(StoreTransaksiRequest $request)
    {
        $product = Product::findOrFail($request->product_id);
        $user = Auth::user();

        $total = intval($product->harga * str_replace('.', '', $request->quantity));

        $ongkir = false;
        $diskon = false;
        if ($total > 50000) {
            $ongkir = true;
            $diskon = true;
        } elseif ($total > 15000) {
            $ongkir = true;
            $total -= $total * 0.1;
        }

        $ongkir_cost = 0;
        if ($ongkir) {
            $cek_ongkir = Http::withHeaders([
                'key' => '42c60c30a359b97a81ea85d4cc34e9a5',
            ])->post('https://api.rajaongkir.com/starter/cost', [
                'origin' => '115', //Depok 
                'destination' => $user->customer->kota,
                'weight' => intval(str_replace('.', '', $request->quantity) * $product->berat),
                'courier' => $request->pengiriman
            ])->json();

            if (isset($cek_ongkir['rajaongkir']['results'][0]['costs'][0]['cost'][0]['value'])) {
                $ongkir_cost = $cek_ongkir['rajaongkir']['results'][0]['costs'][0]['cost'][0]['value'];
            }
        }

        $transaksi = Transaksi::create([
            'customer_id' => $user->customer->id,
            'product_id' => $request->product_id,
            'quantity' => $request->quantity,
            'discount' => $diskon ? 10 : 0,
            'ongkir' => $ongkir ? 0 : $ongkir_cost,
            'total' => $ongkir ? $ongkir_cost + $total : $total,
            'free_shipping' => $ongkir,
            'pengiriman' => $request->pengiriman,
        ]);

        return response()->json([
            'message' => 'Data transaksi berhasil ditambahkan.',
            'data' => $transaksi
        ]);
    }

    public function show(Transaksi $transaksi)
    {
        $transaksi->load(['customer.user']);

        return response()->json([
            'data' => $transaksi
        ]);
    }

    public function update(UpdateTransaksiRequest $request, Transaksi $transaksi)
    {
        $product = Product::findOrFail($request->product_id);
        $user = Auth::user();

        $total = intval($product->harga * str_replace('.', '', $request->quantity));

        $ongkir = false;
        $diskon = false;
        if ($total > 50000) {
            $ongkir = true;
            $diskon = true;
        } elseif ($total > 15000) {
            $ongkir = true;
            $total -= $total * 0.1;
        }

        $ongkir_cost = 0;
        if ($ongkir) {
            $cek_ongkir = Http::withHeaders([
                'key' => '42c60c30a359b97a81ea85d4cc34e9a5',
            ])->post('https://api.rajaongkir.com/starter/cost', [
                'origin' => '115', //Depok 
                'destination' => $user->customer->kota,
                'weight' => intval(str_replace('.', '', $request->quantity) * $product->berat),
                'courier' => $request->pengiriman
            ])->json();

            if (isset($cek_ongkir['rajaongkir']['results'][0]['costs'][0]['cost'][0]['value'])) {
                $ongkir_cost = $cek_ongkir['rajaongkir']['results'][0]['costs'][0]['cost'][0]['value'];
            }
        }

        $transaksi->update([
            'product_id' => $request->product_id,
            'quantity' => $request->quantity,
            'discount' => $diskon ? 10 : 0,
            'ongkir' => $ongkir ? 0 : $ongkir_cost,
            'total' => $ongkir ? $ongkir_cost + $total : $total,
            'free_shipping' => $ongkir,
            'pengiriman' => $request->pengiriman,
        ]);

        return response()->json([
            'message' => 'Data transaksi berhasil diubah.',
            'data' => $transaksi
        ]);
    }

    public function destroy(Transaksi $transaksi)
    {
        $transaksi->delete();
        return response()->json([
            'message' => 'Data transaksi berhasil dihapus.'
        ]);
    }

    public function pemesanan()
    {
        $user = Auth::user();
        $transaksis = Transaksi::with('customer')->where('customer_id', $user->customer->id)->get();
        return response()->json([
            "data" => $transaksis
        ]);
    }
}
