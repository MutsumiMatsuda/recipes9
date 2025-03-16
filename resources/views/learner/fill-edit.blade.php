@extends('learner.layouts.common')

{{-- title --}}
@section('title', '穴埋め問題編集')

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
            <div class="align-items-center text-center" style="font-size: 20px; color: white">穴埋め問題編集</div>
          </div>
        </div>
        <form action="{{ action('Learners\PagesController@updateFill') }}" method="post" enctype="multipart/form-data">
          @if (count($errors) > 0)
            <ul>
              @foreach($errors->all() as $e)
                <li class="text-warning">{{ $e }}</li>
              @endforeach
            </ul>
          @endif
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              日本語　<button type="button" class="btn btn-primary" onclick="getChinese()">翻訳</button>
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
              問題文前
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="q_head" name="q_head" rows="2" cols="33">{{old("q_head", LearnQuestion::getFillQHead($q))}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              問題文後
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="q_tail" name="q_tail" rows="2" cols="33">{{old("q_tail", LearnQuestion::getFillQTail($q))}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              答え
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
              ヒント
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="hint2" name="hint2" rows="3" cols="33">{{old("hint2", $q->hint2)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              ピンイン　<button type="button" class="btn btn-primary" onclick="getPinyin()">変換</button>
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="pinyin" name="pinyin" rows="3" cols="33">{{old("pinyin", $q->pinyin)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group row" style="font-size: 20; color: white;">
            <div class="col-md-10 mx-auto">
              英文
            </div>
            <div class="col-md-10 mx-auto">
              <div class="row card bg-info form-check">
                <div class="col-md-12">
                  <textarea id="en" name="en" rows="3" cols="33">{{old("en", $q->en)}}</textarea>
                </div>
              </div>
            </div>
          </div>
          {{-- タグ --}}
          <div class="row py-2">
            @foreach($tags as $item)
              <div class="col-md-3">
                <div class="chkbox">
                  <input type="checkbox" id="tags[{{$item->id}}]"
                  name="tags[{{$item->id}}]" @if((old('tags' . $item->id) == $item->id) || $q->hasTag($item->id)) checked @endif>
                  <label for="tags[{{$item->id}}]" class="text-light">{{$item->name}}</label>
                </div>
              </div>
            @endforeach
          </div>
          @csrf
          <input type="hidden" name="id" value="{{$q->id}}"/>
          <input type="hidden" id="type" name="type" value="{{$p->type}}"/>
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
@section('js')
<script src="{{ asset('js/translate.js') }}"></script>
@endsection