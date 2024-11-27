## CARA IMPORT POSTMAN

API: https://api.postman.com/collections/25142347-1e21ac7f-03ed-402a-b5e2-95ac5e7b34c9?access_key=PMAT-01JDNPS8MWYAHVVJQY0B74BXW9
File: MerahKuningHijau.postman_collection (terlampir)
- Buka POSTMAN bisa melalui website atau aplikasi.
- Masuk kesalah satu Workspace atau buat Workspace baru.
- Klik tombol Import pada halaman Workspace.
- Paste link API diatas atau upload file yang terlampir diatas.

## CARA INSTALL PROGRAM

git clone: https://github.com/Ar24F/backend-rizky-fadhillah.git
File: (terlampir pada branch main)
- Download atau git clone aplikasinya.
- Jika didownload Extract terlebih dahulu lalu letakkan folder htdocs atau sesuaikan dengan folder server anda.
- Buka terminal pada program lalu ketik "composer update" tanpa tanda petik.
- Setelah selesai sesuaikan database pada file .env lalu migrasi database dengan ketik pada terminal "php artisan migrate" tanpa tanda petik.
- Lakukan optimize jika dibutuhkan dengan ketik pada terminal "php artisan optimize" dan "php artisan optimize:clear" tanpa tanda petik.

## FLOW MARKETPLACE MERAHKUNINGHIJAU

Berikut adalah alur atau flow aplikasi API marketplace MERAHKUNINGHIJAU:
### Authentication
- Register (/register): Pengguna yang belum terdaftar dapat membuat akun baru.
- Login (/login): Pengguna yang sudah memiliki akun dapat melakukan login.
- Logout (/logout): Pengguna yang sudah login dapat melakukan logout.

### Authorization
- API menggunakan middleware auth:sanctum untuk memastikan semua endpoint yang memerlukan autentikasi hanya dapat diakses oleh pengguna yang sudah login.
- Middleware CheckRole digunakan untuk membatasi akses berdasarkan peran pengguna (Customer atau Merchant).

### Customer
**Profile Customer**
- GET /customer/profile: Mendapatkan data profil customer yang sedang login.
- PUT /customer/profile: Memperbarui data profil customer yang sedang login.

**Produk**
- GET /product/all: Mendapatkan semua produk yang tersedia di marketplace.

**Transaksi Customer**
- POST /transaksi: Membuat transaksi baru.
- GET /transaksi/pemesanan: Melihat daftar pemesanan/transaksi yang dilakukan oleh customer yang sedang login.

### Merchant
**Profil Merchant**
- GET /merchant/profile: Mendapatkan data profil merchant yang sedang login.
- PUT /merchant/profile: Memperbarui data profil merchant yang sedang login.

**Produk**
- GET /product: Mendapatkan daftar produk yang dimiliki oleh merchant.
- POST /product: Menambahkan produk baru oleh merchant.
- PUT /product/{product}: Memperbarui produk tertentu milik merchant.
- DELETE /product/{product}: Menghapus produk tertentu milik merchant.

**Transaksi Merchant**
- GET /transaksi: Mendapatkan daftar transaksi yang diterima oleh merchant.
- PUT /transaksi/{transaksi}: Memperbarui status atau detail transaksi tertentu.
- DELETE /transaksi/{transaksi}: Menghapus transaksi tertentu.

### General Flow (Untuk Semua Pengguna yang Login)
**Produk**
- GET /product/{product}: Mendapatkan detail produk tertentu berdasarkan ID.

**Transaksi**
- GET /transaksi/{transaksi}: Mendapatkan detail transaksi tertentu berdasarkan ID.
