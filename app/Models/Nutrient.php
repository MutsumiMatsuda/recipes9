<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Nutrient extends Model
{
  protected $guarded = ['id'];

  public static $rules = [
    'name' => 'required'
  ];

  public function nutrientMaterials() {
    return $this->hasMany('App\Models\NutrientMaterial');
  }

  public function materials() {
    return $this->hasManyThrough('App\Models\Material', 'App\Models\NutrientMaterial', 'nutrient_id', 'id', null, 'material_id');
  }

  public function recipes() {
    $materials = $this->materials;
    //return $materials;
    $result = [];
    foreach($materials as $material) {
      $recipes = $material->recipes;
      if (count($recipes)) {
        if (count($result)) {
          //echo count($nutrients) . "\n";
          foreach($recipes->toArray() as $recipe) {
            $add = true;
            foreach($result as $item) {
              if ($item['id'] == $recipe['id']) {
                $add = false;
                break;
              }
            }
            if ($add) {
              $result[] = $recipe;
            }
          }
        } else {
          $result = $recipes->toArray();
        }
      }
    }
    if (count($result)) {
      $nameArray = array_column($result, 'name');
      array_multisort($nameArray, SORT_ASC, $result);
    }
    return $result;
  }

  // 案連レシピのidの配列を返す
  public function recipeIds() {
    return array_column($this->recipes(), 'id');
  }
}
