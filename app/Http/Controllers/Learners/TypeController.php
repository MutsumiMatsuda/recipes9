<?php

namespace App\Http\Controllers\Learners;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Models\QType;
use App\Models\Tryout;
use App\Models\Params;
use App\Models\QTag;
use App\Models\LearnQuestionTag;
use Validator;
use Carbon\Carbon;
use Overtrue\Pinyin\Pinyin;
use Stichoza\GoogleTranslate\GoogleTranslate;

class TypeController extends Controller
{
  /**
   * 問題種類一覧ページ表示
   */
  public function index(Request $rq) {
    $p = new Params($rq);
    //$p->type = LearnQuestion::TRANSLATE;
    $p->hidden = 0;
    $p->title = "問題種類一覧";
    $p->setAction();

    $list = QType::all();
    return view('learner.type-index', compact(['list', 'p']));
  }

  /**
   * 問題種類詳細ページ表示
   */
   public function detail(Request $rq) {
    $p = new Params($rq);
    $t = QType::find($rq->id);
    return view('learner.type-detail', compact(['t', 'p']));
  }

  /**
   * 問題種類登録画面表示
   */
  public function add(Request $rq) {
     $p = new Params($rq);
     return view('learner.type-add', compact(['p']));
  }

  /**
   * 問題種類登録
   */
  public function create(Request $rq) {
    $p = new Params($rq);
    $this->validate($rq, QType::$rules);
    $t = new QType();
    $t->fill($rq->all());
    $t->order = QType::count() + 1;
    $t->save();

    return redirect()->route('learnerTop', $p->getWithoutId());
  }

  /**
   * 問題種類編集ページ表示
   */
  public function edit(Request $rq) {
    $p = new Params($rq);
    $t = QType::find($rq->id);
    return view('learner.type-edit', compact(['t', 'p']));
  }

  /**
   * 翻訳(単語)問題更新
   */
  public function update(Request $rq) {
    $this->validate($rq, LearnQuestion::$rules);
    $t = QType::find($rq->id);
    $t->fill($rq->all());
    $t->updated_at = Carbon::now();
    $t->save();

    $p = new Params($rq);
    return redirect()->route('transIndex', $p->getWithoutId());
  }
}
