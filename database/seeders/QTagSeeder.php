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
        'name' => 'ビ',
        'title' => 'ビジネス',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '医',
        'title' => '中医学',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '常',
        'title' => '日常会話',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '旅',
        'title' => '旅行',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => 'EC',
        'title' => 'ECサイト',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
      [
        'name' => '★',
        'title' => 'お気に入り',
        'created_at' => new Carbon(),
        'updated_at' => new Carbon(),
      ],
    ]);
  }
}
