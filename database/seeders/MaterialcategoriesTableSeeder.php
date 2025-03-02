<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class MaterialcategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('material_categories')->insert([
        [
            'name' => '豆類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => '穀類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '野菜',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '果実・香辛料類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'きのこ・海藻',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '魚',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '肉',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '嗜好品',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '甘味類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '乾物',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '油脂・調味料',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '乳類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '卵類・たんぱく質',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
    ]);
    }
}
