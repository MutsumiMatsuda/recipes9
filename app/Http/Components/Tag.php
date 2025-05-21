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
  /**
  * null か 空文字であるかの真偽値を返す
  *
  * @param  オブジェクト
  * @return null か 空文字である場合はtrue、それ以外の場合はfalse
  */
  public static function hello() {
    echo "<p>こんにちは</p>";
  }

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
  * 文字列が等価であるかの真偽値を返す
  *
  * @param  比較対象String１
  * @param  比較対象String２
  * @return 文字列が等価ならtrue、それ以外の場合はfalse
  */
  public static function cuteBtnHtml($text) {
$tag = <<< EOM
<button class="CuteBtn">{$text}</button>
EOM;
    echo $tag;
  }

  public static function cuteButtonParts() {
$tag = <<< EOM
<!-- symbols -->
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="donut" viewBox="0 0 14 14">
    <path fill="#F4157E" fill-rule="nonzero" d="M7 12c2.76 0 5-2.24 5-5S9.76 2 7 2 2 4.24 2 7s2.24 5 5 5zm0 2c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"/>
  </symbol>

  <symbol id="circle" viewBox="0 0 10 10">
    <circle cx="5" cy="5" r="5" fill="#F4157E" fill-rule="evenodd"/>
  </symbol>

  <symbol id="tri_hollow" viewBox="0 0 12 11">
    <path fill="#F4157E" fill-rule="nonzero" d="M3.4 8.96h5.2L6 4.2 3.4 8.95zM6 0l6 11H0L6 0z"/>
  </symbol>

  <symbol id="triangle" viewBox="0 0 10 9">
    <path fill="#F4157E" fill-rule="evenodd" d="M5 0l5 9H0"/>
  </symbol>

  <symbol id="square" viewBox="0 0 8 8">
    <path fill="#F4157E" fill-rule="evenodd" d="M0 0h8v8H0z"/>
  </symbol>

  <symbol id="squ_hollow" viewBox="0 0 8 8">
    <path fill="#F4157E" fill-rule="nonzero" d="M1.5 1.5v5h5v-5h-5zM0 0h8v8H0V0z"/>
  </symbol>
</svg>
EOM;
    echo $tag;
  }

  public static function cuteButtonJs() {
$tag = <<< EOM
// tilt.js
$('.CuteButton').tilt({ scale: 1.1, speed: 1000 });

// click event
$('.CuteButton').on('click', function(e) {
  explode(e.pageX, e.pageY);
});

document.addEventListener("touchstart", function(){}, true);

// symbols
function explode(x, y) {

  var symbolArray = [
    '#donut',
    '#circle',
    '#tri_hollow',
    '#triangle',
    '#square',
    '#squ_hollow'
  ];

  var particles = 10,
      explosion = $('.CuteButton-wrapper');

  for (var i = 0; i < particles; i++) {

    var randomSymbol = Math.floor(Math.random()*symbolArray.length);
    // positioning x,y of the particles
    var x = (explosion.width() / 2) + rand(80, 150) * Math.cos(2 * Math.PI * i / rand(particles - 10, particles + 10)),
        y = (explosion.height() / 2) + rand(80, 150) * Math.sin(2 * Math.PI * i / rand(particles - 10, particles + 10)),
        deg = rand(0, 360) + 'deg',
        scale = rand(0.5, 1.1),
        // particle element creation
        elm = $(
          '<svg class="Symbol" style="top:' + y + 'px; left:' + x + 'px; transform: scale(' + scale + ') rotate(' + deg + ');">' +
          '<use xlink:href="' + symbolArray[randomSymbol] + '" />' +
          '</svg>'
         );

    if (i == 0) { // only need to target one of the symbols.
      // css3 animation end detection
      elm.one('webkitAnimationEnd oanimationend msAnimationEnd animationend', function(e) {
        elm.siblings('svg').remove().end().remove(); // remove particles when animation is over.
      });
    }
    explosion.prepend(elm);
  }
}

function rand(min, max) {
  return Math.floor(Math.random() * (max + 1)) + min;
}
EOM;
  }

  /**
  * JavaScriptによる確認画面付きの<a />タグを生成する
  * putComfirmJsとペアで使うことで、画面に確認画面付きのリンクを実装する
  *
  * @param $cssClass:スタイルシートのクラス名
  * @param $funcName:JavaScript関数名
  * @param $url:OKボタンで遷移するurl
  * @param <a />タグの表示ラベル
  * @return void
  */
  public static function confirmATag($cssClass, $funcName, $url, $lavel) {
      $aTag = "<a ";
      if (!self::isNullOrEmpty($cssClass)) {
        $aTag .= "class=\"" . $cssClass . "\" ";
      }
      $aTag .= "href=\"javascript:void(0);\"" . " onclick=\"" . $funcName . "('" . $url . "'); return false;\">" . $lavel . "</a>\n";
      echo $aTag;
  }

  /**
  * 確認画面を表示するJavaScriptを画面に出力する
  * confirmATagとペアで使うことで、画面に確認画面付きのリンクを実装する
  *
  * @param  $funcName:JavaScript関数名
  * @param  $msg:確認メッセージ
  * @return void
  */
  public static function putConfirmJs($funcName, $msg) {
    $script =
      'function ' . $funcName . "(\$url) {\n" .
    "    if(window.confirm('" . $msg . "')) {\n" .
    "      location.href = \$url;\n" .
    "    }\n" .
    "  }\n";
    echo $script;
  }
}
