<?php
namespace App\Http\Components;

use Auth;
use \App\User;

/**
* Tagファサードの処理実装クラス
* 松田追加
*/
class Tag
{
  // トップページタブ
  const TAB_TRYOUT = 0;
  const TAB_INDEX = 1;
  const TAB_ADD = 2;
  const TAB_TYPE = 3;

  /**
   *
   */
   public static function echoTabAry() {
     $tryout = self::TAB_TRYOUT;
     $index = self::TAB_INDEX;
     $add = self::TAB_ADD;
     $type = self::TAB_TYPE;
 $tag = <<< EOM
 let tabAry = {'try_tab': {$tryout}, 'add_tab': {$add}, 'type_tab': {$type}, 'idx_tab': {$index} };
 EOM;
     echo $tag;
   }

  /**
  * null か 空文字であるかの真偽値を返す
  *
  * @param  オブジェクト
  * @return null か 空文字である場合はtrue、それ以外の場合はfalse
  */
  public static function hello() {
    echo "<p>こんにちは</p>";
  }

  /**
   * かわいいボタンCSS
   * @return かわいいボタンのCSS
   */
  public static function cuteBtnCss() {
$tag = <<< EOM
<style>
.CuteBtn {
  font-family: "Modak", cursive;
  font-size: 20px;
  display: inline-block;
  padding: 0.2em 1em 0.1em;
  color: #ff0066;
  border: solid 2px #ff0066;
  border-radius: 5px;
  background-color: #fff0f8;
  cursor: pointer;
}
</style>
EOM;
    echo $tag;
  }

  /**
  * かわいいボタンHtml
  *
  * @param  ボタンに表示する文字列
  * @return かわいいボタンを設置するHtml
  */
  public static function cuteBtnHtml($text) {
$tag = <<< EOM
<button class="CuteBtn" onclick="movePageWithTab('/')">{$text}</button>
EOM;
    echo $tag;
  }
}
