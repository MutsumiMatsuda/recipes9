<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
  protected $guarded = array('id');
  //
  public static $rules = array(
    'name' => 'required',
  );

  public function recipes() {
    return $this->hasManyThrough('App\Models\Recipe', 'App\Models\RecipeTag', 'tag_id', 'id', null, 'recipe_id');
  }

  public function recipeIds() {
    return $this->recipes->pluck('id')->toArray();
  }
}
?>
