@extends('learner.layouts.common')

{{-- title --}}
@section('title', '中国語の学習')

@section('customjs')
<script src="{{asset('js/'. $style . '.js')}}" defer></script>
@endsection

@section('customcss')
<link href="{{asset('css/' . $style . '.css')}}" rel="stylesheet">
{{Tag::cuteBtnCss()}}
@endsection

@section('content')
<div id="particles-js"></div>
<div id="wrapper">
  <main class="py-3">
    <div class="row">
      <div class="col-md-3 mx-auto card bg-secondary">
        <div class="row py-1">
          <div class="col-md-6 mx-auto card bg-light" style="color : black;">
            <div class="align-items-center text-center" style="font-size: 20px; color: black">問題集</div>
          </div>
        </div>
        {{-- タブナビゲーション --}}
        <ul class="nav nav-pills mb-3" id="myTab" role="tablist">
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link active text-secondary" style="color: black"　id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" role="tab" aria-controls="home-tab-pane" aria-selected="true">今日の！</button>
          </li>
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" role="tab" aria-controls="profile-tab-pane" aria-selected="false">一　覧</button>
          </li>
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" role="tab" aria-controls="contact-tab-pane" aria-selected="false">登　録</button>
          </li>
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link" id="disabled-tab" data-bs-toggle="tab" data-bs-target="#disabled-tab-pane" role="tab" aria-controls="disabled-tab-pane" aria-selected="false">種　類</button>
          </li>
        </ul>
        {{-- パネル部分 --}}
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">今日の問題！</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tag::cuteBtnHtml($item->icon)}}
                </div>
              @endforeach
            </div>
          </div>
          <div class="tab-pane" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">一覧表示</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tag::cuteBtnHtml($item->icon)}}
                </div>
              @endforeach
            </div>
          </div>
          <div class="tab-pane" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">問題の登録</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tag::cuteBtnHtml($item->icon)}}
                </div>
              @endforeach
            </div>
          </div>
          <div class="tab-pane" id="disabled-tab-pane" role="tabpanel" aria-labelledby="disabled-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">問題の種類</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tag::cuteBtnHtml($item->icon)}}
                </div>
              @endforeach
            </div>
          </div>
        </div>

        <div class="row py-2">
          <a href="{{route('tryFill')}}">
            <div class="col-md-6 mx-auto card bg-warning">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日の穴埋め！'}}</div>
            </div>
          </a>
        </div>
        {{--
        <div class="row py-2">
          <a href="{{route('tryPrevTrans')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'前回の穴埋め難問集'}}</div>
            </div>
          </a>
        </div>
        --}}
        <div class="row py-2">
          <a href="{{route('tryTrans')}}">
            <div class="col-md-6 mx-auto card bg-warning">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日の翻訳！'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('tryKanpo')}}">
            <div class="col-md-6 mx-auto card bg-warning">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日の生薬化学単語！'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('tryBiz')}}">
            <div class="col-md-6 mx-auto card bg-warning">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日のBiz単語！'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('tryOther')}}">
            <div class="col-md-6 mx-auto card bg-warning">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日の一般単語！'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('tryEnglish')}}">
            <div class="col-md-6 mx-auto card bg-warning">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日の英単語！'}}</div>
            </div>
          </a>
        </div>
        {{--
        <div class="row py-2">
          <a href="{{route('tryPrevFill')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'前回の翻訳難問集'}}</div>
            </div>
          </a>
        </div>
        --}}
        <div class="row py-2">
          <a href="{{route('fillIndex')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'穴埋問題一覧'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('transIndex', ['t' => LearnQuestion::TRANSLATE])}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'翻訳問題一覧'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('transIndex', ['t' => LearnQuestion::KANPOWORD])}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'生薬化学単語一覧'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('transIndex', ['t' => LearnQuestion::BIZWORD])}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'Biz単語一覧'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('transIndex', ['t' => LearnQuestion::OTHERWORD])}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'一般単語一覧'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('transIndex', ['t' => LearnQuestion::ENGWORD])}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'英単語一覧'}}</div>
            </div>
          </a>
        </div>
        {{--
        <div class="row py-2">
          <a href="{{route('fillHidden')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'穴埋問題倉庫'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('transHidden')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'翻訳問題倉庫'}}</div>
            </div>
          </a>
        </div>
        --}}
      </div>
    </div>
  </main>
</div>
{{Tag::cuteButtonParts()}}
@endsection
@section('js')
@endsection
