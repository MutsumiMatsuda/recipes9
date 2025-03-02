<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;

class AppServiceProvider extends ServiceProvider
{
  /**
   * Register any application services.
   *
   * @return void
   */
  public function register()
  {

  }

  /**
   * Bootstrap any application services.
   *
   * @return void
   */
  public function boot()
  {
    // ページングのBootstrap対応
    Paginator::useBootstrap();

    // 強制SSL化
    /*
    if(env('APP_ENV') != 'mu') {
      \URL::forceScheme('https');
    }
    */
  }
}
