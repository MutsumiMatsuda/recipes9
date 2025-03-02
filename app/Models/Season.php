<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Season extends Model
{
  protected $guarded = array('id');
  //
  public static $rules = array(
    'name' => 'required',
  );

  public function recipesWithMaterials() {
    $items = $this->recipes;
    foreach($this->materials as $material) {
      //$items = array_merge($items, $material->recipes);
      $items = $items->merge($material->recipes);
    }
    return $items;
  }

  public function recipes() {
    return $this->hasMany('App\Models\Recipe');
  }

  public function recipeIds() {
    return $this->recipesWithMaterials()->pluck('id')->toArray();
  }

  public function materials() {
    return $this->hasMany('App\Models\Material');
  }
}
?>
