<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('dokumentum', function (Blueprint $table) {
            $table->string('fajl_utvonal')->nullable()->after('leiras');
            $table->string('eredeti_fajlnev')->nullable()->after('fajl_utvonal');
            $table->string('mime_type', 100)->nullable()->after('eredeti_fajlnev');
        });
    }

    public function down(): void
    {
        Schema::table('dokumentum', function (Blueprint $table) {
            $table->dropColumn(['fajl_utvonal', 'eredeti_fajlnev', 'mime_type']);
        });
    }
};