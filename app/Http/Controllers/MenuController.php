<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Menu;

class MenuController extends Controller
{
  // 以下を追記
  public function index(Request $request)
  {
      $cond_name = $request->cond_name;
      if ($cond_name != '') {
          // 検索されたら検索結果を取得する
          $posts = Menu::where('name', $cond_name)->get();
      } else {
          // それ以外はすべてのニュースを取得する

          $posts = Menu::all();
      }
      return view('menu.index', compact(['posts', 'cond_name']));
  }

  public function show(Request $request)
  {
      // News Modelからデータを取得する
      $menu = Menu::find($request->id);
      if (empty($menu)) {
        abort(404);
      }
      return view('menu.show', ['menu' => $menu]);
  }
}
