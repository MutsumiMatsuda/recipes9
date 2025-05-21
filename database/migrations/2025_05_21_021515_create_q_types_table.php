<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('q_types', function (Blueprint $table) {
            $table->id();
            $table->string('name')->comment('問題種別名');
            $table->string('icon')->comment('アイコンの文字列');
            $table->integer('order')->comment('表示順');
            $table->string('col')->nullable()->comment('色');
            $table->string('bk_col')->nullable()->comment('背景色');
            $table->timestamps();
            $table->boolean('hidden')->nullable()->default(null)->comment('非表示フラグ');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('q_types');
    }
};
