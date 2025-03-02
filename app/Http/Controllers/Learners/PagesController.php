<?php

namespace App\Http\Controllers\Learners;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\LearnQuestion;
use App\Models\Params;
use Carbon\Carbon;

class PagesController extends Controller
{
  /**
   * 中国語勉強サイトトップ
   */
  public function qtop(Request $rq) {
    $list = LearnQuestion::all()->sortBy('a');
    $style = 'sakura';
    return view('learner.top', compact(['list', 'style']));
  }

  /**
   * 翻訳問題一覧ページ表示
   */
  public function transIndex(Request $rq) {

    $type = LearnQuestion::TRANSLATE;
    $hidden = false;
    $p = new Params($rq);
    $p->setAction();
    $page = $p->page;

    $list = self::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    $title = "翻訳問題一覧";
    return view('learner.q-index', compact(['title', 'list', 'type', 'hidden', 'page', 'p']));
  }

  /**
   * 非表示翻訳問題一覧ページ表示
   */
  public function transHiddenIndex(Request $rq) {

    $p = new Params($rq);
    $p->type = $type = LearnQuestion::TRANSLATE;
    $p->hidden = $hidden = 1;
    $p->setAction();
    $page = $p->page;

    $list = self::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    $title = "翻訳問題倉庫";
    return view('learner.q-index', compact(['title', 'list', 'type', 'hidden', 'page', 'p']));
  }

  /**
   * 穴埋め問題一覧ページ表示
   */
  public function fillIndex(Request $rq) {

    $p = new Params($rq);
    $p->type = $type = LearnQuestion::FILLBLANK;
    $p->hidden = $hidden = 0;
    $p->setAction();
    $page = $p->page;

    $list = self::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    $title = "穴埋め問題一覧";
    return view('learner.q-index', compact(['title', 'list', 'type', 'hidden', 'page', 'p']));
  }

  /**
   * 非表示穴埋め問題一覧ページ表示
   */
  public function fillHiddenIndex(Request $rq) {

    $p = new Params($rq);
    $p->type = $type = LearnQuestion::FILLBLANK;
    $p->hidden = $hidden = 1;
    $p->setAction();
    $page = $p->page;

    $list = self::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    $title = "穴埋め問題倉庫";
    return view('learner.q-index', compact(['title', 'list', 'type', 'hidden', 'page', 'p']));
  }

  /**
   * 翻訳問題を非表示にする
   */
  public function hideTrans(Request $rq) {
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = true;
    $item->save();
    return redirect()->route('transIndex', ['page' => $rq->page]);
  }

  /**
   * 非表示の翻訳問題を表示する
   */
  public function showHiddenTrans(Request $rq) {
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = false;
    $item->save();
    return redirect()->route('transHidden', ['page' => $rq->page]);
  }

  /**
   * 穴埋め問題を非表示にする
   */
  public function hideFill(Request $rq) {
    $form = $rq->all();
    //dd($form);
    $item = LearnQuestion::find($rq->id);
    $item->hidden = true;
    $item->save();
    return redirect()->route('fillIndex', ['page' => $rq->page]);
  }

  /**
   * 非表示の穴埋め問題を表示する
   */
  public function showHiddenFill(Request $rq) {
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = false;
    $item->save();
    return redirect()->route('fillHidden', ['page' => $rq->page]);
  }

  /**
   * 問題詳細ページ表示
   */
   public function qDetail(Request $rq) {
    $q = LearnQuestion::find($rq->id);
    return view('learner.trans-detail', compact(['q']));
  }

  /**
   * 問題の解答チェック
   */
   public function qCheck(Request $rq) {
    $this->validate($rq, LearnQuestion::$ansRules);
    $q = LearnQuestion::find($rq->id);
    $result = $q->a == $rq->a;
    self::updateResult($q, $result);
    return view('learner.trans-result', compact(['q', 'result']));
  }

  /**
   * 問題新規登録画面表示
   */
  public function add(Request $rq) {
    return view('learner.trans-add');
  }

  /**
   * 問題新規登録
   */
   public function create(Request $rq) {
    $this->validate($rq, LearnQuestion::$rules);
    $q = new LearnQuestion();
    $q->fill($rq->all());
    $q->save();
    return redirect('learner/');
  }

  /**
   * 問題編集ページ表示
   */
   public function edit(Request $rq) {
    $q = LearnQuestion::find($rq->id);
    $p = new Params($rq);
    return view('learner.trans-edit', compact(['q', 'p']));
  }

