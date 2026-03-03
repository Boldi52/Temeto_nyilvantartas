<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('elhunyt', function (Blueprint $table) {
            $table->dropForeign('elhunyt_halotti_anyakonyvi_kiv_foreign');
        });

        Schema::table('elhunyt', function (Blueprint $table) {
            $table->string('halotti_anyakonyvi_kiv', 255)->nullable()->change();
        });
    }

    public function down(): void
    {
        Schema::table('elhunyt', function (Blueprint $table) {
            $table->unsignedBigInteger('halotti_anyakonyvi_kiv')->nullable()->change();
        });

        Schema::table('elhunyt', function (Blueprint $table) {
            $table->foreign('halotti_anyakonyvi_kiv')
                ->references('id')
                ->on('dokumentum')
                ->nullOnDelete();
        });
    }
};
