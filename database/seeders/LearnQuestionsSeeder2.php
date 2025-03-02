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
          'q' => '*因斯坦証明了這個理論是真實的',
          'hint1' => 'アインシュタインはその理論が真実であると証明した',
          'a' => '愛',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '*想預定',
          'hint1' => '予約をしたいです',
          'a' => '我',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '村*們破壞了森林',
          'hint1' => '村人たちは森を破壊した',
          'a' => '民',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '我們以*住在美國',
          'hint1' => '私たちはアメリカに住んでいた',
          'a' => '前',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '我想我需要醫*',
          'hint1' => '私は医者にかかる必要があると思います',
          'a' => '生',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '*如何看待古典音樂？',
          'hint1' => 'クラシック音楽についてどう思いますか？',
          'a' => '你',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '孩子*從學校回家',
          'hint1' => '子どもたちは学校から家に帰ってくる',
          'a' => '們',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '我能就這個問*得到你的建議嗎？',
          'hint1' => 'その問題についてアドバイスをもらえますか？',
          'a' => '題',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '抱*，您剛才說什麼？',
          'hint1' => 'すみません、何を言いましたか？',
          'a' => '歉',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '她的兒子有摩托*嗎？',
          'hint1' => '彼女の息子はバイクを持っている？',
          'a' => '車',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '對不起，*們賣完了',
          'hint1' => 'ごめんなさい、売り切れです',
          'a' => '我',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '你發現有什*不尋常的東西嗎',
          'hint1' => '変わったことに気づきましたか？',
          'a' => '麼',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '你單身*？--不，我結婚了',
          'hint1' => '君は独身ですか？―いいえ、私は結婚しています',
          'a' => '嗎',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '你在等你*媽嗎？',
          'hint1' => 'お母さんを待っているの？',
          'a' => '媽',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '湯品嘗鮮*',
          'hint1' => 'スープがおいしいです',
          'a' => '美',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '我喜歡在*閑時間做志願者',
          'hint1' => '私は自由時間にボランティアするのが好きです',
          'a' => '空',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '客人名單上有*的名字嗎？',
          'hint1' => '君の名前は訪問者のリストにありますか？',
          'a' => '你',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '你想租影片*？',
          'hint1' => '映画を借りませんか？',
          'a' => '嗎',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '原木*浮在河上',
          'hint1' => '丸太は川に浮かんだ',
          'a' => '漂',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '今天*會下雨',
          'hint1' => '今日は雨が降らないはずです',
          'a' => '不',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '我們*天步行去了海邊',
          'hint1' => '昨日私たちは海まで歩いた',
          'a' => '昨',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '牛*發現了引力理論',
          'hint1' => 'ニュートンは重力理論を発見した',
          'a' => '頓',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '你的膝*還會受傷嗎？',
          'hint1' => '膝はまだ痛いですか？',
          'a' => '蓋',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '*壁爐的周圍要小心',
          'hint1' => '暖炉の周りでは注意してください',
          'a' => '在',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '你能夠參加婚禮*？',
          'hint1' => '君は結婚式に参加することができますか？',
          'a' => '嗎',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '這是一個夢還是這個現*？',
          'hint1' => 'これは夢ですか？それとも現実ですか？',
          'a' => '實',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'q' => '明*會下雨',
          'hint1' => '明日は雨が降るはずです',
          'a' => '天',
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
      ]);
    }
}
