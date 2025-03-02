<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\MaterialCategory;
use App\Models\Material;
use App\Models\RecipeCategory;
use App\Models\Menu;
use App\Models\Howto;
use App\Models\Recipe;
use App\Models\RecipeMaterial;
use App\Models\Seasoning;
use App\Models\RecipeCountry;
use App\Models\Mainsub;
use App\Models\Season;
use App\Models\Tag;
use App\Models\RecipeTag;
use Auth;
use Storage;
use Utl;
use Validator;

class RecipeController extends Controller
{
  public function add()
  {
    $materialCategories = MaterialCategory::all()->sortBy('name');
    //dd($materialCategories);
    $materials = Material::getByCategory($materialCategories->first()->id);
    $recipeCategories = RecipeCategory::all()->sortBy('name');
    $menus = Menu::all()->sortBy('name');
    $howtos = Howto::all()->sortBy('name');
    $countries = RecipeCountry::all()->sortBy('name');
    $mainsubs = Mainsub::all()->sortBy('name');
    $seasons = Season::all()->sortBy('name');
    $tags = Tag::all()->sortBy('name');

    $jsAry = self::mkJsMatAry($materialCategories);
    //dd($ary01);

    return view('user.recipe.create',
      compact(
        'materialCategories'
      , 'materials'
      , 'recipeCategories'
      , 'menus'
      , 'howtos'
      , 'countries'
      , 'mainsubs'
      , 'seasons'
      , 'tags'
      , 'jsAry'
    ));
  }

  /**
  * レシピの新規登録
  */
  public function create(Request $request)
  {
    //dd($request);
    // チェックボックスがチェックされていない場合、各値をfalseにする
    $request->merge([
       'is_easy' => $request->is_easy ? 1 : 0,
       'is_favorite' => $request->is_favorite ? 1 : 0,
       'is_refresh' => $request->is_refresh ? 1 : 0,
       'is_healthy' => $request->is_healthy ? 1 : 0,
       'is_caloryoff' => $request->is_caloryoff ? 1 : 0,
       //'user_id' =>  Auth::id(),
       'user_id' =>  1,
    ]);

    // バリデーション
    $validator = Validator::make($request->all(), Recipe::$rules);
    if ($validator->fails()) {
      return redirect('user/recipe/create')->withErrors($validator)->withInput();
    }

    // 材料、調味料の入力チェックの準備
    // 材料は分量も入力が必要、合わせ調味料は、調味料名と内容両方が入力が必要
    $form = $request->all();
    // 材料、調味料のデータを取り出す
    $matIds = $form['material_id'];
    $matAmounts = $form['amount'];
    $seasonNames = $form['season'];
    $seasonBodies = $form['season_body'];

    // 材料の入力チェック
    for ($i = 0; $i < count($matIds); $i++) {
      if ($matIds[$i] != 0 && $matAmounts[$i] == null) {
        $validator->errors()->add('material_id', '材料と分量、両方を入力して下さい。');
        return redirect('user/recipe/create')->withErrors($validator)->withInput();
      }
    }

    // 調味料の入力チェック
    for ($i = 0; $i < count($seasonNames); $i++) {
      if ((Utl::isNullOrEmpty($seasonNames[$i]) && !Utl::isNullOrEmpty($seasonBodies[$i])) || (!Utl::isNullOrEmpty($seasonNames[$i]) && Utl::isNullOrEmpty($seasonBodies[$i]))) {
        $validator->errors()->add('seasoning', '調味料名と内容、両方を入力して下さい。');
        return redirect('user/recipe/create')->withErrors($validator)->withInput();
      }
    }

    //dd($matIds, $matAmounts, $seasonNames, $seasonBodies, $form);
    //dd($matIds, $matAmounts, $seasonNames, $seasonBodies);

    // 入力チェック完了、登録処理開始
    $recipe = new Recipe;

    // フォームから画像が送信されてきたら、保存して、$news->image_path に画像のパスを保存する
    if (isset($form['image'])) {
      $recipe->image_path = basename(self::storeImage('public/image/recipe', $form['image']));
    } else {
      $recipe->image_path = null;
    }

    // フォームから画像が送信されてきたら、保存して、$news->image_path に画像のパスを保存する
    if (isset($form['image2'])) {
      $recipe->image_path2 = basename(self::storeImage('public/image/recipe/howto', $form['image2']));
    } else {
      $recipe->image_path2 = null;
    }

    // フォームから送信されてきた_tokenを削除する
    unset($form['_token']);
    unset($form['submit']);
    // フォームから要なデータを削除する
    unset($form['image']);
    unset($form['image2']);
    unset($form['material_category_id']);
    unset($form['material_id']);
    unset($form['amount']);
    unset($form['season']);
    unset($form['season_body']);
    unset($form['tags']);

    //dd($matIds, $matAmounts, $seasonNames, $seasonBodies, $form);

    // レシピの登録、save後レシピのIDができる
    $recipe->fill($form);
    $res = $recipe->save();

    // レシピの登録に成功した場合のみ材料と調味料の登録を行う
    if ($res) {
      // 材料の登録
      for ($i = 0; $res && $i < count($matIds); $i++) {
        if ($matIds[$i] != 0) {
          $data = New RecipeMaterial;
          $data->recipe_id = $recipe->id;
          $data->material_id = $matIds[$i];
          $data->amount = $matAmounts[$i];
          $res = $data->save();
        }
      }
      // 調味料の登録
      for ($i = 0; $res && $i < count($seasonNames); $i++) {
        if ($seasonNames[$i] != null) {
          $data = New Seasoning;
          $data->recipe_id = $recipe->id;
          $data->name = $seasonNames[$i];
          $data->body = $seasonBodies[$i];
          $res = $data->save();
        }
      }

      // タグの登録
      if ($request->tags) {
        foreach($request->tags as $tagId => $value) {
          $recipe_tag = New RecipeTag;
          $recipe_tag->recipe_id = $recipe->id;
          $recipe_tag->tag_id = $tagId;
          $recipe_tag->save();
        }
      }
    }

    // 何らかの原因でレシピの登録に失敗した場合は、エラーメッセージを表示して元の画面に戻る
    if(!$res) {
      $validator->errors()->add('error', 'レシピの登録に失敗しました。');
      return redirect('user/recipe/create')->withErrors($validator)->withInput();
    }

    return redirect('user/recipe/create');
  }

