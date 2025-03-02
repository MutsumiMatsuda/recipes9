<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\RecipeCategory;
use App\Models\Menu;
use App\Models\Nutrient;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use App\Models\NutrientMaterial;
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* 材料コントローラー
*/
class MaterialController extends Controller {

  /**
  * 栄養素一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      //$items = Material::where('name', 'like', '%' . $q . '%')->orWhere('name2', 'like', '%' . $q . '%')->get();
      $items = Material::where('name', 'like', '%' . $q . '%')->orderBy('name', 'asc')->get();
    } else {
      $items = Material::all()->sortBy('name');
    }
    return view('material.index', compact('q', 'items'));
  }

  public function show(Request $request) {
    $material = Material::find($request->id);
    if ($material == null) {
      abort(404);
    }
    //dd($material->nutrients->toArray());
    $categories = MaterialCategory::all();
    $nutrients = Nutrient::all();

    return view('material.show', compact('material', 'categories', 'nutrients'));
  }
}
