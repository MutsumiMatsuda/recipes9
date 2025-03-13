<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QTag extends Model
{
  use HasFactory;

  protected $guarded = array('id');
  //
  public static $rules = array(
    'name' => 'required',
  );

  public function questions() {
    return $this->hasManyThrough('App\Models\LearnQuestion', 'App\Models\LearnQuestionTag', 'q_tag_id', 'id', null, 'learn_question_id');
  }

  public function questionIds() {
    return $this->questions->pluck('id')->toArray();
  }
}
