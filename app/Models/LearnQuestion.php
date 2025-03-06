<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Params;

class LearnQuestion extends Model
{
  /*------------------------------
    インスタンスメンバー
  -------------------------------*/
  protected $guarded = array('id');


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

  // 穴埋め問題の区切り文字
  const FILL_DELIMITER = '*';
  // 穴埋め部分の表示文字列
  const FILL_REPLACER = '[■]';

  // バリデーションルール
  public static $rules = array(
    'q' => 'required',
    'a' => 'required',
  );

  public static $ansRules = array(
    'a' => 'required',
  );

  private static $ratio = 0;
  private static $addRatio = 0;
  public static function initRatio($start, $add) {
    self::$ratio = $start;
    self::$addRatio = $add;
  }

  /*
   * 一覧ページの検索クエリを返す
   */
  public static function getIndexQuery(Params $p) {
    if (empty($p->query)) {
      return self::query()->where([['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        orderBy($p->sort, $p->order);
    } else {
      return self::query()->
        where([['q', 'like', '%' . $p->query . '%'], ['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        orWhere([['a', 'like', '%' . $p->query . '%'], ['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        orWhere([['hint1', 'like', '%' . $p->query . '%'], ['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        orWhere([['hint2', 'like', '%' . $p->query . '%'], ['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        groupBy('id')->orderBy($p->sort, $p->order);
    }
  }

  // 正答率をランダムに返す
  public static function nextRatio() {
    //return self::$ratio += self::$addRatio;
    return 0;
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

  // 翻訳問題詳細ページ用問題文を返す
  public static function dspQ($item) {
    $dsp = self::TRANSLATE == $item->type ? $item->q : self::replaceFill($item->q);
    return $dsp;
  }

  // 穴埋め問題詳細ページ用問題文を返す
  public static function dspFillQ($item) {
    return self::replaceFill($item->hint1);
  }

  // 詳細ページ用正解を返す
  public static function dspAnswer($item) {
    $dsp = self::TRANSLATE == $item->type ? $item->a : str_replace(self::FILL_DELIMITER, $item->a, $item->hint1);
    return $dsp;
  }

  // 正答率を返す
  public static function dspRatio($item) {
    return $item->ratio / 10;
  }

  // DBに登録する穴埋め問題文を返す
  public static function makeFillQuestion($head, $tail) {
    $head = empty($head) ? '' : $head;
    $tail = empty($tail) ? '' : $tail;
    return $head . self::FILL_DELIMITER . $tail;
  }

  // 穴埋め問題の前部分を返す
  public static function getFillQHead($q) {
    $ret = '';
    if (!empty($q)) {
      $ary = explode(self::FILL_DELIMITER, $q->hint1);
      if (1 < count($ary)) {
        $ret = $ary[0];
      }
    }
    return $ret;
  }

  // 穴埋め問題の後ろ部分を返す
  public static function getFillQTail($q) {
    $ret = '';
    if (!empty($q)) {
      $ary = explode(self::FILL_DELIMITER, $q->hint1);
      $ret = 1 < count($ary) ? $ary[1] : $ary[0];
    }
    return $ret;
  }

  // 穴埋め部分の表示文字列置換
  private static function replaceFill($src) {
    return str_replace(self::FILL_DELIMITER, self::FILL_REPLACER, $src);
  }

}
