<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  {{-- CSRF Token  --}}
  <meta name="csrf-token" content="{{ csrf_token() }}">

  {{-- titleタグ --}}
  <title>@yield('title')</title>

  <!-- Scripts -->
  {{-- Javascript --}}
  <script src="{{ asset('js/app.js') }}"></script>
  <script src="{{ asset('js/particles.min.js') }}"></script>
  @yield('customjs')
  {{-- @php $bgjs = 'js/' . $__env->yieldContent('bgtype') . '.js'; @endphp
      <link href="{{ asset($bgcss) }}" rel="stylesheet"> --}}

  <!-- Fonts -->
  <link rel="dns-prefetch" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

  <!-- Styles -->
  {{-- CSS --}}
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
  <link href="{{ asset('css/common.css') }}" rel="stylesheet">
  @yield('customcss')

</head>
<body>
  <div id="app">
    {{-- 画面上部に表示するナビゲーションバーです。 --}}
    <div class='fixed-top mb-2'>
      <nav class="navbar navbar-expand-md navbar-dark navbar-laravel">
        <div class="container">
          <a class="navbar-brand" href="{{ url('/learner') }}">
            問題集
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
                <li><a class="nav-link" href="/recipe">レシピへ</a></li>
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    {{ Auth::user()->name }} <span class="caret"></span>
                  </a>

                  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="{{ route('learnerTop') }}">中国語学習トップ</a>
                    <a class="dropdown-item" href="{{ route('fillAdd') }}">穴埋め作成</a>
                    <a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::TRANSLATE]) }}">翻訳作成</a>
                    <a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::KANPOWORD]) }}">生薬単語作成</a>
                    <a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::BIZWORD]) }}">Biz単語作成</a>
                    <a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::OTHERWORD]) }}">一般単語作成</a>
                    {{--
                    <a class="dropdown-item" href="{{ route('fillAdd') }}">穴埋め問題作成</a>
                    <a class="dropdown-item" href="{{ route('transIndex') }}">翻訳問題一覧</a>
                    <a class="dropdown-item" href="{{ route('transAdd') }}">翻訳問題作成</a>
                    <a class="dropdown-item" href="{{ route('fillHidden') }}">穴埋め問題倉庫</a>
                    <a class="dropdown-item" href="{{ route('transHidden') }}">翻訳問題倉庫</a>
                    --}}
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
    </div>
    {{-- ここまでナビゲーションバー --}}
    @yield('content')
  </div>
</body>
@yield('js')
</html>
