<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Carbon\Carbon;

class QTagSeeder extends Seeder
{
  /**
   * Run the database seeds.
   *
   * @return void
   */
  public function run()
  {
    \DB::table('q_tags')->truncate();
    \DB::table('q_tags')->insert([
      [
        'name' => 'ビジネス',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '中 医 学',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '日常会話',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '旅　　行',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
    ]);
  }
}
