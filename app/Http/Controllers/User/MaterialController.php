<?php

namespace App\Http\Controllers\User;

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
use App\Models\Season;
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
      $items = Material::where('name', 'like', '%' . $q . '%')->
        orWhere('name2', 'like', '%' . $q . '%')->
        orWhere('name3', 'like', '%' . $q . '%')->
        orderBy('name', 'asc')->
        get();
    } else {
      $items = Material::all()->sortBy('name');
    }
    return view('user.material.index', compact('q', 'items'));
  }

  public function add() {
    $categories = MaterialCategory::all()->sortBy('name');
    $nutrients = Nutrient::all()->sortBy('name');
    $seasons = Season::all()->sortBy('name');

    return view('user.material.create', compact('categories', 'nutrients', 'seasons'));
  }

  public function create(Request $request)
  {
    // バリデーション
    $validator = Validator::make($request->all(), Material::$rules);
    if ($validator->fails()) {
      return redirect('user/material/create')->withErrors($validator)->withInput();
    }

    // 材料、調味料の入力チェックの準備
    // 材料は分量も入力が必要、合わせ調味料は、調味料名と内容両方が入力が必要
    $form = $request->all();
    // 材料、調味料のデータを取り出す
    $nutrients = $form['nutrient_material_id'];

    $material = new Material;

    // フォームから送信されてきた_tokenを削除する
    unset($form['_token']);
    unset($form['submit']);
    // フォームから要なデータを削除する
    unset($form['nutrient_material_id']);

    //dd($matIds, $matAmounts, $seasonNames, $seasonBodies, $form);

    // レシピの登録、save後レシピのIDができる
    $material->fill($form);
    $res = $material->save();

    // レシピの登録に成功した場合のみ材料と調味料の登録を行う
    if ($res) {
      // 材料の登録
      for ($i = 0; $res && $i < count($nutrients); $i++) {
        if ($nutrients[$i] != 0) {
          $data = New NutrientMaterial;
          $data->material_id = $material->id;
          $data->nutrient_id = $nutrients[$i];
          $res = $data->save();
        }
      }
    }

    // 何らかの原因でレシピの登録に失敗した場合は、エラーメッセージを表示して元の画面に戻る
    if(!$res) {
      $validator->errors()->add('error', '栄養素の登録に失敗しました。');
      return redirect('user/material/create')->withErrors($validator)->withInput();
    }

    return redirect('user/material');
  }

  public function edit(Request $request) {
    $material = Material::find($request->id);
    if ($material == null) {
      abort(404);
    }
    //dd($material->nutrients->toArray());
    $categories = MaterialCategory::all()->sortBy('name');
    $nutrients = Nutrient::all()->sortBy('name');
    $seasons = Season::all()->sortBy('name');

    return view('user.material.edit', compact('material', 'categories', 'nutrients', 'seasons'));
  }

  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), Material::$rules);
    if ($validator->fails()) {
      return redirect('user/material/create')->withErrors($validator)->withInput();
    }

    // 材料、調味料の入力チェックの準備
    // 材料は分量も入力が必要、合わせ調味料は、調味料名と内容両方が入力が必要
    $form = $request->all();
    // 材料、調味料のデータを取り出す
    $nutrients = $form['nutrient_material_id'];

    $material = Material::find($request->id);

    // フォームから送信されてきた_tokenを削除する
    unset($form['_token']);
    unset($form['submit']);
    // フォームから要なデータを削除する
    unset($form['nutrient_material_id']);

    //dd($matIds, $matAmounts, $seasonNames, $seasonBodies, $form);

    // レシピの登録、save後レシピのIDができる
    $material->fill($form);
    $res = $material->save();

    // レシピの登録に成功した場合のみ材料と調味料の登録を行う
    if ($res) {
      // 東麓済みの栄養素を全削除
      NutrientMaterial::where('material_id', $material->id)->delete();
      // 栄養素の登録
      for ($i = 0; $res && $i < count($nutrients); $i++) {
        if ($nutrients[$i] != 0) {
          $data = New NutrientMaterial;
          $data->material_id = $material->id;
          $data->nutrient_id = $nutrients[$i];
          $res = $data->save();
        }
      }
    }

    // 何らかの原因でレシピの登録に失敗した場合は、エラーメッセージを表示して元の画面に戻る
    if(!$res) {
      $validator->errors()->add('error', '栄養素の登録に失敗しました。');
      return redirect('user/material/create')->withErrors($validator)->withInput();
    }

    return redirect('user/material');
  }
}
