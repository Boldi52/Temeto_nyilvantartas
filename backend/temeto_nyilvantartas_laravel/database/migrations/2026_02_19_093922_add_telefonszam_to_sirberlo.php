<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('sirberlo', function (Blueprint $table) {
            $table->string('telefonszam')->nullable()->after('email_cim');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sirberlo', function (Blueprint $table) {
            $table->dropColumn('telefonszam');
        });
    }
};