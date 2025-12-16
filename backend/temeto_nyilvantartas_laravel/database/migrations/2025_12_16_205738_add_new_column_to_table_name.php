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
            $table->string('email_cim')->nullable(); // Add hozzá az új mezőt
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sirberlo', function (Blueprint $table) {
            $table->dropColumn(columns: 'email_cim'); // Távolítsd el a mezőt, ha visszagörgetés történik
        });
    }
};
