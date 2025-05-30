<?php
namespace App\Models;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Models\LearnQuestion;
use Cnst;
use Tg;

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
  // タグ問題集id
  public $tagTryId = 0;
  // タグid
  public $tagId = 0;
  // トップページタブ
  public $tab = Cnst::TAB_TRYOUT;

  // リクエストを指定するコンストラクタ
  function __construct(Request $rq) {
    $this->type = empty($rq->t) ? 0 : $rq->t;
    $this->hidden = empty($rq->h) ? 0 : $rq->h;
    $this->query = empty($rq->qr) ? '' : $rq->qr;
    $this->page = empty($rq->page) ? 1 : $rq->page;
    $this->sort = empty($rq->s) ? 'id' : $rq->s;
    $this->order = empty($rq->o) ? 'asc' : $rq->o;
    $this->tryId = empty($rq->to) ? 0 : $rq->to;
    $this->tagTryId = empty($rq->tti) ? 0 : $rq->tti;
    $this->tagId = empty($rq->ti) ? 0 : $rq->ti;
    $this->tab = empty($rq->tb) ? Cnst::TAB_TRYOUT : $rq->tb;
  }

  // パラメータのクローンを生成する
  public function clone($p) {
    $ret = new Params();
    $ret->type = $p->type;
    $ret->hidden = $p->hidden;
    $ret->page = $p->page;
    $ret->sort = $p->sort;
    $ret->order = $p->order;
    $ret->tryId = $p->tryId;
    $ret->tagTryId = $p->tagTryId;
    $ret->tagId = $p->tagId;
    $ret->tab = $p->tab;
    return $ret;
  }

  /**
   *
   */
 public function isActiveTab($tabName) {
   echo Tg::isActiveTab($this, $tabName);
 }

 public function isActiveTabPain($tabName) {
   echo Tg::isActiveTabPain($this, $tabName);
 }

  public function isSelectedArea($areaName) {
    echo Tg::isSelectedArea($this, $areaName);
  }

  // タイプと表示非表示によってaction属性を設定する
  public function setAction() {
    // 検索フォームの送信先
    if (LearnQuestion::FILLBLANK == $this->type) {
      $this->action =  (0 == $this->hidden) ? route("fillIndex") : route("fillHidden");
    } else {
      $this->action =  (0 == $this->hidden) ? route("transIndex") : route("transHidden");
    }
  }

  // パラメータを連想配列として返す
  public function get() {
    return ['t' => $this->type, 'h' => $this->hidden, 'qr' => $this->query,
            's' => $this->sort, 'o' => $this->order, 'to' => $this->tryId,
            'ti' => $this->tagId, 'tti' => $this->tagTryId, 'id' => $this->id,
            'page' => $this->page, 'tb' => $this->tab
           ];
  }

  // id以外のパラメータを連想配列として返す
  public function getWithoutId() {
    return ['t' => $this->type, 'h' => $this->hidden, 'qr' => $this->query,
            's' => $this->sort, 'o' => $this->order, 'to' => $this->tryId,
            'ti' => $this->tagId, 'tti' => $this->tagTryId,
            'page' => $this->page, 'tb' => $this->tab
          ];
  }

  // ページのタイトルを返す
  public function getTitle($tail = '') {
    return LearnQuestion::pageTitle($this->type) . $tail;
  }

  /**
   * 今日の問題ページへのリンクを返す
   * @return 今日の問題ページへのリンク
   */
  public function link2Tryout($type) {
    return self::Dolink2Tryout($this, $type);
  }

  /**
   * 今日のタグ問題ページへのリンクを返す
   * @return 今日のタグ問題ページへのリンク
   */
  public function link2TagTryout($tagId) {
    return self::Dolink2TagTryout($this, $tagId);
  }

  /**
   * 問題新規追加ページへのリンクを返す
   * @return 問題新規追加ページへのリンク
   */
  public function link2Add($type) {
    return self::Dolink2Add($this, $type);
  }

  /**
   * 問題詳細ページへのリンクを返す
   * @return 問題詳細ページへのリンク
   */
  public function link2Detail($id) {
    return self::Dolink2Detail($id, $this);
  }

  /**
   * 一覧ページへのリンクを返す
   * @return 一覧ページへのリンク
   */
  public function link2Index($type) {
    return self::Dolink2Index($this, $type);
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

  public static function params($p) {
    return ['t' => $p->type, 'h' => $p->hidden, 'qr' => $p->query,
            's' => $p->sort, 'o' => $p->order, 'to' => $p->tryId,
            'ti' => $p->tagId, 'tti' => $p->tagTryId, 'page' => $p->page,
            'tb' => $p->tab
          ];
  }

  public static function paramsWithOutTab($p) {
    return ['t' => $p->type, 'h' => $p->hidden, 'qr' => $p->query,
            's' => $p->sort, 'o' => $p->order, 'to' => $p->tryId,
            'ti' => $p->tagId, 'tti' => $p->tagTryId, 'page' => $p->page
          ];
  }

  public static function paramsWithId($id, $p) {
    return ['id' => $id, 't' => $p->type, 'h' => $p->hidden, 'qr' => $p->query,
            's' => $p->sort, 'o' => $p->order, 'to' => $p->tryId,
            'ti' => $p->tagId, 'tti' => $p->tagTryId, 'page' => $p->page,
            'tb' => $p->tab
          ];
  }

  public static function addPageLink($p) {
    return '&t=' . $p->type . '&h=' . $p->hidden . '&qr=' . $p->query .
            '&ti=' . $p->tagId . '&tti=' . $p->tagTryId .
            '&s=' . $p->sort . '&o=' . $p->order . '&to=' . $p->tryId .
            '&tb=' . $p->tab;
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
        '&t=' . $p->type . '&ti=' . $p->tagId . '&tti=' . $p->tagTryId .
        '&h=' . $p->hidden . '&tb=' . $p->tab);

    // ソート変更の場合はオーダーは昇順固定
    } else {
      $param .=
        ('&o=' . self::ORDER_ASC .
        '&t=' . $p->type . '&ti=' . $p->tagId . '&tti=' . $p->tagTryId .
        '&h=' . $p->hidden . '&tb=' . $p->tab);
    }
    return $p->action . $param;
  }

  // 今日の問題ページへのリンクを返す
  public static function Dolink2Tryout($param, $type) {
    $p = clone($param);
    $p->type = $type;
    $url = route(LearnQuestion::FILLBLANK == $p->type ? 'tryFill' : 'tryTrans', self::params($p));
    return $url;
  }

  // 今日の問題ページへのリンクを返す
  public static function Dolink2TagTryout($param, $tagId) {
    $p = clone($param);
    $p->tagId = $tagId;
    $url = route('tryWithTag', self::params($p));
    return $url;
  }

  // 問題新規追加ページへのリンクを返す
  public static function Dolink2Add($param, $type) {
    $p = clone($param);
    $p->type = $type;
    $url = route(LearnQuestion::FILLBLANK == $p->type ? 'fillAdd' : 'transAdd', self::params($p));
    return $url;
  }

  // 問題詳細ページへのリンクを返す
  public static function Dolink2Detail($id, $p) {
    $url = route(LearnQuestion::FILLBLANK == $p->type ? 'fillDetail' : 'transDetail', self::paramsWithId($id, $p));
    return $url;
  }

  // 一覧又は問題集へのリンクを返す
  public static function Dolink2Index($param, $type) {
    $p = clone($param);
    $p->type = $type;
    $url = '';
    // 問題集挑戦中ならば問題集へのリンクを返す
    if (!empty($p->tryId) && 0 < $p->tryId) {
      $url = route(LearnQuestion::FILLBLANK == $p->type ? 'tryPrevFill' : 'tryPrevTrans', self::params($p));
    } else {
      $r = '';
      if (LearnQuestion::FILLBLANK == $p->type) {
        $r = 0 == $p->hidden ? 'fillIndex' : 'fillHiddenIndex';
      } else {
        $r = 0 == $p->hidden ? 'transIndex' : 'transHiddenIndex';
      }
      $url = route($r, self::params($p));
    }
    return $url;
  }
}
