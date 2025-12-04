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
        Schema::create('elhunyts', function (Blueprint $table) {
            $table->id();
            $table->string('nev');
            $table->date('szuletesi_datum');
            $table->date('halal_datum');
            $table->string('anyja_neve');
            $table->foreignId(column: 'sirhely_id')->constrained('sirhely');
            $table->foreignId(column: 'halotti_anyakonyvi_kiv_id')->constrained('dokumentum');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('elhunyts');
    }
};
