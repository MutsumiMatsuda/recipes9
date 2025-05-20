<?php // app/Facades/utl.php
/**
* Utlのファサードクラス
* 松田追加
*/
namespace App\Facades;

use Illuminate\Support\Facades\Facade;

/**
* Bladeのビューで利用できるユーティリティ関数を保持するクラス
*/
class Tag extends Facade {
  protected static function getFacadeAccessor() {
    return 'tag';
  }
}
