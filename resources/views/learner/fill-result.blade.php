@extends('learner.layouts.common')

{{-- title --}}
@section('title', '穴埋め問結果発表')

@section('customjs')
<script src="{{ asset($result ? 'js/confetti.js' : 'js/snow.js') }}" defer></script>
@endsection

@section('customcss')
<link href="{{ asset($result ? 'css/confetti.css' : 'css/snow.css') }}" rel="stylesheet">
@endsection

@section('content')
<div id="particles-js"></div>
<div id="wrapper">
  <main class="py-5">
    <div class="row">
      <div class="col-md-3 mx-auto card @if($result) bg-warning @else bg-success @endif">
        <div class="row py-4">
          <div class="col-md-10 mx-auto card bg-light"  style="color : black;">
            <div id="tts-txt" class="align-items-center text-center" style="font-size: 20px; color: black">{{LearnQuestion::dspAnswer($q)}}</div>
          </div>
        </div>
        <div class="row py-2">
          <div class="col-md-10 mx-auto card @if($result) bg-success @else bg-secondary @endif">
            <div class="align-items-center text-center @if($result) text-light @else text-light @endif" style="font-size: 24px;">{{ $result ? "正解！" : "残念…" }}</div>
          </div>
        </div>
        <div class="form-group row" style="font-size: 20; color: white;">
          <div class="col-md-10 mx-auto">
            <div class="row card bg-info form-check">
              <div class="col-md-12">
                <textarea name="a" rows="3" cols="33" readonly="true">{{$q->q}}</textarea>
              </div>
              <div class="form-group row"><div class="col-md-3 mx-auto button"><button id="play" type="button" class="btn btn-light btn-outline-dark" onclick="speak()">発音</button></div></div>
            </div>
          </div>
        </div>
        <div class="form-group row" style="font-size: 20; color: white;">
          <div class="col-md-10 mx-auto">
            <div class="card-head text-light">ピンイン</div>
            <div class="row card bg-info form-check">
              <div class="col-md-12 mx-auto">
                <textarea name="pinyin" rows="3" cols="33" readonly="true">{{$q->pinyin}}</textarea>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group row" style="font-size: 20; color: white;">
          <div class="col-md-10 mx-auto">
            <div class="card-head text-light">英文</div>
            <div class="row card bg-info form-check">
              <div class="col-md-12">
                <textarea name="en" rows="3" cols="33" readonly="true">{{$q->en}}</textarea>
              </div>
            </div>
          </div>
        </div>
        @csrf
        <div class="form-group row py-4 mx-auto">
          <div class="col-md-12">
            <button type="button" onclick="location.href='{{Params::link2Index($p)}}'" class="btn btn-light btn-outline-dark">一覧へ</button>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
@endsection
@section('js')
<script>

let voices = [];

if (window.speechSynthesis) {
  speechSynthesis.addEventListener("voiceschanged", setVoices);
}

function setVoices() {
  if (voices.length) return;
  voices = speechSynthesis.getVoices();
}

function speak() {
  if (window.speechSynthesis) {

    setVoices();

    // 発言を設定
    const uttr = new SpeechSynthesisUtterance();

    // テキストを設定
    uttr.text = document.getElementById('tts-txt').textContent;

    // 言語を設定
    uttr.lang = 'zh-CN';

    // 英語に対応しているvoiceを設定
    let found = false;
    for (let i = 0; i < voices.length; i++) {
      if (voices[i].lang === 'zh-CN') {
        uttr.voice = voices[i];
        found = true;
        break;
      }
    }

    if (!found) {
      alert("お使いのブラウザは、中国語音声に対応していません。\n他のブラウザをお試しください。");
    } else {
      // 発言を再生
      window.speechSynthesis.speak(uttr);
    }
  }
}
</script>
@endsection
