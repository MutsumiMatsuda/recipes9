<?php

namespace App\Http\Controllers\Learners;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\LearnQuestion;
use App\Models\Tryout;
use App\Models\Params;
use App\Models\QTag;
use App\Models\LearnQuestionTag;
use Validator;
use Carbon\Carbon;
use Overtrue\Pinyin\Pinyin;
use Stichoza\GoogleTranslate\GoogleTranslate;

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
    $p = new Params($rq);
    $p->type = LearnQuestion::TRANSLATE;
    $p->hidden = 0;
    $p->title = "翻訳問題一覧";
    $p->setAction();
    $page = $p->page;
    $tags = QTag::all();

    $list = LearnQuestion::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    return view('learner.q-index', compact(['list', 'page', 'p', 'tags']));
  }

  /**
   * 非表示翻訳問題一覧ページ表示
   */
  public function transHiddenIndex(Request $rq) {

    $p = new Params($rq);
    $p->type = LearnQuestion::TRANSLATE;
    $p->hidden = 1;
    $p->title = "翻訳問題倉庫";
    $p->setAction();
    $page = $p->page;
    $tags = QTag::all();

    $list = LearnQuestion::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    return view('learner.q-index', compact(['list', 'page', 'p', 'tags']));
  }

  /**
   * 穴埋め問題一覧ページ表示
   */
  public function fillIndex(Request $rq) {

    $p = new Params($rq);
    //dd($p->tagId, $p->query);
    $p->type = LearnQuestion::FILLBLANK;
    $p->hidden = 0;
    $p->title = "穴埋め問題一覧";
    $p->setAction();
    $page = $p->page;
    $tags = QTag::all();

    $list = LearnQuestion::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    return view('learner.q-index', compact(['list', 'page', 'p', 'tags']));
  }

  /**
   * 非表示穴埋め問題一覧ページ表示
   */
  public function fillHiddenIndex(Request $rq) {

    $p = new Params($rq);
    $p->type = LearnQuestion::FILLBLANK;
    $p->hidden = 1;
    $p->title = "穴埋め問題倉庫";
    $p->setAction();
    $page = $p->page;
    $tags = QTag::all();

    $list = LearnQuestion::getIndexQuery($p)->paginate(LearnQuestion::PAGENATE);
    return view('learner.q-index', compact(['list', 'page', 'p', 'tags']));
  }

  /**
   * 翻訳問題を非表示にする
   */
  public function hideTrans(Request $rq) {
    $p = new Params($rq);
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = true;
    $item->save();
    return redirect()->route('transIndex', $p->getWithoutId());
  }

  /**
   * 非表示の翻訳問題を表示する
   */
  public function showHiddenTrans(Request $rq) {
    $p = new Params($rq);
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = 0;
    $item->save();
    return redirect()->route('transHidden', $p->getWithoutId());
  }

  /**
   * 穴埋め問題を非表示にする
   */
  public function hideFill(Request $rq) {
    $p = new Params($rq);
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = 1;
    $item->save();
    return redirect()->route('fillIndex', $p->getWithoutId());
  }

  /**
   * 非表示の穴埋め問題を表示する
   */
  public function showHiddenFill(Request $rq) {
    $p = new Params($rq);
    $form = $rq->all();
    $item = LearnQuestion::find($rq->id);
    $item->hidden = 0;
    $item->save();
    return redirect()->route('fillHidden', $p->getWithoutId());
  }

  /**
   * 翻訳問題詳細ページ表示
   */
   public function qDetail(Request $rq) {
    $p = new Params($rq);
    $q = LearnQuestion::find($rq->id);
    return view('learner.trans-detail', compact(['q', 'p']));
  }

  /**
   * 翻訳問題の解答チェック
   */
   public function qCheck(Request $rq) {
    $p = new Params($rq);
    $this->validate($rq, LearnQuestion::$ansRules);
    $q = LearnQuestion::find($rq->id);
    $result = $q->a == $rq->a;
    self::updateResult($q, $result);
    return view('learner.trans-result', compact(['q', 'p', 'result']));
  }

  /**
   * 翻訳問題新規登録画面表示
   */
  public function add(Request $rq) {
     $p = new Params($rq);
     $tags = QTag::all();
     return view('learner.trans-add', compact(['p', 'tags']));
  }

  /**
   * 問題新規登録
   */
  public function create(Request $rq) {
    $p = new Params($rq);
    $this->validate($rq, LearnQuestion::$rules);
    $q = new LearnQuestion();
    $q->fill($rq->all());
    $q->save();

    // タグの登録
    if ($rq->tags) {
      foreach($rq->tags as $tagId => $value) {
        $lqtag = New LearnQuestionTag;
        $lqtag->learn_question_id = $q->id;
        $lqtag->q_tag_id = $tagId;
        $lqtag->save();
      }
    }

    return redirect()->route('transIndex', $p->getWithoutId());
  }

  /**
   * 問題編集ページ表示
   */
  public function edit(Request $rq) {
    $p = new Params($rq);
    $q = LearnQuestion::find($rq->id);
    $tags = QTag::all();
    return view('learner.trans-edit', compact(['q', 'p', 'tags']));
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

    // タグの更新
    LearnQuestionTag::where('learn_question_id', $q->id)->delete();
    if ($rq->tags) {
      foreach($rq->tags as $tagId => $value) {
        $lqtag = New LearnQuestionTag;
        $lqtag->learn_question_id = $q->id;
        $lqtag->q_tag_id = $tagId;
        $lqtag->save();
      }
    }

    $p = new Params($rq);
    return redirect()->route(0 != $p->hidden ? 'transHidden' : 'transIndex', $p->getWithoutId());
  }

  /**
   * 問題新規登録画面表示
   */
  public function addFill(Request $rq) {
    $p = new Params($rq);
    $tags = QTag::all();
    return view('learner.fill-add', compact(['p', 'tags']));
  }

  /**
   * 問題新規登録
   */
  public function createFill(Request $rq) {
    // バリデーション
    $validator = Validator::make($rq->all(), LearnQuestion::$ansRules);
    if ($validator->fails()) {
      return redirect()->route('fillAdd')->withErrors($validator)->withInput();
    }

    // 問題文のどちらか片方は必須
    if (empty($rq->q_head) && empty($rq->q_tail) ) {
      $validator->errors()->add('q_head', '問題文前と後の、どちらか又は両方を入力して下さい。');
      return redirect()->route('fillAdd')->withErrors($validator)->withInput();
    }

    $form = $rq->all();
    unset($form['q_head'], $form['q_tail'], $form['_token']);
    $form['hint1'] = LearnQuestion::makeFillQuestion($rq->q_head, $rq->q_tail);
    $q = new LearnQuestion();
    $q->fill($form);
    $q->save();

    // タグの登録
    if ($rq->tags) {
      foreach($rq->tags as $tagId => $value) {
        $lqtag = New LearnQuestionTag;
        $lqtag->learn_question_id = $q->id;
        $lqtag->q_tag_id = $tagId;
        $lqtag->save();
      }
    }

    $p = new Params($rq);
    return redirect()->route('fillIndex', compact(['p']));
  }

  /**
   * 問題編集ページ表示
   */
  public function editFill(Request $rq) {
    $q = LearnQuestion::find($rq->id);
    $p = new Params($rq);
    $tags = QTag::all();
    return view('learner.fill-edit', compact(['q', 'p', 'tags']));
  }

  /**
   * 問題更新
   */
  public function updateFill(Request $rq) {
    // バリデーション
    $validator = Validator::make($rq->all(), LearnQuestion::$ansRules);
    if ($validator->fails()) {
      return redirect()->route('fillAdd')->withErrors($validator)->withInput();
    }

    // 問題文のどちらか片方は必須
    if (empty($rq->q_head) && empty($rq->q_tail) ) {
      $validator->errors()->add('q_head', '問題文前と後の、どちらか又は両方を入力して下さい。');
      return redirect()->route('fillAdd')->withErrors($validator)->withInput();
    }

    $form = $rq->all();
    unset($form['q_head'], $form['q_tail'], $form['_token']);
    $form['hint1'] = LearnQuestion::makeFillQuestion($rq->q_head, $rq->q_tail);

    $q = LearnQuestion::find($rq->id);
    $q->fill($form);
    $q->updated_at = Carbon::now();
    $q->save();

    // タグの更新
    LearnQuestionTag::where('learn_question_id', $q->id)->delete();
    if ($rq->tags) {
      foreach($rq->tags as $tagId => $value) {
        $lqtag = New LearnQuestionTag;
        $lqtag->learn_question_id = $q->id;
        $lqtag->q_tag_id = $tagId;
        $lqtag->save();
      }
    }

    $p = new Params($rq);
    return redirect()->route(0 != $p->hidden ? 'fillHidden' : 'fillIndex', $p->getWithoutId());
  }

  /**
   * 問題詳細ページ表示
   */
  public function fillDetail(Request $rq) {
    $p = new Params($rq);
    $q = LearnQuestion::find($rq->id);
    return view('learner.fill-detail', compact(['q', 'p']));
  }

  /**
   * 問題の解答チェック
   */
  public function fillCheck(Request $rq) {
    $p = new Params($rq);
    $this->validate($rq, LearnQuestion::$ansRules);
    $q = LearnQuestion::find($rq->id);
    $result = $q->a == $rq->a;
    self::updateResult($q, $result);
    return view('learner.fill-result', compact(['q', 'result', 'p']));
  }

  /**
   * 難易度高め翻訳問題集を新規作成して一覧表示
   */
  public function tryTrans(Request $rq) {
    Tryout::createHard(LearnQuestion::TRANSLATE);
    return redirect()->route('tryPrevTrans');
  }

  /**
   * 前回の難易度高め翻訳問題集を一覧表示
   */
  public function tryPrevTrans(Request $rq) {
    $tryout = Tryout::latest(LearnQuestion::TRANSLATE);
    $p = new Params($rq);
    $p->tryId = $tryout->id;
    return view('learner.q-tryout', compact(['tryout', 'p']));
  }

  /**
   * 難易度高め穴埋め問題集を新規作成して一覧表示
   */
  public function tryFill(Request $rq) {
    Tryout::createHard(LearnQuestion::FILLBLANK);
    return redirect()->route('tryPrevFill');
  }

  /**
   * 前回の難易度高め穴埋め問題集を一覧表示
   */
  public function tryPrevFill(Request $rq) {
    $tryout = Tryout::latest(LearnQuestion::FILLBLANK);
    $p = new Params($rq);
    $p->tryId = $tryout->id;
    return view('learner.q-tryout', compact(['tryout', 'p']));
  }

  /**
   * 中国語に翻訳
   */
  public function getChinese(Request $rq) {
    $zh = GoogleTranslate::trans($rq->japanese, 'zh');
    return response()->json(['zh' => $zh]);
  }

  /**
   * 中国語からピンインを取得
   */
  public function getPinyin(Request $rq) {
    $pinyin = Pinyin::sentence($rq->chinese)->join();
    $english = GoogleTranslate::trans($rq->chinese);
    //dd($en);
    //$pinyin = Pinyin::sentence($rq->a)->join();
    return response()->json(['pinyin' => $pinyin, 'english' => $english]);
  }

  /*------------------------------
    スタティックメンバー
  -------------------------------*/
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
