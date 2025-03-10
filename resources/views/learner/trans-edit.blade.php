@extends('learner.layouts.common')

{{-- title --}}
@section('title', '翻訳問題編集')

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
            <div class="align-items-center text-center" style="font-size: 20px; color: white">翻訳問題編集</div>
          </div>
        </div>
        <form action="{{ action('Learners\PagesController@update') }}" method="post" enctype="multipart/form-data">
          @if (count($errors) > 0)
            <ul>
              @foreach($errors->all() as $e)
                <li>{{ $e }}</li>
              @endforeach
            </ul>
          @endif
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              日本語
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="q" name="q" rows="3" cols="33">{{old("q", $q->q)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              中国語
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="a" name="a" rows="3" cols="33">{{old("a", $q->a)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              ヒント1
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="hint1" name="hint1" rows="3" cols="33">{{old("hint1", $q->hint1)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              ヒント2
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="hint2" name="hint2" rows="3" cols="33">{{old("hint2", $q->hint2)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          @csrf
          <input type="hidden" name="id" value="{{$q->id}}"/>
          <input type="hidden" name="t" value="{{$p->type}}"/>
          <input type="hidden" name="h" value="{{$p->hidden}}"/>
          <input type="hidden" name="qr" value="{{$p->query}}"/>
          <input type="hidden" name="s" value="{{$p->sort}}"/>
          <input type="hidden" name="o" value="{{$p->order}}"/>
          <input type="hidden" name="page" value="{{$p->page}}"/>
          <div class="form-group row py-4">
            <div class="col-md-3 mx-auto">
              <button type="submit" class="btn btn-warning btn-outline-dark">更新</button>
            </div>
          </div>
        </div>
      </form>
    </div>
  </main>
</div>
@endsection
