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
      <div class="col-md-3 mx-auto card bg-success">
        <div class="row py-4">
          <div class="col-md-10 mx-auto card bg-light"  style="color : black;">
            <div class="align-items-center text-center" style="font-size: 20px; color: black">{{$q->q}}</div>
          </div>
        </div>
        <div class="row py-2">
          <div class="col-md-10 mx-auto card bg-dark">
            <div class="align-items-center text-center" style="font-size: 24px; color: white">{{ "翻訳チャレンジ！" }}</div>
          </div>
        </div>
        <form action="{{ action('Learners\PagesController@qCheck') }}" method="post" enctype="multipart/form-data">
          @if (count($errors) > 0)
            <ul>
              @foreach($errors->all() as $e)
                <li>{{ $e }}</li>
              @endforeach
            </ul>
          @endif
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="a" name="a" rows="3" cols="33"></textarea>
                </div>
              </div>
            </div>
          </div>
          @csrf
          <input type="hidden" name="id" value="{{$q->id}}"/>
          <div class="form-group row py-4">
            <div class="col-md-3 mx-auto">
              <button type="submit" class="btn-lg btn-outline-dark">解答</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </main>
</div>
@endsection
