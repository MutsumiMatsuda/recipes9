<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\Season;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* 旬コントローラー
*/
class SeasonController extends Controller {

  /**
  * 旬一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = Season::where('name', 'like', '%' . $q . '%')->orderBy('name', 'asc')->get();
    } else {
      $items = Season::all()->sortBy('name');
    }
    return view('season.index', compact('q', 'items'));
  }

  /**
  * 旬新規登録画面表示アクション
  */
  public function show(Request $request) {
    $season = Season::find($request->id);
    if ($season == null) {
      abort(404);
    }
    return view('season.show', compact('season'));
  }
}
