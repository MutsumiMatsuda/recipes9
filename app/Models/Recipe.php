<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
  protected $guarded = array('id');

  public static $rules = array(
    'name' => 'required',
    'user_id' => 'required',
    'menu_id' => 'required',
    'body' => 'required',
    'recipe_category_id' => 'required',
    'is_easy' => 'numeric',
    'is_favorite' => 'numeric',
    'is_refresh' => 'numeric',
  );

  public function seasonings() {
    return $this->hasMany('App\Models\Seasoning');
  }

  public function recipeMaterials() {
    return $this->hasMany('App\Models\RecipeMaterial');
  }

  public function materials() {
    return $this->hasManyThrough('App\Models\Material', 'App\Models\RecipeMaterial', 'recipe_id', 'id', null, 'material_id');
  }

  public function menu() {
    return $this->belongsTo('App\Models\Menu', 'menu_id');
  }

  public function category() {
    return $this->belongsTo('App\Models\RecipeCategory', "recipe_category_id");
  }

  public function howto() {
    return $this->belongsTo('App\Models\Howto', "howto_id");
  }

  public function country() {
    return $this->belongsTo('App\Models\RecipeCountry', "recipe_country_id");
  }

  public function mainsub() {
    return $this->belongsTo('App\Models\Mainsub', "mainsub_id");
  }

  public function season() {
    return $this->belongsTo('App\Models\Season', "season_id");
  }

  public function tags() {
    return $this->hasManyThrough('App\Models\Tag', 'App\Models\RecipeTag', 'recipe_id', 'id', null, 'tag_id');
  }

  public function tag() {
    $tag = $this->tags()->first();
    if (null == $tag) {
      $tag = New Tag();
      $tag->id = 0;
    }
    return $tag;
  }

  // レシピが指定のタグを持っているかの真偽値を返す
  public function hasTag($id) {
    return count($this->tags->where('id', $id)) ? true : false;
  }

  public function nutrients() {
    $materials = $this->materials;
    //return $materials;
    $result = [];
    foreach($materials as $material) {
      $nutrients = $material->nutrients;
      if (count($nutrients)) {
        if (count($result)) {
          //echo count($nutrients) . "\n";
          foreach($nutrients->toArray() as $nutrient) {
            $add = true;
            foreach($result as $item) {
              if ($item['id'] == $nutrient['id']) {
                $add = false;
                break;
              }
            }
            if ($add) {
              $result[] = $nutrient;
            }
          }
        } else {
          $result = $nutrients->toArray();
        }
      }
    }
    if (count($result)) {
      $nameArray = array_column($result, 'name');
      array_multisort($nameArray, SORT_ASC, $result);
    }
    return $result;
  }
}

?>
