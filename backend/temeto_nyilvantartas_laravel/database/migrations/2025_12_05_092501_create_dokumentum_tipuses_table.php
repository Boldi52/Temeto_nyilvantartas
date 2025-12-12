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
        Schema::create('dokumentum_tipus', function (Blueprint $table) {
            $table->id();
            $table->string('tipus_elnevezese');
            $table->foreignId('dokumentum_id')->nullable()
                  ->constrained('dokumentum')->cascadeOnDelete();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('telepules_tipus');
    }
};