  /**
   * 問題更新
   */
   public function update(Request $rq) {
    $this->validate($rq, LearnQuestion::$rules);
    $q = LearnQuestion::find($rq->id);
    $q->fill($rq->all());
    $q->updated_at = Carbon::now();
    $q->save();
    $p = new Params($rq);
    return redirect()->route(0 != $p->hidden ? 'transHidden' : 'transIndex', $p->get());
  }

  /**
   * 問題新規登録画面表示
   */
  public function addFill(Request $rq) {
    return view('learner.fill-add');
  }

  /**
   * 問題新規登録
   */
  public function createFill(Request $rq) {
    $this->validate($rq, LearnQuestion::$rules);
    $q = new LearnQuestion();
    $q->fill($rq->all());
    $q->save();
    return redirect('learner/fill');
  }

  /**
   * 問題編集ページ表示
   */
  public function editFill(Request $rq) {
    $q = LearnQuestion::find($rq->id);
    $p = new Params($rq);
    return view('learner.fill-edit', compact(['q', 'p']));
  }

  /**
   * 問題更新
   */
  public function updateFill(Request $rq) {
    $this->validate($rq, LearnQuestion::$rules);
    $q = LearnQuestion::find($rq->id);
    $q->fill($rq->all());
    $q->updated_at = Carbon::now();
    $q->save();
    $p = new Params($rq);
    return redirect()->route(0 != $p->hidden ? 'fillHidden' : 'fillIndex', $p->get());
  }

  /**
   * 問題詳細ページ表示
   */
  public function fillDetail(Request $rq) {
    $q = LearnQuestion::find($rq->id);
    return view('learner.fill-detail', compact(['q']));
  }

  /**
   * 問題の解答チェック
   */
  public function fillCheck(Request $rq) {
    $this->validate($rq, LearnQuestion::$ansRules);
    $q = LearnQuestion::find($rq->id);
    $result = $q->a == $rq->a;
    self::updateResult($q, $result);
    return view('learner.fill-result', compact(['q', 'result']));
  }


  /**
   * 一覧ページに渡す頁番号を返す
   */
  private static function getPage(Request $rq) {
    $page = empty($rq->page) ? 1 : $rq->page;
    return $page;
  }

  /**
   * 一覧ページのソート項目名を返す
   */
  private static function getSort(Request $rq) {
    $sort = empty($rq->s) ? 'id' : $rq->sort;
    return $sort;
  }

  /**
   * 一覧ページのソート順を返す
   */
  private static function getOrder(Request $rq) {
    $order = empty($rq->o) ? 'asc' : $rq->order;
    return $order;
  }

  /**
   * 一覧ページの検索文字列を返す
   */
  private static function getQuery(Request $rq) {
    $query = empty($rq->q) ? '' : $rq->q;
    return $query;
  }

  /*
   * 一覧ページの検索クエリを返す
   */
  private static function getIndexQuery(Params $p) {
    if (empty($p->query)) {
      return LearnQuestion::query()->where([['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        orderBy($p->sort, $p->order);
    } else {
      return LearnQuestion::query()->
        where([['q', 'like', '%' . $p->query . '%'], ['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        orWhere([['a', 'like', '%' . $p->query . '%'], ['type', '=', $p->type], ['hidden', '=', $p->hidden]])->
        groupBy('id')->orderBy($p->sort, $p->order);
    }
  }

  /**
   * DBに結果反映
   */
  private static function updateResult($q, $result) {

    ++$q->tried;
    if ($result) {
      ++$q->cleared;
    }
    $q->ratio = (int)(round($q->cleared / $q->tried, 1) * 1000);
    $q->save();
  }

  public function sakura(Request $req) {
    $q = "テルミサルタン";
    $opt = ["1" => "ミカムロ", "2" => "オキシテトラコーン", "3" => "ジルムロ", "4" => "イルアミクス", "5" => "アマルエット"];
    $sel = [];
    foreach($opt as $key => $val) {
      $sel[] = new LearnQuestion($key, $val);
    }
    //dd($sel);
    return view('learner.sakura', compact(['q', 'sel']));
  }

  public function checkAnswer(Request $req) {
    $q = "テルミサルタン";
    $opt = ["1" => "ミカムロ", "2" => "オキシテトラコーン", "3" => "ジルムロ", "4" => "イルアミクス", "5" => "アマルエット"];
    $sel = [];
    foreach($opt as $key => $val) {
      $sel[] = new LearnQuestion($key, $val);
    }

    return view('learner.sakura', compact(['q', 'sel']));
  }

  public function stars(Request $req) {
    return view('learner.stars');
  }

  public function momiji(Request $req) {
    return view('learner.momiji');
  }

  public function confetti(Request $req) {
    return view('learner.confetti');
  }

  public function starwars(Request $req) {
    //return view('learner.starwars');
    return view('learner.sw');
  }
}
