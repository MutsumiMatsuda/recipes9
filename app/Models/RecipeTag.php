<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RecipeTag extends Model
{
  protected $guarded = array('id');

  public static $rules = array(
    'recipe_id' => 'required',
    'tag_id' => 'required',
    'amount' => 'required',
  );

  public function tag() {
    return $this->belongsTo('App\Models\Tag');
  }

  public function recipe() {
    return $this->belongsTo('App\Models\Recipe');
  }

  // tagnのIdの配列から、and検索を行い、レシピのidの配列を返す
  public static function recipeIds($tagIds) {
    $ids = [];
    $i = 0;
    foreach($tagIds as $tagId => $value) {
      if (!$i) {
        $ids = self::where('tag_id', $tagId)->pluck('recipe_id')->toArray();
      } else {
        $ids = array_intersect($ids, self::where('tag_id', $tagId)->pluck('recipe_id')->toArray());
      }
      $i++;
    }
    return $ids;
  }
}

?>
