<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Menu;
use Utl;

class MenuController extends Controller
{
    //
    public function add()
    {
        return view ('user.menu.create');
    }
    //
    public function create(Request $request)
    {
      $this->validate($request, Menu::$rules);

      $menu = new Menu;
      $form = $request->all();
      // フォームから画像が送信されてきたら、保存して、$news->image_path に画像のパスを保存する
      if (isset($form['image'])) {
        $menu->image_path = basename(self::storeImage('public/image/menu', $form['image']));
      } else {
        $menu->image_path = null;
      }
      // フォームから送信されてきた_tokenを削除する
      unset($form['_token']);
      // フォームから送信されてきたimageを削除する
      unset($form['image']);
      // データベースに保存する
      $menu->fill($form);
      $menu->save();
      //user/menu/createにリダイレクトする
      return redirect ('user/menu/create');

    }
  // 以下を追記
  public function index(Request $request)
  {
      $cond_name = $request->cond_name;
      if ($cond_name != '') {
          // 検索されたら検索結果を取得する
          $posts = Menu::where('name', 'like', '%' . $cond_name . '%')->get()->sortBy('name');
      } else {
          $posts = Menu::all()->sortBy('name');
      }
      return view('user.menu.index', compact(['posts', 'cond_name']));
  }
  public function edit(Request $request)
  {
      // News Modelからデータを取得する
      $menu = Menu::find($request->id);
      if (empty($menu)) {
        abort(404);
      }
      return view('user.menu.edit', compact(['menu']));
  }


  public function update(Request $request)
  {
      // Validationをかける
      $this->validate($request, Menu::$rules);
      // News Modelからデータを取得する
      $menu = Menu::find($request->id);
      // 送信されてきたフォームデータを格納する
      $form = $request->all();
      if ($request->remove == 'true') {
        self::deleteImage('public/image/menu', $menu->image_path);
        $form['image_path'] = null;
      } elseif ($request->file('image')) {
        $menu->image_path = basename(self::swapImage('public/image/menu', $form['image'], $menu->image_path));
      } else {
        $form['image_path'] = $menu->image_path;
      }

      unset($form['image']);
      unset($form['remove']);
      unset($form['_token']);
      // 該当するデータを上書きして保存する
      $menu->fill($form)->save();
      return redirect('user/menu');
  }

    // 以下を追記　　
  public function delete(Request $request)
  {
      // 該当するNews Modelを取得
      $menu = Menu::find($request->id);

      // 該当レシピの値をリセット
      foreach($menu->recipes as $recipe) {
        $recipe->menu_id = 0;
        $recipe->save();
      }

      // 削除する
      if (Utl::isNullOrEmpty($menu->image_path)) {
        self::deleteImage('public/image/menu', $menu->image_path);
      }
      $menu->delete();
      return redirect('user/menu');
  }

}
