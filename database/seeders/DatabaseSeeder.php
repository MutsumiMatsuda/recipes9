<?php

use Illuminate\Database\Seeder;
use App\Models\LearnQuestion;
use Carbon\Carbon;
use Database\Seeders\NutrientsTableSeeder;
use Database\Seeders\MaterialcategoriesTableSeeder;
use Database\Seeders\MaterialsTableSeeder;
use Database\Seeders\NutrientMaterialsTableSeeder;
use Database\Seeders\RecipeCategoriesTableSeeder;
use Database\Seeders\DifficultiesTableSeeder;
use Database\Seeders\MaterialrecipesTableSeeder;
use Database\Seeders\TastesTableSeeder;
use Database\Seeders\FeelingsTableSeeder;
use Database\Seeders\HowtosTableSeeder;
use Database\Seeders\MenuSeeder;
use Database\Seeders\RecipeCountryTableSeeder;
use Database\Seeders\MigrationsSeeder;
use Database\Seeders\LearnQuestionsTableSeeder;
use Database\Seeders\LearnQuestionsSeeder2;
use Database\Seeders\QTagSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        //$this->call(NutrientsTableSeeder::class);
        //$this->call(MaterialcategoriesTableSeeder::class);
        //$this->call(MaterialsTableSeeder::class);
        //$this->call(NutrientMaterialsTableSeeder::class);
        //$this->call(RecipeCategoriesTableSeeder::class);
        //$this->call(DifficultiesTableSeeder::class);
        //$this->call(MaterialrecipesTableSeeder::class);
        //$this->call(TastesTableSeeder::class);
        //$this->call(FeelingsTableSeeder::class);
        //$this->call(HowtosTableSeeder::class);
        //$this->call(MenuSeeder::class);
        //$this->call(RecipeCountryTableSeeder::class);
        //$path = 'database/sql/dump07.sql';
        //\DB::unprepared(file_get_contents($path));
        //$this->call(MigrationsSeeder::class);
        $this->call(LearnQuestionsTableSeeder::class);
        $this->call(LearnQuestionsSeeder2::class);
        $this->call(QTagSeeder::class);
    }
}
