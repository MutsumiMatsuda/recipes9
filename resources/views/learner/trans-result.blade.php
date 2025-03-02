@extends('learner.layouts.common')

{{-- title --}}
@section('title', '中国語翻訳問題集(さくら)')

@section('customjs')
<script src="{{ asset('js/sakura.js') }}" defer></script>
@endsection

@section('customcss')
<link href="{{ asset('css/sakura.css') }}" rel="stylesheet">
@endsection

@section('content')
<div id="particles-js"></div>
<div id="wrapper">
  <main class="py-5">
    <div class="row">
      <div class="col-md-3 mx-auto card @if($result) bg-warning @else bg-success @endif">
        <div class="row py-4">
          <div class="col-md-10 mx-auto card bg-light"  style="color : black;">
            <div class="align-items-center text-center" style="font-size: 20px; color: black">{{$q->q}}</div>
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
                  <textarea id="tts-txt" name="a" rows="3" cols="33" readonly="true">{{$q->a}}</textarea>
                </div>
                <div class="form-group row"><div class="col-md-3 mx-auto button"><button id="play" type="button" onclick="speak()">発音</button></div></div>
              </div>
              
            </div>
          </div>
          @csrf
          <div class="form-group row py-4">
            <div class="col-md-5 mx-auto button">
              <button onclick="location.href='/learner'" class="btn-lg btn-outline-dark">一覧へ戻る</button>
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
    uttr.text = document.getElementById('tts-txt').value;

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
