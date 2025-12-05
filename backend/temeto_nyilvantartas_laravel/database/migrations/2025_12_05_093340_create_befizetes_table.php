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
            $table->integer('osszeg');
            $table->date('hossz');
            $table->date('datum');
            $table->foreignId(column: 'sirberlo_id')->constrained('sirberlo');
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
