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
      <nav class="navbar navbar-expand-md bg-body-secondary" data-bs-theme="dark">
        <div class="container-fluid">
          <a class="navbar-brand" href="{{ url('/learner') }}">問題集</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="ナビゲーションの切替">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbar">
             <!-- Left Side Of Navbar -->
            <ul class="navbar-nav me-auto">
              @guest
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="{{ route('login') }}">ログイン</a>
              </li>
              @else
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="/recipe">レシピへ</a>
              </li>
              <li class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ Auth::user()->name }}</a>
                <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="{{ route('learnerTop') }}">中国語学習トップ</a></li>
                  <li><a class="dropdown-item" href="{{ route('fillAdd') }}">穴埋め作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::TRANSLATE]) }}">翻訳作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::KANPOWORD]) }}">生薬単語作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::BIZWORD]) }}">Biz単語作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::OTHERWORD]) }}">一般単語作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('transAdd', ['t' => LearnQuestion::ENGWORD]) }}">英単語作成</a></li>
                  {{--
                  <li><a class="dropdown-item" href="{{ route('fillAdd') }}">穴埋め問題作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('transIndex') }}">翻訳問題一覧</a></li>
                  <li><a class="dropdown-item" href="{{ route('transAdd') }}">翻訳問題作成</a></li>
                  <li><a class="dropdown-item" href="{{ route('fillHidden') }}">穴埋め問題倉庫</a></li>
                  <li><a class="dropdown-item" href="{{ route('transHidden') }}">翻訳問題倉庫</a></li>
                  --}}
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
    @yield('content')
  </div>
</body>
@yield('js')
</html>
