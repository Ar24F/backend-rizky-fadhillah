<?php

namespace App\Models;

use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasApiTokens;

    protected $fillable = [
        'customer_id',
        'product_id',
        'quantity',
        'discount',
        'ongkir',
        'total',
        'free_shipping',
        'pengiriman'
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
