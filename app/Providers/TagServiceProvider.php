<?php
/**
* Utlクラスのサービスプロバイダ
* 松田追加
*/

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class TagServiceProvider extends ServiceProvider
{
  /**
   * Bootstrap services.
   *
   * @return void
   */
  public function boot()
  {
      //
  }

  /**
   * Register services.
   *
   * @return void
   */
  public function register()
  {
    $this->app->singleton('tag', function() {
      return new \App\Http\Components\Tag;
    });
  }
}
