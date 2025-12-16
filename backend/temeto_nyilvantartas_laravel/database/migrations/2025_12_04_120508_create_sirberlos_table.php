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
        Schema::create('sirberlo', function (Blueprint $table) {
            $table->id(); 
            $table->string('nev');
            $table->string('email_cim');
            $table->string('kozterulet_neve');
            
           
            $table->foreignId('kozterulet_tipus_id')
                  ->nullable()
                  ->constrained('kozterulet_tipus')
                  ->nullOnDelete();
        
            
            $table->unsignedBigInteger('ir_szam');
            $table->foreign('ir_szam')
                  ->references('ir_szam')
                  ->on('telepules')
                  ->restrictOnDelete(); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sirberlo');
    }
};
