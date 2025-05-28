<?php
namespace App\Http\Components;

use Auth;
use \App\User;
use Cnst;

/**
* Tagファサードの処理実装クラス
* 松田追加
*/
class Tg {
  /**
   *
   */
  public static function isSelectedArea($p, $areaName) {
    return Cnst::TAB_ARY[$p->tab] == $areaName ? "true" : "false";
  }

  /**
   *
   */
  public static function isActiveTab($p, $tabName) {
    return Cnst::TAB_ARY[$p->tab] == $tabName ? "active" : "";
  }

  /**
   *
   */
  public static function isActiveTabPain($p, $tabName) {
    return Cnst::TAB_ARY[$p->tab] == $tabName ? "active show" : "";
  }

  /**
   * アクティブなtabの番号を返す
   */
  public static function echoTabAry() {
     $tryout = Cnst::TAB_TRYOUT;
     $index = Cnst::TAB_INDEX;
     $add = Cnst::TAB_ADD;
     $type = Cnst::TAB_TYPE;
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
  public static function cuteBtnHtml($p, $qt, $tab) {
    $url = '';
    switch ($tab) {
      case Cnst::TAB_INDEX:
        $p->tab = Cnst::TAB_INDEX;
        $url = $p->link2Index($qt->id);
        break;
      case Cnst::TAB_ADD:
        $p->tab = Cnst::TAB_ADD;
        $url = $p->link2Add($qt->id);
        break;
      case Cnst::TAB_TRYOUT:
      default:
        $p->tab = Cnst::TAB_TRYOUT;
        $url = $p->link2Tryout($qt->id);
        break;
    }
$tag = <<< EOM
<a href="{$url}"><button class="CuteBtn">{$qt->icon}</button></a>
EOM;
    echo $tag;
  }
}
