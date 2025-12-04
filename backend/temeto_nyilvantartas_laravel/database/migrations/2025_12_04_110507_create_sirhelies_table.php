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
        Schema::create('sirhelies', function (Blueprint $table) {
            $table->id();
            $table->integer('sor_id');
            $table->string('sirkod');
            $table->string('allapot');
            $table->string('foto');
            $table->integer('sirberlo_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sirhelies');
    }
};
