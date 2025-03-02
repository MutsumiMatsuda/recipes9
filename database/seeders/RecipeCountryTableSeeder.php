<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RecipeCountryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      \DB::table('recipe_countries')->insert([
        [
            'name' => '和食',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '洋食',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '中華',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'エスニック',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
      ]);

      \DB::table('mainsubs')->insert([
        [
            'name' => '主菜',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => '副菜',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
        [
            'name' => 'その他',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
        ],
      ]);
    }
}
