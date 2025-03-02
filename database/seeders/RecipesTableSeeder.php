<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RecipesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \DB::table('recipes')->insert([
        [
            'name' => '',
            'body' => '',
            'recipe_category_id' => '',
            'date_id' => '',
            'difficulty_id' => '',
            'howto_id' => '',
            'feeling_id' => '',
            'taste_id' => '',
            'created_at' => new DateTime(),
            'updated_at' => new DateTime(),
         ],
    ]);
    }
}
