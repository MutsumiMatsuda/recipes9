<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RecipeCategory extends Model
{
    protected $guarded = array('id');
    //
    public static $rules = array(
        'name' => 'required',
    );
        // 以下を追記
    // MenunModelに関連付けを行う
    public function recipes() {
        return $this->hasMany('App\Models\Recipe', 'recipe_category_id');
    }


}

?>
