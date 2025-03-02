<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\Nutrient;
use App\Models\NutrientMaterial;
use App\Models\Tag;
use App\Models\Recipe;
use App\Models\RecipeTag;
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
      $items = Tag::where('name', 'like', '%' . $q . '%')->get()->sortBy('name');
    } else {
      $items = Tag::all()->sortBy('name');
    }
    return view('user.tag.index', compact('q', 'items'));
  }

  /**
  * 検索タグ新規登録画面表示アクション
  */
  public function add(Request $request) {
    //dd($request->all());
    return view('user.tag.create');
  }

  /**
  * 検索タグ新規登録アクション
  */
  public function create(Request $request) {
    // バリデーションを行う
    $validator = Validator::make($request->all(), Tag::$rules);
    if ($validator->fails()) {
      return redirect('user/tag/create')->withErrors($validator)->withInput();
    }

    $data = new Tag;
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '検索タグの追加に失敗しました');
      return redirect('user/tag/create')->withErrors($validator)->withInput();
    }

    return redirect('user/tag');
  }

  /**
  * 検索タグ編集画面表示アクション
  */
  public function edit(Request $request) {
    $tag = Tag::find($request->id);
    if ($tag == null) {
      abort(404);
    }
    return view('user.tag.edit', compact('tag'));
  }

  /**
  * 検索タグ更新アクション
  */
  public function update(Request $request) {
    // バリデーション
    $validator = Validator::make($request->all(), Tag::$rules);
    if ($validator->fails()) {
      return redirect('user/tag/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    $data = Tag::find($request->id);
    $form = $request->all();

    unset($form['submit']);
    unset($form['_token']);

    $data->fill($form);
    if (!$data->save()) {
      $validator->errors()->add('fatal', '検索タグの更新に失敗しました');
      return redirect('user/tag/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    return redirect('user/tag');
  }

    /**
    * 検索タグ削除アクション
    */
    public function delete(Request $request) {

      $data = Tag::find($request->id);
      // データを削除
      RecipeTag::where('tag_id', $data->id)->delete();;
      $data->delete();

      // 一覧へ戻る
      return redirect('user/tag');
    }
}
