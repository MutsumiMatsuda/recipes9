<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;

class MigrationsSeeder extends Seeder
{
  /**
   * Run the database seeds.
   *
   * @return void
   */
  public function run()
  {
    \DB::table('migrations')->insert([
      ['migration' => '2014_10_12_000000_create_users_table', 'batch' => 1],
      ['migration' => '2014_10_12_100000_create_password_resets_table', 'batch' => 1],
      ['migration' => '2021_09_08_014221_create_nutrients_table', 'batch' => 1],
      ['migration' => '2021_09_08_025056_create_material_categories_table', 'batch' => 1],
      ['migration' => '2021_09_08_104855_create_materials_table', 'batch' => 1],
      ['migration' => '2021_09_11_004409_create_nutrient_materials_table', 'batch' => 1],
      ['migration' => '2021_09_15_015021_create_recipe_categories_table', 'batch' => 1],
      ['migration' => '2021_09_15_232130_create_howtos_table', 'batch' => 1],
      ['migration' => '2021_10_04_083637_create_menus_table', 'batch' => 1],
      ['migration' => '2021_10_09_071036_create_seasonings_table', 'batch' => 1],
      ['migration' => '2021_11_02_005233_create_recipes_table', 'batch' => 1],
      ['migration' => '2021_11_02_005234_create_recipe_materials_table', 'batch' => 1],
      ['migration' => '2021_12_01_000000_create_recipe_countries_table', 'batch' => 1],
      ['migration' => '2021_12_02_000000_create_mainsubs_table', 'batch' => 1],
      ['migration' => '2022_02_04_000001_create_seasons_table', 'batch' => 1],
      ['migration' => '2022_02_04_000002_create_tags_table', 'batch' => 1],
      ['migration' => '2022_02_04_000003_create_recipe_tags_table', 'batch' => 1],
    ]);
  }
}
