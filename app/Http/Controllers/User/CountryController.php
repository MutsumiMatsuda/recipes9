<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\RecipeCountry;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use Auth;
use Storage;
use Utl;
use Illuminate\Support\Facades\Validator;

/**
* 国別料理コントローラー
*/
class CountryController extends Controller {

  /**
  * 調理法一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = RecipeCountry::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = RecipeCountry::all()->sortBy('name');
    }
    return view('user.country.index', compact('q', 'items'));
  }

  /**
  * 調理法新規登録画面表示アクション
  */
  public function add(Request $request) {
    //dd($request->all());
    return view('user.country.create');
  }

  /**
  * 調理法新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), RecipeCountry::$rules);
    if ($validator->fails()) {
      return redirect('user/country/create')->withErrors($validator)->withInput();
    }

    $data = new RecipeCountry;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '調理法の追加に失敗しました');
      return redirect('user/country/create')->withErrors($validator)->withInput();
    }

    return redirect('user/country');
  }

  /**
  * 調理法新規登録画面表示アクション
  */
  public function edit(Request $request) {
    $country = RecipeCountry::find($request->id);
    if ($country == null) {
      abort(404);
    }
    return view('user.country.edit', compact('country'));
  }

  /**
  * 調理法更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), RecipeCountry::$rules);
    if ($validator->fails()) {
      return redirect('user/country/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = RecipeCountry::find($request->id);
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '調理法の更新に失敗しました');
      return redirect('user/country/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    return redirect('user/country');
  }

  /**
  * 調理法削除アクション
  */
  public function delete(Request $request) {

    $data = RecipeCountry::find($request->id);

    // 該当レシピの値をリセット
    foreach($data->recipes as $recipe) {
      $recipe->recipe_country_id = 0;
      $recipe->save();
    }

    // データを削除
    $data->delete();

    // 一覧へ戻る
    return redirect('user/country');
  }
}
