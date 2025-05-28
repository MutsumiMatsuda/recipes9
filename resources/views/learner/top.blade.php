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
          {{-- 今日の問題 --}}
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('try')}}" id="try-tab" data-bs-toggle="tab" data-bs-target="#try-tab-pane" role="tab" aria-controls="try-tab-pane" aria-selected="{{$p->isSelectedArea('try')}}">今日の！</button>
          </li>
          {{-- 一覧 --}}
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('idx')}}" id="idx-tab" data-bs-toggle="tab" data-bs-target="#idx-tab-pane" role="tab" aria-controls="idx-tab-pane" aria-selected="{{$p->isSelectedArea('idx')}}">一覧</button>
          </li>
          {{-- 検索 --}}
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('src')}}" id="src-tab" data-bs-toggle="tab" data-bs-target="#src-tab-pane" role="tab" aria-controls="src-tab-pane" aria-selected="{{$p->isSelectedArea('src')}}">検索</button>
          </li>
          {{-- 問題の追加 --}}
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('add')}}" id="add-tab" data-bs-toggle="tab" data-bs-target="#add-tab-pane" role="tab" aria-controls="add-tab-pane" aria-selected="{{$p->isSelectedArea('add')}}">登録</button>
          </li>
          {{-- 種類管理 --}}
          <li class="nav-item" role="presentation">
            <button type="button" class="nav-link {{$p->isActiveTab('type')}}" id="type-tab" data-bs-toggle="tab" data-bs-target="#type-tab-pane" role="tab" aria-controls="type-tab-pane" aria-selected="{{$p->isSelectedArea('type')}}">種類</button>
          </li>
        </ul>
        {{-- パネル部分 --}}
        <div id="myTabContent" class="tab-content">
          {{-- 今日の問題タブ --}}
          <div class="tab-pane {{$p->isActiveTabPain('try')}}" id="try-tab-pane" role="tabpanel" aria-labelledby="try-tab" tabindex="0">
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
          {{-- 一覧タブ --}}
          <div class="tab-pane {{$p->isActiveTabPain('idx')}}" id="idx-tab-pane" role="tabpanel" aria-labelledby="idx-tab" tabindex="0">
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
          {{-- 検索タブ --}}
          <div class="tab-pane @if($tab == 2) active show @endif" id="src-tab-pane" role="tabpanel" aria-labelledby="src-tab" tabindex="0">
            <div class="col-md-6 mx-auto card bg-light" style="color : black;">
              <div class="align-items-center text-center" style="font-size: 20px; color: black">問題全体から検索</div>
            </div>
            <div class="row mx-auto py-2">
              <div class="col-md-12 mx-auto card">
                {{-- タイトル、検索ボックス --}}
                <div class="row py-2">
                  <div class="col-md-5 card bg-light" style="color: black;">
                    <div class="align-items-center text-center" style="font-size: 18px; color: black">{{LearnQuestion::pageTitle($p->type)}}一覧</div>
                  </div>
                  <div class="col-md-6">
                    <form action="{{ route('learnerTop', ['tb' => Cnst::TAB_SEARCH]) }}" id="searchForm" method="get" enctype="multipart/form-data">
                      <input type="text" size="16" placeholder="問題文や解答で検索" name="qr" value="{{$p->query}}">
                      <input type="submit" id="formSubmit" class="fas" style="font-size: 22px" value="&#xf002;" title="検索">
                      @csrf
                      {{-- 問題種類は設定しない --}}
                      <input type="hidden" name="t" value="0"/>
                      <input type="hidden" name="h" value="{{$p->hidden}}"/>
                      <input type="hidden" name="s" value="{{$p->sort}}"/>
                      <input type="hidden" name="o" value="{{$p->order}}"/>
                      <input type="hidden" name="tb" value="{{Cnst::TAB_SEARCH}}"/>
                      <input type="hidden" name="ti" id="tagId" value="0"/>
                    </form>
                  </div>
                </div>
                {{-- タグ --}}
                <div class="row py-1 mx-0 px-0">
                  <table class="table table-borderless">
                    <tr>
                    @foreach($tags as $item)
                    <td>
                      @if($p->tagId == $item->id)
                      <button type="button" class="btn btn-warning" onclick="searchWithTag(0)" title="{{$item->title}}">{{$item->name}}</button>
                      @else
                      <button type="button" class="btn btn-primary" onclick="searchWithTag({{$item->id}})" title="{{$item->title}}">{{$item->name}}</button>
                      @endif
                    </td>
                    @endforeach
                    </tr>
                  </table>
                </div>
                {{-- ソート、オーダーボタン --}}
                <div class="row py-1 mx-auto">
                  <div class="col-md-3 card {{Params::sortBtnClassId($p)}}">
                    <a href="{{Params::sortBtnLink($p, Params::SORT_ID)}}">
                      <div class="align-items-center text-center" style="font-size: 14px;">{{Params::orderLavelId($p)}}</div>
                    </a>
                  </div>
                  <div class="col-md-3 card {{Params::sortBtnClassRatio($p)}}">
                    <a href="{{Params::sortBtnLink($p, Params::SORT_RATIO)}}">
                      <div class="align-items-center text-center" style="font-size: 14px;">{{Params::orderLavelRatio($p)}}</div>
                    </a>
                  </div>
                  <div class="col-md-3 card {{Params::sortBtnClassQuestion($p)}}">
                    <a href="{{Params::sortBtnLink($p, Params::SORT_Q)}}">
                      <div class="align-items-center text-center" style="font-size: 14px;">{{Params::orderLavelQuestion($p)}}</div>
                    </a>
                  </div>
                  <div class="col-md-3 card {{Params::sortBtnClassAnswer($p)}}">
                    <a href="{{Params::sortBtnLink($p, Params::SORT_A)}}">
                      <div class="align-items-center text-center" style="font-size: 14px;">{{Params::orderLavelAnswer($p)}}</div>
                    </a>
                  </div>
                </div>
                @php $i = 1; @endphp
                @foreach($questions as $item)
                <div class="form-group row" style="font-size: 20; color: white;">
                  <div class="col-md-11 mx-auto">
                    <div class="row">
                      @if($item->hasTag(6))
                      <div class="col-md-10 card bg-danger-subtle" style="color: black">
                      @elseif($i % 2)
                      <div class="col-md-10 card bg-primary" style="color: white">
                      @else
                      <div class="col-md-10 card bg-info" style="color: white">
                      @endif
                        <div class="card-body ps-0">
                          <a href="{{$p->link2Detail($item->id)}}">
                            @if($item->hasTag(6))
                            <label class="form-check-label form-control-lg" style="color: black">
                            @else
                            <label class="form-check-label form-control-lg" style="color: white">
                            @endif
                              {{LearnQuestion::dspFillIndexQ($item)}}
                            </label>
                          </a>
                        </div>
                      </div>
                      <div class="col-md-1 card border border-0">
                        <div class="card-head ms-auto">
                          率
                        </div>
                        <div class="card-body ms-0 ps-0 fs-4">
                          @if($item->type == LearnQuestion::FILLBLANK)
                          <a href='{{route('fillEdit', Params::paramsWithId($item->id, $p))}}' title="編集する">
                          @else
                          <a href='{{route('transEdit', Params::paramsWithId($item->id, $p))}}' title="編集する">
                          @endif
                            <i class="far fa-edit"></i>
                          </a>
                        </div>
                      </div>
                      <div class="col-md-1 card border border-0">
                        <div class="card-head ms-auto">
                          {{LearnQuestion::dspRatio($item) . "%"}}
                        </div>
                        <div class="card-body px-0 fs-4">
                          @if($item->type == LearnQuestion::FILLBLANK)
                            @if(!$p->hidden)
                            <a href='{{route('hideFill', Params::paramsWithId($item->id, $p))}}' title="削除する" onclick="return confirmDelete('{{LearnQuestion::shorten($item)}}');">
                              <i class="fas fa-trash"></i>
                            </a>
                            @else
                            <a href='{{route('showHiddenFill', Params::paramsWithId($item->id, $p))}}' title="倉庫から出す">
                              <i class="fas fa-file-export"></i>
                            </a>
                            @endif
                          @else
                            @if(!$p->hidden)
                            <a href='{{route('hideTrans', Params::paramsWithId($item->id, $p))}}' title="削除する" onclick="return confirmDelete('{{LearnQuestion::shorten($item)}}');">
                              <i class="fas fa-trash"></i>
                            </a>
                            @else
                            <a href='{{route('showHiddenTrans', Params::paramsWithId($item->id, $p))}}' title="倉庫から出す">
                              <i class="fas fa-file-export"></i>
                            </a>
                          @endif
                        @endif
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                @php $i++; @endphp
                @endforeach
              </div>
              {{-- ページネーション --}}
              <div class="row py-2 mx-auto">
                <div class="col-md-12 mx-auto">
                  {{$questions->links('vendor.pagination.bootstrap-5', ['p' => $p])}}
                </div>
              </div>
            </div>
          </div>
          {{-- 問題の追加タブ --}}
          <div class="tab-pane {{$p->isActiveTabPain('add')}}" id="add-tab-pane" role="tabpanel" aria-labelledby="add-tab" tabindex="0">
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
          {{-- 種類管理タブ --}}
          <div class="tab-pane {{$p->isActiveTabPain('type')}}" id="type-tab-pane" role="tabpanel" aria-labelledby="type-tab" tabindex="0">
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

  // 検索フォーム送信
  function searchWithTag(id) {
    item = document.getElementById('tagId');
    item.value = id;
    document.getElementById('searchForm').submit();
  }

  // 削除確認
  function confirmDelete(m) {
    return confirm("「" + m + "」を削除してよろしいですか？")
  }
</script>
@endsection
