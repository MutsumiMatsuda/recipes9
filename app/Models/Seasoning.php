<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Seasoning extends Model
{
    protected $guarded = array('id');
    //
    public static $rules = array(
        'name' => 'required',
        'recipe_id' => 'required',
        'body' => 'required',
    );
            // 以下を追記
    // MenunModelに関連付けを行う
    public function recipe() {
      return $this->belongsTo('App\Models\Recipe');
    }

    /*public function menu() {
        return $this->belongsTo('App\Menu');
        }*/

}
?>
