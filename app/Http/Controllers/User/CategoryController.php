<?php

namespace App\Http\Controllers\User;

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
      $items = RecipeCategory::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = RecipeCategory::all()->sortBy('name');
    }
    return view('user.category.index', compact('q', 'items'));
  }

  /**
  * タイプ新規登録画面表示アクション
  */
  public function add(Request $request) {
    //dd($request->all());
    return view('user.category.create');
  }

  /**
  * タイプ新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), RecipeCategory::$rules);
    if ($validator->fails()) {
      return redirect('user/category/create')->withErrors($validator)->withInput();
    }

    $data = new RecipeCategory;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', 'タイプの追加に失敗しました');
      return redirect('user/category/create')->withErrors($validator)->withInput();
    }

    return redirect('user/category');
  }

  /**
  * タイプ新規登録画面表示アクション
  */
  public function edit(Request $request) {
    $category = RecipeCategory::find($request->id);
    if ($category == null) {
      abort(404);
    }
    return view('user.category.edit', compact('category'));
  }

  /**
  * タイプ新規更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), RecipeCategory::$rules);
    if ($validator->fails()) {
      return redirect('user/category/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = RecipeCategory::find($request->id);
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', 'タイプの更新に失敗しました');
      return redirect('user/category/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    return redirect('user/category');
  }


    /**
    * タイプ削除アクション
    */
    public function delete(Request $request) {

      $data = RecipeCategory::find($request->id);

      // 該当レシピの値をリセット
      foreach($data->recipes as $recipe) {
        $recipe->recipe_category_id = 0;
        $recipe->save();
      }

      // データを削除
      $data->delete();

      // 一覧へ戻る
      return redirect('user/category');
    }
}
