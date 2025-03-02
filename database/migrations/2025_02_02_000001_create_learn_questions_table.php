<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateLearnQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('learn_questions', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('type')->comment('種類');
            $table->string('q')->comment('問題');
            $table->string('a')->comment('正解');
            $table->string('hint1')->nullable()->comment('ヒント1');
            $table->string('hint2')->nullable()->comment('ヒント2');
            $table->integer('tried')->comment('挑戦回数')->default(0);
            $table->integer('cleared')->comment('正解回数')->default(0);
            $table->integer('ratio')->comment('成功確率-パーセンテージx10')->default(0);
            $table->timestamp('tried_at')->nullable()->comment('最終挑戦日時');
            $table->timestamps();
            $table->boolean('hidden')->default(false)->comment('倉庫入りフラグ');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('learn_questions');
    }
}
