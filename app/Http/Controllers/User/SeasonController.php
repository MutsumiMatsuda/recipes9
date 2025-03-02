<?php

namespace App\Http\Controllers\User;

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
      $items = Season::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = Season::all()->sortBy('name');
    }
    return view('user.season.index', compact('q', 'items'));
  }

  /**
  * 旬新規登録画面表示アクション
  */
  public function add(Request $request) {
    //dd($request->all());
    return view('user.season.create');
  }

  /**
  * 旬新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), Season::$rules);
    if ($validator->fails()) {
      return redirect('user/season/create')->withErrors($validator)->withInput();
    }

    $data = new Season;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '旬の追加に失敗しました');
      return redirect('user/season/create')->withErrors($validator)->withInput();
    }

    return redirect('user/season');
  }

  /**
  * 旬編集画面表示アクション
  */
  public function edit(Request $request) {
    $season = Season::find($request->id);
    if ($season == null) {
      abort(404);
    }
    return view('user.season.edit', compact('season'));
  }

  /**
  * 旬更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), Season::$rules);
    if ($validator->fails()) {
      return redirect('user/season/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = Season::find($request->id);
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '旬の更新に失敗しました');
      return redirect('user/season/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    return redirect('user/season');
  }

    /**
    * 旬削除アクション
    */
    public function delete(Request $request) {

      $data = Season::find($request->id);

      // 該当レシピの値をリセット
      foreach($data->recipes as $recipe) {
        $recipe->season_id = 0;
        $recipe->save();
      }

      // データを削除
      $data->delete();

      // 一覧へ戻る
      return redirect('user/season');
    }
}
