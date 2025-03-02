<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Recipe;
use App\Models\RecipeCategory;
use App\Models\Difficulty;
use App\Models\Feeling;
use App\Models\Howto;
use App\Models\Material;
use App\Menu;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\Taste;


class TopPageController extends Controller
{
  public function index(Request $request){
    $keyword = $request->keyword;
    $keywords = array();
    $recipes = array();
    $recipe_categories = array();
    $difficulties = array();
    $feelings = array();
    $how_tos = array();
    $materials = array();
    $menus = array();
    $nutrients = array();
    $nutrient_materials = array();
    $tastes = array();
    return view('toppage', compact('keywords','keyword','recipes','recipe_categories', 'difficulties', 'feelings', 'how_tos', 'materials', 'menus', 'nutrients', 'nutrient_materials','tastes'));
  }

	public function test(Request $req) {
	  $rs = Material::getByCategory(3);
	  echo count($rs) . "件</br>";
	  foreach($rs as $item) {
	    echo $item->name . "</br>";
	  }
	  exit();
	}
}
