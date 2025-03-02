<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\Howto;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use App\Models\RecipeCategory;
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* タイプコントローラー
*/
class CategoryController extends Controller {

  /**
  * タイプ一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = RecipeCategory::where('name', 'like', '%' . $q . '%')->get();
    } else {
      $items = RecipeCategory::all();
    }
    return view('category.index', compact('q', 'items'));
  }

  /**
  * タイプ新規登録画面表示アクション
  */
  public function show(Request $request) {
    $category = RecipeCategory::find($request->id);
    if ($category == null) {
      abort(404);
    }
    return view('category.show', compact('category'));
  }
}
