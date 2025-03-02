<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class LearnQuestion extends Model
{
  /*------------------------------
    インスタンスメンバー
  -------------------------------*/
  protected $guarded = array('id');

  /*------------------------------
    インスタンスメンバー
  -------------------------------*/


  /*------------------------------
    スタティックメンバー
  -------------------------------*/
  // 短縮表示の文字数
  const SHORTEN = 12;

  // ページネーション件数
  const PAGENATE = 10;

  // 種類
  const TRANSLATE = 0;
  const FILLBLANK = 1;

  // ヴァリデーションルール
  public static $rules = array(
    'q' => 'required',
    'a' => 'required',
  );

  public static $ansRules = array(
    'a' => 'required',
  );

// 以下を追記
// MenunModelに関連付けを行う
//   public function recipes() {
//       return $this->hasMany('App\Recipe', 'howto_id');
//   }
  private static $ratio = 0;
  private static $addRatio = 0;
  public static function initRatio($start, $add) {
    self::$ratio = $start;
    self::$addRatio = $add;
  }

  // 正答率をランダムに返す
  public static function nextRatio() {
    return self::$ratio += self::$addRatio;
  }

  // 一覧表示用文字列を返す
  public static function shorten($item) {
    $q = self::TRANSLATE == $item->type ? $item->q : self::dspQ($item);
    $dsp = $item->id . "." . mb_substr($q, 0, self::SHORTEN);
    $dsp .= self::SHORTEN < mb_strlen($q) ? "…" : "";
    return $dsp;
  }

  // 一覧ページ用穴埋め問題文を返す
  public static function dspFillIndexQ($item) {
    $tmp = self::shorten($item);
    $dsp = self::TRANSLATE == $item->type ? $tmp : self::replaceFill($tmp);
    return $dsp;
  }

  // 詳細ページ用問題文を返す
  public static function dspQ($item) {
    $dsp = self::TRANSLATE == $item->type ? $item->q : self::replaceFill($item->q);
    return $dsp;
  }

  // 詳細ページ用正解を返す
  public static function dspAnswer($item) {
    $dsp = self::TRANSLATE == $item->type ? $item->a : str_replace('*', $item->a, $item->q);
    return $dsp;
  }

  // 正答率を返す
  public static function dspRatio($item) {
    return $item->ratio / 10;
  }

  // 穴埋め部分の表示文字列置換
  private static function replaceFill($src) {
    return str_replace('*', '[■]', $src);
  }

}
