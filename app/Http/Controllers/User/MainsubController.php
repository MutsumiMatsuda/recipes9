<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\Mainsub;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* 主菜/副菜コントローラー
*/
class MainsubController extends Controller {

  /**
  * 主菜/副菜一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = Mainsub::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = Mainsub::all()->sortBy('name');
    }
    return view('user.mainsub.index', compact('q', 'items'));
  }

  /**
  * 主菜/副菜新規登録画面表示アクション
  */
  public function add(Request $request) {
    //dd($request->all());
    return view('user.mainsub.create');
  }

  /**
  * 主菜/副菜新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), Mainsub::$rules);
    if ($validator->fails()) {
      return redirect('user/mainsub/create')->withErrors($validator)->withInput();
    }

    $data = new Mainsub;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '調理法の追加に失敗しました');
      return redirect('user/mainsub/create')->withErrors($validator)->withInput();
    }

    return redirect('user/mainsub');
  }

  /**
  * 主菜/副菜編集画面表示アクション
  */
  public function edit(Request $request) {
    $mainsub = Mainsub::find($request->id);
    if ($mainsub == null) {
      abort(404);
    }
    return view('user.mainsub.edit', compact('mainsub'));
  }

  /**
  * 主菜/副菜更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), Mainsub::$rules);
    if ($validator->fails()) {
      return redirect('user/mainsub/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = Mainsub::find($request->id);
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '調理法の更新に失敗しました');
      return redirect('user/mainsub/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    return redirect('user/mainsub');
  }


  /**
  * 主菜/副菜削除アクション
  */
  public function delete(Request $request) {

    $data = Mainsub::find($request->id);

    // 該当レシピの値をリセット
    foreach($data->recipes as $recipe) {
      $recipe->mainsub_id = 0;
      $recipe->save();
    }

    // データを削除
    $data->delete();

    // 一覧へ戻る
    return redirect('user/mainsub');
  }
}
