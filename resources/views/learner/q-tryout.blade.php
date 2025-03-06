{{-- 問題集ページ --}}
@extends('learner.layouts.common')

{{-- title --}}
@section('title', $tryout->name)

@section('customjs')
<script src="{{ asset('js/momiji.js') }}" defer></script>
@endsection

@section('customcss')
<link href="{{ asset('css/momiji.css') }}" rel="stylesheet">
@endsection

@section('content')
<div id="particles-js"></div>
<div id="wrapper">
  <main class="py-1">
    <div class="row">
      <div class="col-md-3 mx-auto card">
        {{-- タイトル --}}
        <div class="row py-2">
          <div class="col-md-6 mx-auto card bg-light" style="color: black;">
            <div class="align-items-center text-center" style="font-size: 18px; color: black">{{$tryout->name}}</div>
          </div>
        </div>
        @php $i = 1; @endphp
        @foreach($tryout->questions as $item)
        <div class="form-group row" style="font-size: 20; color: white;">
          <div class="col-md-11 mx-auto">
            <div class="row">
              <div class="col-md-10 mx-auto card my-2 @if($i % 2) bg-primary @else bg-info @endif" style="color: white">
                <div class="card-body ps-0">
                  @if($item->type == LearnQuestion::FILLBLANK)
                  <a href="{{'/learner/fill/detail?id=' . $item->id . '&to=' . $p->tryId}}">
                  @else
                  <a href="{{'/learner/detail?id=' . $item->id . '&to=' . $p->tryId}}">
                  @endif
                    <label class="form-check-label form-control-lg" style="color: white">
                      {{LearnQuestion::dspFillIndexQ($item)}}
                    </label>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
        @php $i++; @endphp
        @endforeach
      </div>
    </div>
  </main>
</div>
@endsection