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
        Schema::create('befizetes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sirberlo_id')->constrained('sirberlo')->cascadeOnDelete();
            $table->decimal('osszeg', 10, 2);
            $table->integer('hossza')->nullable();
            $table->date('datum')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('befizetes');
    }
};
