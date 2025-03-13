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
          'hint1' => '我明*会发电子邮件给你',
          'q' => '明日君にメールします',
          'a' => '天',
          'pinyin' => 'wǒ míng tiān huì fā diàn zǐ yóu jiàn gěi nǐ',
          'en' => "I will email you tomorrow.",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '*想预定',
          'q' => '予約をしたいです',
          'a' => '我',
          'pinyin' => 'wǒ xiǎng yù dìng',
          'en' => "I want to book.",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '村*们破坏了森林',
          'q' => '村人たちは森を破壊した',
          'a' => '民',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我们以*住在美国',
          'q' => '私たちはアメリカに住んでいた',
          'a' => '前',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我想我需要医*',
          'q' => '私は医者にかかる必要があると思います',
          'a' => '生',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '*如何看待古典音乐？',
          'q' => 'クラシック音楽についてどう思いますか？',
          'a' => '你',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '孩子*从学校回家',
          'q' => '子どもたちは学校から家に帰ってくる',
          'a' => '们',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我能就这个问*得到你的建议吗？',
          'q' => 'その問題についてアドバイスをもらえますか？',
          'a' => '题',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '抱*，您刚才说什么？',
          'q' => 'すみません、何を言いましたか？',
          'a' => '歉',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '她的儿子有摩托*吗？',
          'q' => '彼女の息子はバイクを持っている？',
          'a' => '车',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '对不起，*们卖完了',
          'q' => 'ごめんなさい、売り切れです',
          'a' => '我',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你发现有什*不寻常的东西吗',
          'q' => '変わったことに気づきましたか？',
          'a' => '么',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你单身*？--不，我结婚了',
          'q' => '君は独身ですか？―いいえ、私は結婚しています',
          'a' => '吗',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你在等你*妈吗？',
          'q' => 'お母さんを待っているの？',
          'a' => '妈',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '汤品尝鲜*',
          'q' => 'スープがおいしいです',
          'a' => '美',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我喜欢在*闲时间做志愿者',
          'q' => '私は自由時間にボランティアするのが好きです',
          'a' => '空',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '客人名单上有*的名字吗？',
          'q' => '君の名前は訪問者のリストにありますか？',
          'a' => '你',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你想租影片*？',
          'q' => '映画を借りませんか？',
          'a' => '吗',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '原木*浮在河上',
          'q' => '丸太は川に浮かんだ',
          'a' => '漂',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '今天*会下雨',
          'q' => '今日は雨が降らないはずです',
          'a' => '不',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我们*天步行去了海边',
          'q' => '昨日私たちは海まで歩いた',
          'a' => '昨',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '牛*发现了引力理论',
          'q' => 'ニュートンは重力理論を発見した',
          'a' => '顿',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你的膝*还会受伤吗？',
          'q' => '膝はまだ痛いですか？',
          'a' => '盖',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '*壁炉的周围要小心',
          'q' => '暖炉の周りでは注意してください',
          'a' => '在',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '你能够参加婚礼*？',
          'q' => '君は結婚式に参加することができますか？',
          'a' => '吗',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '这是一个梦还是这个现*？',
          'q' => 'これは夢ですか？それとも現実ですか？',
          'a' => '实',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '明*会下雨',
          'q' => '明日は雨が降るはずです',
          'a' => '天',
          'pinyin' => '',
          'en' => "",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
        [
          'type' => LearnQuestion::FILLBLANK,
          'hint1' => '我可以在哪里为平板*脑充电？',
          'q' => 'タブレットはどこで充電できますか？',
          'a' => '电',
          'pinyin' => 'wǒ kě yǐ zài nǎ lǐ wéi píng bǎn diàn nǎo chōng diàn',
          'en' => "Where can I charge my tablet?",
          'ratio' => LearnQuestion::nextRatio(),
          'created_at' => Carbon::now(),
        ],
      ]);
    }
}
