<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class NutrientsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('nutrients')->insert([
        [
            'name' => 'マグネシウム',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => 'カリウム',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'クロム',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '鉄',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ヨウ素',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ビタミンC',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ビタミンA',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ビタミンB1',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ビタミンB2',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'リン',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'カルシウム',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ビタミンD',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ビタミンE',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ナトリウム',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '葉酸',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'たんぱく質',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '食物繊維',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'モリブデン',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'ペクチン',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],

    ]);
    }
}
