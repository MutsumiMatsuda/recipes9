<?php
namespace App\Models;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Models\LearnQuestion;

/**
 * ページ間で持ち回るパラメータを保持するクラス
 */
class Params {
  /*------------------------------
    インスタンスメンバー
  -------------------------------*/
  // 画面タイトル
  public $title = '';
  // 問題の種類
  public $type = 0;
  // 表示非表示
  public $hidden = 0;
  // 検索フォーム送信先
  public $action = '';
  // 検索文字列
  public $query = '';
  // ソートを行うカラム名
  public $sort = '';
  // 昇順または降順
  public $order = '';
  // ページ番号
  public $page = 1;
  // 問題集id
  public $tryId = 0;
  // タグid
  public $tagId = 0;

  // リクエストを指定するコンストラクタ
  function __construct(Request $rq) {
    $this->type = empty($rq->t) ? 0 : $rq->t;
    $this->hidden = empty($rq->h) ? 0 : $rq->h;
    $this->query = empty($rq->qr) ? '' : $rq->qr;
    $this->page = empty($rq->page) ? 1 : $rq->page;
    $this->sort = empty($rq->s) ? 'id' : $rq->s;
    $this->order = empty($rq->o) ? 'asc' : $rq->o;
    $this->tryId = empty($rq->to) ? 0 : $rq->to;
    $this->tagId = empty($rq->ti) ? 0 : $rq->ti;
  }

  // タイプと表示非表示によってaction属性を設定する
  public function setAction() {
    // 検索フォームの送信先
    if (0 == $this->type) {
      $this->action =  (0 == $this->hidden) ? route("transIndex") : route("transHidden");
    } else {
      $this->action =  (0 == $this->hidden) ? route("fillIndex") : route("fillHidden");
    }
  }

  // パラメータを連想配列として返す
  public function get() {
    return ['t' => $this->type, 'h' => $this->hidden, 'qr' => $this->query,
            's' => $this->sort, 'o' => $this->order, 'to' => $this->tryId,
            'ti' => $this->tagId, 'id' => $this->id, 'page' => $this->page];
  }

  // id以外のパラメータを連想配列として返す
  public function getWithoutId() {
    return ['t' => $this->type, 'h' => $this->hidden, 'qr' => $this->query,
            's' => $this->sort, 'o' => $this->order, 'to' => $this->tryId,
            'ti' => $this->tagId, 'page' => $this->page];
  }

  /*------------------------------
    スタティックメンバー
  -------------------------------*/
  // ソート項目名
  const SORT_ID = 'id';
  const SORT_RATIO = 'ratio';
  const SORT_Q = 'q';
  const SORT_A = 'a';

  const ORDER_ASC = 'asc';
  const ORDER_DESC = 'desc';

  public static function paramsWithId($id, $p) {
    return ['id' => $id, 't' => $p->type, 'h' => $p->hidden, 'qr' => $p->query,
            's' => $p->sort, 'o' => $p->order, 'to' => $p->tryId,
            'ti' => $p->tagId, 'page' => $p->page];
  }

  public static function addPageLink($p) {
    return '&t=' . $p->type . '&h=' . $p->hidden . '&qr=' . $p->query .
            '&ti=' . $p->tagId .
            '&s=' . $p->sort . '&o=' . $p->order . '&to=' . $p->tryId;
  }

  // 「番号」ソートボタンのclassを返す
  public static function sortBtnClassId($p) {
    return self::sortBtnClass($p->sort == self::SORT_ID);
  }

  // 「難易度」ソートボタンのclassを返す
  public static function sortBtnClassRatio($p) {
    return self::sortBtnClass($p->sort == self::SORT_RATIO);
  }
  // 「問題」ソートボタンのclassを返す
  public static function sortBtnClassQuestion($p) {
    return self::sortBtnClass($p->sort == self::SORT_Q);
  }

  // 「解答」ソートボタンのclassを返す
  public static function sortBtnClassAnswer($p) {
    return self::sortBtnClass($p->sort == self::SORT_A);
  }

  // 選択時ソートボタンのclassを返す
  private static function sortBtnClass($flag) {
    return $flag ? "card bg-warning" : "card bg-light";
  }

  public static function orderLavelId($p) {
    return self::SORT_ID == $p->sort && self::ORDER_DESC == $p->order ? '番号↓' : '番号↑';
  }

  public static function orderLavelRatio($p) {
    return self::SORT_RATIO == $p->sort && self::ORDER_DESC == $p->order ? '解率↓' : '解率↑';
  }

  public static function orderLavelQuestion($p) {
    return self::SORT_Q == $p->sort && self::ORDER_DESC == $p->order ? '問題↓' : '問題↑';
  }

  public static function orderLavelAnswer($p) {
    return self::SORT_A == $p->sort && self::ORDER_DESC == $p->order ? '解答↓' : '解答↑';
  }

  /*
   * ソート、オーダー変更ボタンのリンクを返す
   * ページ番号は１にリセット
   */
  public static function sortBtnLink($p, $sort) {
    $param = '?s=' . $sort;
    // 現行ソートの場合はオーダーを反転
    if ($sort == $p->sort) {
      $param .=
        ('&o=' . (self::ORDER_ASC == $p->order ? self::ORDER_DESC : self::ORDER_ASC) .
        '&t=' . $p->type . '&ti=' . $p->tagId .
        '&h=' . $p->hidden);

    // ソート変更の場合はオーダーは昇順固定
    } else {
      $param .=
        ('&o=' . self::ORDER_ASC .
        '&t=' . $p->type . '&ti=' . $p->tagId .
        '&h=' . $p->hidden);
    }
    return $p->action . $param;
  }

  // 問題詳細ページへのリンクを返す
  public static function link2Detail($id, $p) {
    $url = route(LearnQuestion::FILLBLANK == $p->type ? 'fillDetail' : 'transDetail', self::paramsWithId($id, $p));
    return $url;
  }

  // 一覧又は問題集へのリンクを返す
  public static function link2Index($p) {
    $url = '';
    // 問題集挑戦中ならば問題集へのリンクを返す
    if (!empty($p->tryId) && 0 < $p->tryId) {
      $url = route(LearnQuestion::FILLBLANK == $p->type ? 'tryPrevFill' : 'tryPrevTrans', $p->getWithoutId());
    } else {
      $r = '';
      if (LearnQuestion::FILLBLANK == $p->type) {
        $r = 0 == $p->hidden ? 'fillIndex' : 'fillHiddenIndex';
      } else {
        $r = 0 == $p->hidden ? 'transIndex' : 'transHiddenIndex';
      }
      $url = route($r, $p->getWithoutId());
    }
    return $url;
  }
}