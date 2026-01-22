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
        Schema::create('sirhely', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sor_id')->constrained('sor')->restrictOnDelete();
            $table->string('allapot')->nullable();
            $table->string('foto')->nullable();
            $table->foreignId('sirberlo_id')->nullable()
                  ->constrained('sirberlo')->nullOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sirhely');
    }
};
