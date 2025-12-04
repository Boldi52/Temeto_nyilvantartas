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
        Schema::create('sirberlos', function (Blueprint $table) {
            $table->id();
            $table->string('nev');
            $table->string('kozterulet_neve');
            $table->foreignId(column: 'kozterulet_tipusa_id')->constrained('kozterulet_tipus');
            $table->foreignId(column: 'iranyito_szam')->constrained('telepules');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sirberlos');
    }
};
