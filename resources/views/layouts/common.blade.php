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
    {{-- 画面上部に表示するナビゲーションバーです。 --}}
    <nav class="navbar navbar-expand-md navbar-dark navbar-laravel">
      <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
          {{-- config('app.name', 'Laravel') --}}
          Recipes
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Left Side Of Navbar -->
          <ul class="navbar-nav ms-auto">
  	        <!-- Authentication Links -->
  	        {{-- ログインしていなかったらログイン画面へのリンクを表示 --}}
  	        @guest
	            <li><a class="nav-link" href="{{ route('login') }}">ログイン</a></li>
  	        {{-- ログインしていたらユーザー名とログアウトボタンを表示 --}}
  	        @else
              <li><a class="nav-link" href="/learner">中国語問題へ</a></li>
              <li><a class="nav-link" href="/recipe">一般画面へ</a></li>
	            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  {{ Auth::user()->name }} <span class="caret"></span>
                </a>

                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="{{ route('addrecipe') }}">レシピ追加</a>
                  <a class="dropdown-item" href="{{ route('recipe') }}">レシピ一覧</a>
                  <a class="dropdown-item" href="{{ route('menu') }}">献立一覧</a>
                  <a class="dropdown-item" href="{{ route('category') }}">タイプ一覧</a>
                  <a class="dropdown-item" href="{{ route('material') }}">材料一覧</a>
                  <a class="dropdown-item" href="{{ route('nutrient') }}">栄養素一覧</a>
                  <a class="dropdown-item" href="{{ route('howto') }}">調理法一覧</a>
                  <a class="dropdown-item" href="{{ route('country') }}">国別料理一覧</a>
                  <a class="dropdown-item" href="{{ route('mainsub') }}">料理分類一覧</a>
                  <a class="dropdown-item" href="{{ route('season') }}">旬一覧</a>
                  <a class="dropdown-item" href="{{ route('tag') }}">検索タグ一覧</a>
                  <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                    ログアウト
                  </a>
                  <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                    @csrf
                  </form>
                </div>
	            </li>
  	        @endguest
          </ul>

          <!-- Right Side Of Navbar -->
          <ul class="navbar-nav">

          </ul>
        </div>
      </div>
    </nav>
    {{-- ここまでナビゲーションバー --}}

    <main class="py-4">
      {{-- コンテンツをここに入れるため、@yieldで空けておきます。 --}}
      @yield('content')
    </main>
  </div>
</body>
@yield('js')
</html>