<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\LearnQuestion;
use App\Models\TryoutQuestion;
use Carbon\Carbon;
use Cnst;

class Tryout extends Model
{
  use HasFactory;

  /*------------------------------
    インスタンスメンバー
  -------------------------------*/
  protected $guarded = array('id');

  public function questions() {
    return $this->hasManyThrough('App\Models\LearnQuestion', 'App\Models\TryoutQuestion', 'tryout_id', 'id', null, 'learn_question_id');
  }

  public function questionIds() {
    return $this->questions->pluck('id')->toArray();
  }


  /*------------------------------
    スタティックメンバー
  -------------------------------*/

  // 難問問題集新規作成
  public static function createHard($type) {

    // 今日の問題がすでに作成されたかをチェック
    $todaysTry = Carbon::now()->format('Y/m/d') . '問題集';
    $prev = self::where('name', $todaysTry)->orderBy('created_at', 'desc')->get()->first();
    $list = null;
    if (null != $prev) {
      // 今日の問題が既にあれば、違う問題を選ぶ
      $list = LearnQuestion::where([['q_type_id', $type], ['hidden', false]])->
        whereNotIn('id', $prev->questionIds())->orderBy('ratio', 'asc')->take(Cnst::Q_PER_TRY)->get();
    } else {
      // 指定タイプの問題から正解率が低い問題を指定数取得
      $list = LearnQuestion::where([['q_type_id', $type], ['hidden', false]])->orderBy('ratio', 'asc')->take(Cnst::Q_PER_TRY)->get();
    }

    // 問題集テーブル更新
    $tryout = new Tryout();
    $tryout->q_type_id = $type;
    $tryout->name = Carbon::now()->format('Y/m/d') . '問題集';
    $tryout->save();

    // 中間テーブル更新
    foreach($list as $item) {
      $m = new TryoutQuestion();
      $m->tryout_id = $tryout->id;
      $m->learn_question_id = $item->id;
      $m->save();
    }
  }

  // 直近の問題集を取得
  public static function latest($type) {
    $tryout = self::where('q_type_id', $type)->orderBy('id', 'desc')->get()->first();
    return $tryout;
  }
}
