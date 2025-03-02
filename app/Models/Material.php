<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
  protected $guarded = array('id');
  //
  public static $rules = array(
    'name' => 'required',
    'material_category_id' => 'required'
  );

  public function category() {
    return $this->belongsTo('App\Models\MaterialCategory', 'material_category_id');
  }

  public function season() {
    return $this->belongsTo('App\Models\Season', 'season_id');
  }

  public function recipes() {
    return $this->hasManyThrough('App\Models\Recipe', 'App\Models\RecipeMaterial', 'material_id', 'id', null, 'recipe_id');
  }

  // MenunModelに関連付けを行う
  public function nutrients() {
    return $this->hasManyThrough('App\Models\Nutrient', 'App\Models\NutrientMaterial', 'material_id', 'id', null, 'nutrient_id');
  }

  // 案連レシピのidの配列を返す
  public function recipeIds() {
    return $this->recipes->pluck('id')->toArray();
  }

  // 指定カテゴリの材料を名前の焦準で取得
  public static function getByCategory($catId) {
    $rs = self::where('material_category_id', $catId)->get();
    //echo count($rs) . "件</br>"; // debug
    $tmp = $ret = [];

    // キーの重複を避けるため名前の一文字目＋連番でソートする
    $i = 0;
    foreach($rs as $r) {
      $tmp[mb_substr($r->name, 0, 1) . $i] = $r;
      $i++;
    }
    //dd($tmp);

    ksort($tmp);
    foreach($tmp as $r) {
      $ret[] = $r;
    }
    return $ret;
  }
}

?>
