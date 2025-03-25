<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- CSRF Token -->
  {{-- 後の章で説明します --}}
  <meta name="csrf-token" content="{{ csrf_token() }}">

  {{-- 各ページごとにtitleタグを入れるために@yieldで空けておきます。 --}}
  <title>@yield('title')</title>

  <!-- Scripts -->
  {{-- Laravel標準で用意されているJavascriptを読み込みます --}}
  <script src="{{ asset('js/app.js') }}" defer></script>

  <!-- Fonts -->
  <link rel="dns-prefetch" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

  <!-- Styles -->
  {{-- Laravel標準で用意されているCSSを読み込みます --}}
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
  {{-- この章の後半で作成するCSSを読み込みます --}}
  <link href="{{ asset('css/common.css') }}" rel="stylesheet">
  <link href="{{ asset('css/custom.css') }}" rel="stylesheet">
</head>
<body>
  <div id="app">
    {{-- 画面上部に表示するナビゲーションバー --}}
    <div class='fixed-top mb-2'>
      <nav class="navbar navbar-expand-md bg-body-secondary" data-bs-theme="dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="{{ url('/') }}">レシピ集</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="ナビゲーションの切替">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbar">
             <!-- Left Side Of Navbar -->
            <ul class="navbar-nav me-auto">
              @guest
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="{{ route('login') }}">>ログイン</a>
              </li>
              @else
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/learner">問題集へ</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/recipe">一般画面へ</a>
              </li>
              <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ Auth::user()->name }}</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="{{ route('addrecipe') }}">レシピ追加</a></li>
                  <li><a class="dropdown-item" href="{{ route('recipe') }}">レシピ一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('menu') }}">献立一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('category') }}">タイプ一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('material') }}">材料一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('nutrient') }}">栄養素一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('howto') }}">調理法一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('country') }}">国別料理一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('mainsub') }}">料理分類一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('season') }}">旬一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('tag') }}">検索タグ一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    ログアウト
                  </a></li>
                  <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                     @csrf
                  </form>
                </ul>
              </li>
              @endguest
            </ul>
          </div>
        </div>
      </nav>
    </div>
    {{-- ここまでナビゲーションバー --}}

    <main class="py-4">
      {{-- コンテンツをここに入れるため、@yieldで空けておきます。 --}}
      @yield('content')
    </main>
  </div>
</body>
@yield('js')
</html>