  public function edit(Request $request)
  {
      // News Modelからデータを取得する
      $recipe = Recipe::find($request->id);
      if (empty($recipe)) {
        abort(404);
      }
      //dd($recipe->materials->toArray());

      $materialCategories = MaterialCategory::all()->sortBy('name');
      $materials = Material::where('material_category_id', $materialCategories->first()->id)->get();
      $recipeCategories = RecipeCategory::all()->sortBy('name');
      $menus = Menu::all()->sortBy('name');
      $howtos = Howto::all()->sortBy('name');
      $countries = RecipeCountry::all()->sortBy('name');
      $mainsubs = Mainsub::all()->sortBy('name');
      $seasons = Season::all()->sortBy('name');
      $tags = Tag::all()->sortBy('name');

      $jsAry = self::mkJsMatAry($materialCategories);
      //dd($ary01);

      return view('user.recipe.edit',
       compact(
         'recipe'
        , 'materialCategories'
        , 'materials'
        , 'recipeCategories'
        , 'menus'
        , 'howtos'
        , 'countries'
        , 'mainsubs'
        , 'seasons'
        , 'tags'
        , 'jsAry'
      ));
  }

  public function update(Request $request)
  {
    $request->merge([
       'is_easy' => $request->is_easy ? 1 : 0,
       'is_favorite' => $request->is_favorite ? 1 : 0,
       'is_refresh' => $request->is_refresh ? 1 : 0,
       'is_healthy' => $request->is_healthy ? 1 : 0,
       'is_caloryoff' => $request->is_caloryoff ? 1 : 0,
       //'user_id' =>  Auth::id(),
       'user_id' =>  1,
    ]);

    // バリデーション
    $validator = Validator::make($request->all(), Recipe::$rules);
    if ($validator->fails()) {
      return redirect('user/recipe/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }

    // 材料、調味料の入力チェックの準備
    // 材料は分量も入力が必要、合わせ調味料は、調味料名と内容両方が入力が必要
    $form = $request->all();
    // 材料、調味料のデータを取り出す
    $matIds = $form['material_id'];
    $matAmounts = $form['amount'];
    $seasonNames = $form['season'];
    $seasonBodies = $form['season_body'];

    // 材料の入力チェック
    for ($i = 0; $i < count($matIds); $i++) {
      if ($matIds[$i] != 0 && $matAmounts[$i] == null) {
        $validator->errors()->add('material_id', '材料と分量、両方を入力して下さい。');
        return redirect('user/recipe/edit?id=' . $request->id)->withErrors($validator)->withInput();
      }
    }

    // 調味料の入力チェック
    for ($i = 0; $i < count($seasonNames); $i++) {
      if ((Utl::isNullOrEmpty($seasonNames[$i]) && !Utl::isNullOrEmpty($seasonBodies[$i])) || (!Utl::isNullOrEmpty($seasonNames[$i]) && Utl::isNullOrEmpty($seasonBodies[$i]))) {
        $validator->errors()->add('seasoning', '調味料名と内容、両方を入力して下さい。');
        return redirect('user/recipe/edit?id=' . $request->id)->withErrors($validator)->withInput();
      }
    }

    // News Modelからデータを取得する
    $recipe = Recipe::find($request->id);

    // 画像処理
    if ($request->remove == 'true') {
      $form['image_path'] = null;
      self::deleteImage('public/image/recipe', $recipe->image_path);
    } elseif ($request->file('image')) {
      $form['image_path'] = basename(self::swapImage('public/image/recipe', $form['image'], $recipe->image_path));
    } else {
      $form['image_path'] = $recipe->image_path;
    }

    // 作り方画像処理
    if ($request->remove2 == 'true') {
      $form['image_path2'] = null;
      self::deleteImage('public/image/recipe/howto', $recipe->image_path2);
    } elseif ($request->file('image2')) {
      $form['image_path2'] = basename(self::swapImage('public/image/recipe/howto', $form['image2'], $recipe->image_path2));
    } else {
      $form['image_path2'] = $recipe->image_path2;
    }

    unset($form['image']);
    unset($form['remove']);
    unset($form['image2']);
    unset($form['remove2']);
    unset($form['_token']);
    unset($form['submit']);
    unset($form['material_category_id']);
    unset($form['material_id']);
    unset($form['amount']);
    unset($form['season']);
    unset($form['season_body']);
    unset($form['tags']);
    // 該当するデータを上書きして保存する
    $recipe->fill($form);
    $res = $recipe->save();

    // レシピの登録に成功した場合のみ材料と調味料の登録を行う
    if ($res) {
      // 登録済みの材料を全て削除
      RecipeMaterial::where('recipe_id', $recipe->id)->delete();
      // 材料の登録
      for ($i = 0; $res && $i < count($matIds); $i++) {
        if ($matIds[$i] != 0) {
          $data = New RecipeMaterial;
          $data->recipe_id = $recipe->id;
          $data->material_id = $matIds[$i];
          $data->amount = $matAmounts[$i];
          $res = $data->save();
        }
      }
      // 登録済みの調味料を全て削除
      Seasoning::where('recipe_id', $recipe->id)->delete();
      // 調味料の登録
      for ($i = 0; $res && $i < count($seasonNames); $i++) {
        if ($seasonNames[$i] != null) {
          $data = New Seasoning;
          $data->recipe_id = $recipe->id;
          $data->name = $seasonNames[$i];
          $data->body = $seasonBodies[$i];
          $res = $data->save();
        }
      }

      // タグの登録
      RecipeTag::where('recipe_id', $recipe->id)->delete();
      if ($request->tags) {
        foreach($request->tags as $tagId => $value) {
          $recipe_tag = New RecipeTag;
          $recipe_tag->recipe_id = $recipe->id;
          $recipe_tag->tag_id = $tagId;
          $recipe_tag->save();
        }
      }
    }

    // 何らかの原因でレシピの登録に失敗した場合は、エラーメッセージを表示して元の画面に戻る
    if(!$res) {
      $validator->errors()->add('error', 'レシピの編集に失敗しました。');
      return redirect('user/recipe/edit?id=' . $request->id)->withErrors($validator)->withInput();
    }
    return redirect('user/recipe/edit?id=' . $recipe->id);
  }

  public function index(Request $request) {
    $q = $request->q ? $request->q : '';
    $query = Recipe::query();

    // レシピ名
    if (!Utl::isNullOrEmpty($q)) {
      $words = array_map('trim', explode(' ', trim($q)));
      //dd($words);
      foreach($words as $word) {
        if (!Utl::isNullOrEmpty($word)) {
          // orWhereを入れるとAnd検索ができなくなる
          $arr = Recipe::where('name', 'like', '%' . $word . '%')->pluck('id')->toArray();
          $arr = array_merge($arr, Recipe::where('body', 'like', '%' . $word . '%')->pluck('id')->toArray());
          $query = $query->whereIn('id', $arr);
        }
      }
    }
    //var_dump($query);
    //$recipes = $query->groupBy('id')->orderBy('name', 'asc')->get();
    $recipes = $query->orderBy('name', 'asc')->get();

    return view('user.recipe.index', compact('recipes', 'q'));
  }

  public function delete(Request $request)
  {
      // 該当するNews Modelを取得
      $recipe = Recipe::find($request->id);

      // 画像があれば削除
      self::deleteImage('public/image/recipe', $recipe->image_path);
      self::deleteImage('public/image/recipe', $recipe->image_path2);

      // 登録済みの材料を全て削除
      RecipeMaterial::where('recipe_id', $recipe->id)->delete();
      // 登録済みの調味料を全て削除
      Seasoning::where('recipe_id', $recipe->id)->delete();
      // 削除する
      $recipe->delete();
      return redirect('user/recipe');
  }
}
