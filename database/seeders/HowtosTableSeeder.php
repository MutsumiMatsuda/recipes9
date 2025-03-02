<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class HowtosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('howtos')->insert([
        [
            'name' => '圧力鍋',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => 'オーブン',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => 'レンジ',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
    ]);
    }
}
