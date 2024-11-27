<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasApiTokens;

    protected $fillable = [
        'merchant_id',
        'nama',
        'deskripsi',
        'harga',
        'kondisi',
        'berat',
        'kategori',
        'foto'
    ];

    public function merchant()
    {
        return $this->belongsTo(Merchant::class);
    }

    public function transaksis()
    {
        return $this->hasMany(Transaksi::class);
    }
}
