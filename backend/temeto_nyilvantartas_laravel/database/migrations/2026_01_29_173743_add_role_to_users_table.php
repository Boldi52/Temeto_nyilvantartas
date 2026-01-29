<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        // Ha már van role oszlop, ne csináljon semmit
        if (Schema::hasColumn('users', 'role')) {
            return;
        }

        Schema::table('users', function (Blueprint $table) {
            $table->enum('role', ['admin', 'user'])->default('user')->after('password');
            $table->index('role');
        });
    }

    public function down(): void
    {
        // Ha nincs role oszlop, nincs mit törölni
        if (!Schema::hasColumn('users', 'role')) {
            return;
        }

        Schema::table('users', function (Blueprint $table) {
            // Az index a dropColumn-nal együtt el fog tűnni
            $table->dropColumn('role');
        });
    }
};
