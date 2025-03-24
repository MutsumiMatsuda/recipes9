@extends('learner.layouts.common')

{{-- title --}}
@section('title', '中国語の学習')

@section('customjs')
<script src="{{asset('js/'. $style . '.js')}}" defer></script>
@endsection

@section('customcss')
<link href="{{asset('css/' . $style . '.css')}}" rel="stylesheet">
@endsection

@section('content')
<div id="particles-js"></div>
<div id="wrapper">
  <main class="py-3">
    <div class="row">
      <div class="col-md-3 mx-auto card">
        <div class="row py-1">
          <div class="col-md-6 mx-auto card bg-light"  style="color : black;">
            <div class="align-items-center text-center" style="font-size: 20px; color: black">中国語の学習</div>
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
              <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'今日の生薬単語！'}}</div>
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
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'生薬単語一覧'}}</div>
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
@endsection
