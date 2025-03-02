<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RecipeCategoriesTableSeeder extends Seeder
{

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('recipe_categories')->insert([
        [
            'name' => '魚料理',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => 'スープ類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => 'サラダ類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => '麺・ごはん類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => '肉類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => 'デザート類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => '卵類',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => '箸休め',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
        [
            'name' => '行事用',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],

    ]);
    }
}
