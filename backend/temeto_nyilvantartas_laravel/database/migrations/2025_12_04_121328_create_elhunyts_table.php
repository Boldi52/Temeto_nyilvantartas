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
        Schema::create('elhunyt', function (Blueprint $table) {
            $table->id();
            $table->string('nev');
            $table->date('szul_datum')->nullable();
            $table->date('halal_datuma')->nullable();
            $table->string('anyja_neve')->nullable();
            $table->foreignId('sirhely_id')->nullable()
                  ->constrained('sirhely')->nullOnDelete();
            $table->foreignId('halotti_anyakonyvi_kiv')->nullable()
                  ->constrained('dokumentum')->nullOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('elhunyt');
    }
};
