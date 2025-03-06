<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\LearnQuestion;
use App\Models\Tryout;

class TryoutQuestion extends Model
{
  use HasFactory;

  protected $guarded = array('id');

  public function questions() {
      return $this->hasMany('App\Models\LearnQuestion', 'learn_question_id');
  }

  public function tryout() {
    return $this->belongsTo('App\Models\Tryout', 'tryout_id');
  }
}
