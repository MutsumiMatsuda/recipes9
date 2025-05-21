@extends('learner.layouts.common')

{{-- title --}}
@section('title', 種類編集')

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
      <div class="col-md-3 mx-auto card bg-secondary">
        <div class="row py-4">
          <div class="col-md-10 mx-auto card bg-dark">
            <div class="align-items-center text-center" style="font-size: 20px; color: white">問題種類編集</div>
          </div>
        </div>
        <form action="{{ action('Learners\TypeController@create') }}" method="post" enctype="multipart/form-data">
          @if (count($errors) > 0)
            <ul>
              @foreach($errors->all() as $e)
                <li>{{ $e }}</li>
              @endforeach
            </ul>
          @endif
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              種類名
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <input type="text" id="name" name="name" value="{{old("name", $t->name)}}" required>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              表示アイコン
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <input type="text" id="icon" name="icon" value="{{old("icon", $t->icon)}}" required>
                </div>
              </div>
            </div>
          </div>
          @csrf
          <input type="hidden" name="type" id="type" value="{{$p->type}}"/>
          <div class="form-group row py-4">
            <div class="col-md-3 mx-auto">
              <button type="submit" class="btn-lg btn-outline-dark">登録</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </main>
</div>
@endsection
@section('js')
@endsection
