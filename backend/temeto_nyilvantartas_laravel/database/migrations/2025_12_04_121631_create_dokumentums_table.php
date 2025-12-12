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
        Schema::create('dokumentum', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sirhely_id')->nullable()->constrained('sirhely')->nullOnDelete();
            $table->foreignId('sirberlo_id')->nullable()->constrained('sirberlo')->nullOnDelete();
            $table->string('tipus')->nullable();
            $table->date('datum')->nullable();
            $table->text('leiras')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dokumentum');
    }
};
