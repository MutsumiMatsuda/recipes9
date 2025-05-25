@extends('learner.layouts.common')

{{-- title --}}
@section('title', '中国語の学習')

@section('customjs')
<script src="{{asset('js/'. $style . '.js')}}" defer></script>
@endsection

@section('customcss')
<link href="{{asset('css/' . $style . '.css')}}" rel="stylesheet">
{{Tg::cuteBtnCss()}}
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
            <button type="button" class="nav-link {{$p->isActiveTab('try')}}" id="try-tab" data-bs-toggle="tab" data-bs-target="#try-tab-pane" role="tab" aria-controls="try-tab-pane" aria-selected="{{$p->isSelectedArea('try')}}">今日の！</button>
          </li>
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('idx')}}" id="idx-tab" data-bs-toggle="tab" data-bs-target="#idx-tab-pane" role="tab" aria-controls="idx-tab-pane" aria-selected="{{$p->isSelectedArea('idx')}}">一　覧</button>
          </li>
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('add')}}" id="add-tab" data-bs-toggle="tab" data-bs-target="#add-tab-pane" role="tab" aria-controls="add-tab-pane" aria-selected="{{$p->isSelectedArea('add')}}">登　録</button>
          </li>
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('type')}}" id="type-tab" data-bs-toggle="tab" data-bs-target="#type-tab-pane" role="tab" aria-controls="type-tab-pane" aria-selected="{{$p->isSelectedArea('type')}}">種　類</button>
          </li>
        </ul>
        {{-- パネル部分 --}}
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane {{$p->isActiveTab('try')}}" id="try-tab-pane" role="tabpanel" aria-labelledby="try-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">今日の問題！</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tg::cuteBtnHtml($p, $item, Cnst::TAB_TRYOUT)}}
                </div>
              @endforeach
            </div>
            {{-- タグ --}}
            <div class="row mx-auto py-2">
              @foreach($tags as $item)
                <div class="col-2 py-2">
                  <a href="{{Params::Dolink2TagTryout($p, $item->id)}}">
                    <button type="button" class="btn btn-primary" title="{{$item->title}}">{{$item->name}}</button>
                  </a>
                </div>
              @endforeach
            </div>
          </div>
          <div class="tab-pane {{$p->isActiveTab('idx')}}" id="idx-tab-pane" role="tabpanel" aria-labelledby="idx-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">一覧表示</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tg::cuteBtnHtml($p, $item, Cnst::TAB_INDEX)}}
                </div>
              @endforeach
            </div>
            {{-- タグ --}}
            <div class="row mx-auto py-2">
              @foreach($tags as $item)
                <div class="col-2 py-2">
                  <a href="{{Params::Dolink2Index($p, $item->id)}}">
                    <button type="button" class="btn btn-primary" title="{{$item->title}}">{{$item->name}}</button>
                  </a>
                </div>
              @endforeach
            </div>
          </div>
          <div class="tab-pane {{$p->isActiveTab('add')}}" id="add-tab-pane" role="tabpanel" aria-labelledby="add-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">問題の登録</div>
            </div>
            <div class="row mx-auto py-2">
              @foreach($list as $item)
                <div class="col-4 py-2">
                {{Tg::cuteBtnHtml($p, $item, Cnst::TAB_ADD)}}
                </div>
              @endforeach
            </div>
          </div>
          <div class="tab-pane {{$p->isActiveTab('type')}}" id="type-tab-pane" role="tabpanel" aria-labelledby="type-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">問題の種類</div>
            </div>
            @foreach($list as $item)
            <div class="row mx-auto py-2">
              <a href="{{route('typeDetail', ['t' => $item->type])}}">
                <div class="col-md-6 mx-auto card bg-dark">
                  <div class="align-items-center text-center" style="font-size: 20px; color: white">{{$item->name}}問題</div>
                </div>
              </a>
            </div>
            @endforeach
            <div class="row mx-auto py-3">
              <div class="row py-2">
                <a href="{{route('typeAdd', ['tb' => Cnst::TAB_TYPE])}}">
                  <div class="col-md-6 mx-auto card bg-warning">
                    <div class="align-items-center text-center" style="font-size: 20px; color: black">{{'種類を追加'}}</div>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>

        {{--
        <div class="row py-2">
          <a href="{{route('tryPrevTrans')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'前回の穴埋め難問集'}}</div>
            </div>
          </a>
        </div>
        <div class="row py-2">
          <a href="{{route('tryPrevFill')}}">
            <div class="col-md-6 mx-auto card bg-dark">
              <div class="align-items-center text-center" style="font-size: 20px; color: white">{{'前回の翻訳難問集'}}</div>
            </div>
          </a>
        </div>
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
@section('js')
<script>
  {{Tg::echoTabAry()}}
  console.log(tabAry);
  function movePageWithTab(url) {
    const navs = document.querySelectorAll(".nav-link");
    let tb = 0;
    let target = '';
    for(let i = 0; i < navs.length; i++) {
      const el = navs[i];
      const a = el.getAttribute("aria-selected");
      if (null != a) {
        const c = el.getAttribute("class");
        console.log(el, c);
        if (0 <= c.indexOf('active')) {
         break;
        }
        tb++;
      }
    }
    target = url + "&tb=" + tb;
    console.log(target);
  }
</script>
@endsection
