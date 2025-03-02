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
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* 調理法コントローラー
*/
class HowtoController extends Controller {

  /**
  * 調理法一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = Howto::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = Howto::all()->sortBy('name');
    }
    return view('user.howto.index', compact('q', 'items'));
  }

  /**
  * 調理法新規登録画面表示アクション
  */
  public function add(Request $request) {
    //dd($request->all());
    return view('user.howto.create');
  }

  /**
  * 調理法新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), Howto::$rules);
    if ($validator->fails()) {
      return redirect('user/howto/create')->withErrors($validator)->withInput();
    }

    $data = new Howto;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '調理法の追加に失敗しました');
      return redirect('user/howto/create')->withErrors($validator)->withInput();
    }

    return redirect('user/howto');
  }

  /**
  * 調理法編集画面表示アクション
  */
  public function edit(Request $request) {
    $howto = Howto::find($request->id);
    if ($howto == null) {
      abort(404);
    }
    return view('user.howto.edit', compact('howto'));
  }

  /**
  * 調理法更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), Howto::$rules);
    if ($validator->fails()) {
      return redirect('user/howto/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = Howto::find($request->id);
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '調理法の更新に失敗しました');
      return redirect('user/howto/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    return redirect('user/howto');
  }

    /**
    * 調理法削除アクション
    */
    public function delete(Request $request) {

      $data = Howto::find($request->id);

      // 該当レシピの値をリセット
      foreach($data->recipes as $recipe) {
        $recipe->howto_id = 0;
        $recipe->save();
      }

      // データを削除
      $data->delete();

      // 一覧へ戻る
      return redirect('user/howto');
    }
}
