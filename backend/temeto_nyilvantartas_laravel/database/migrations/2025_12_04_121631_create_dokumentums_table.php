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
        Schema::create('dokumentums', function (Blueprint $table) {
            $table->id();
            $table->foreignId(column: 'sirhely_id')->constrained('sirhely');
            $table->string('tipus');
            $table->date('datum');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dokumenta');
    }
};
