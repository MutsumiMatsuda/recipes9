<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Carbon\Carbon;
use Cnst;

class TagTryout extends Model
{
  use HasFactory;

  /*------------------------------
    インスタンスメンバー
  -------------------------------*/
  protected $guarded = array('id');

  public function questions() {
    return $this->hasManyThrough('App\Models\LearnQuestion', 'App\Models\TagTryoutQuestion', 'tag_tryout_id', 'id', null, 'learn_question_id');
  }

  /*------------------------------
    スタティックメンバー
  -------------------------------*/

  // 難問問題集新規作成
  public static function createHard($tagId) {
    $qTag = QTag::find($tagId);
    // 指定タグを持つ問題から正解率が低い問題を指定数取得
    $ids = $qTag->questionIds();
    $list = LearnQuestion::whereIn('id', $ids)->where('hidden', false)->orderBy('ratio', 'asc')->take(Cnst::Q_PER_TRY)->get();

    // 問題集テーブル更新
    $tt = new TagTryout();
    $tt->tag_id = $tagId;
    $tt->name = Carbon::now()->format('Y/m/d H:i') . '問題集';
    $tt->save();

    // 中間テーブル更新
    foreach($list as $item) {
      $m = new TagTryoutQuestion();
      $m->tag_tryout_id = $tt->id;
      $m->learn_question_id = $item->id;
      $m->save();
    }
  }

  // 直近の問題集を取得
  public static function latest($tagId) {
    $tryout = self::where('tag_id', $tagId)->orderBy('id', 'desc')->get()->first();
    return $tryout;
  }
}
