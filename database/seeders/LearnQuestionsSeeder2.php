<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\LearnQuestion;
use Carbon\Carbon;

class LearnQuestionsSeeder2 extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      LearnQuestion::initRatio(2, 3);
      //\DB::table('learn_questions')->truncate();
      \DB::table('learn_questions')->insert([
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我明*會發電子郵件給你',
          'q' => '明日君にメールします',
          'a' => '天',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '*想預定',
          'q' => '予約をしたいです',
          'a' => '我',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '村*們破壞了森林',
          'q' => '村人たちは森を破壊した',
          'a' => '民',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我們以*住在美國',
          'q' => '私たちはアメリカに住んでいた',
          'a' => '前',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我想我需要醫*',
          'q' => '私は医者にかかる必要があると思います',
          'a' => '生',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '*如何看待古典音樂？',
          'q' => 'クラシック音楽についてどう思いますか？',
          'a' => '你',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '孩子*從學校回家',
          'q' => '子どもたちは学校から家に帰ってくる',
          'a' => '們',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我能就這個問*得到你的建議嗎？',
          'q' => 'その問題についてアドバイスをもらえますか？',
          'a' => '題',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '抱*，您剛才說什麼？',
          'q' => 'すみません、何を言いましたか？',
          'a' => '歉',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '她的兒子有摩托*嗎？',
          'q' => '彼女の息子はバイクを持っている？',
          'a' => '車',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '對不起，*們賣完了',
          'q' => 'ごめんなさい、売り切れです',
          'a' => '我',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你發現有什*不尋常的東西嗎',
          'q' => '変わったことに気づきましたか？',
          'a' => '麼',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你單身*？--不，我結婚了',
          'q' => '君は独身ですか？―いいえ、私は結婚しています',
          'a' => '嗎',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你在等你*媽嗎？',
          'q' => 'お母さんを待っているの？',
          'a' => '媽',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '湯品嘗鮮*',
          'q' => 'スープがおいしいです',
          'a' => '美',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我喜歡在*閑時間做志願者',
          'q' => '私は自由時間にボランティアするのが好きです',
          'a' => '空',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '客人名單上有*的名字嗎？',
          'q' => '君の名前は訪問者のリストにありますか？',
          'a' => '你',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你想租影片*？',
          'q' => '映画を借りませんか？',
          'a' => '嗎',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '原木*浮在河上',
          'q' => '丸太は川に浮かんだ',
          'a' => '漂',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '今天*會下雨',
          'q' => '今日は雨が降らないはずです',
          'a' => '不',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我們*天步行去了海邊',
          'q' => '昨日私たちは海まで歩いた',
          'a' => '昨',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '牛*發現了引力理論',
          'q' => 'ニュートンは重力理論を発見した',
          'a' => '頓',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你的膝*還會受傷嗎？',
          'q' => '膝はまだ痛いですか？',
          'a' => '蓋',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '*壁爐的周圍要小心',
          'q' => '暖炉の周りでは注意してください',
          'a' => '在',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你能夠參加婚禮*？',
          'q' => '君は結婚式に参加することができますか？',
          'a' => '嗎',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '這是一個夢還是這個現*？',
          'q' => 'これは夢ですか？それとも現実ですか？',
          'a' => '實',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '明*會下雨',
          'q' => '明日は雨が降るはずです',
          'a' => '天',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
      ]);
    }
}
