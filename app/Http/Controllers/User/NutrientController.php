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
use App\Models\Seasoning;
use Auth;
use Storage;
use Illuminate\Support\Facades\Validator;

/**
* 栄養素コントローラー
*/
class NutrientController extends Controller {

  /**
  * 栄養素一覧表示アクション
  */
  public function index(Request $request) {
    $q = $request->q;
    if ($q != null) {
      $items = Nutrient::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = Nutrient::all()->sortBy('name');
    }
    return view('user.nutrient.index', compact('q', 'items'));
  }

  /**
  * 栄養素新規登録画面表示アクション
  */
  public function add() {
    return view('user.nutrient.create');
  }

  /**
  * 栄養素新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), Nutrient::$rules);
    if ($validator->fails()) {
      return redirect('user/nutrient/create')->withErrors($validator)->withInput();
    }

    $data = new Nutrient;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '栄養素の追加に失敗しました');
      return redirect('user/nutrient/create')->withErrors($validator)->withInput();
    }

    return redirect('user/nutrient');
  }

  /**
  * 栄養素新規登録画面表示アクション
  */
  public function edit(Request $request) {
    $nutrient = Nutrient::find($request->id);
    if ($nutrient == null) {
      abort(404);
    }
    $materialCategories = MaterialCategory::all();
    $jsAry = self::mkJsMatAry($materialCategories);
    return view('user.nutrient.edit', compact('nutrient', 'materialCategories', 'jsAry'));
  }

  /**
  * 栄養素新規更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), Nutrient::$rules);
    if ($validator->fails()) {
      return redirect('user/nutrient/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = Nutrient::find($request->id);
    $form = $request->all();
    $material_id = $request->material_id;

    unset($form['submit']);
    unset($form['_token']);
    unset($form['material_id']);
    unset($form['material_category_id']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '栄養素の更新に失敗しました');
      return redirect('user/nutrient/edit?id=' . $request->id)->withErrors($validator)->withInput();
    } else if (null != $material_id) {
        // 指定された材料に栄養素の関連付けを追加する
        $item = new NutrientMaterial;
        $item->nutrient_id = $data->id;
        $item->material_id = $material_id;
        if (!$item->save()) {
          $validator->errors()->add('fatal', '指定された材料に栄養素の関連付けを追加できませんでした');
          return redirect('user/nutrient/edit?id=' . $request->id)->withErrors($validator)->withInput();
        }
    }
    return redirect('user/nutrient');
  }
}
