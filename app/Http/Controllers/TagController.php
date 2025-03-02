<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\Tag;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* 検索タグコントローラー
*/
class TagController extends Controller {

  /**
  * 検索タグ一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = Tag::where('name', 'like', '%' . $q . '%')->orderBy('name', 'asc')->get();
    } else {
      $items = Tag::all()->sortBy('name');
    }
    return view('tag.index', compact('q', 'items'));
  }

  /**
  * 検索タグ新規登録画面表示アクション
  */
  public function show(Request $request) {
    $tag = Tag::find($request->id);
    if ($tag == null) {
      abort(404);
    }
    return view('tag.show', compact('tag'));
  }
}
