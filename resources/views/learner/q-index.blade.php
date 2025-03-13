{{-- 問題一覧ページ(各種問題統合) --}}
@extends('learner.layouts.common')

{{-- title --}}
@section('title', $p->title)

@section('customjs')
<script src="{{ asset('js/sakura.js') }}" defer></script>
@endsection

@section('customcss')
<link href="{{ asset('css/sakura.css') }}" rel="stylesheet">
@endsection

@section('content')
<div id="particles-js"></div>
<div id="wrapper">
  <main class="py-1">
    <div class="row">
      <div class="col-md-3 mx-auto card">
        {{-- タイトル、検索ボックス --}}
        <div class="row py-2">
          <div class="col-md-6 card bg-light" style="color: black;">
            <div class="align-items-center text-center" style="font-size: 18px; color: black">{{$p->title}}</div>
          </div>
          <div class="col-md-6">
            <form action="{{ $p->action }}" id="searchForm" method="get" enctype="multipart/form-data">
              <input type="text" size="18" placeholder="問題文や解答で検索" name="qr">
              <input type="submit" id="formSubmit" class="fas" style="font-size: 22px" value="&#xf002;" title="検索">
              @csrf
              <input type="hidden" name="t" value="{{$p->type}}"/>
              <input type="hidden" name="h" value="{{$p->hidden}}"/>
              <input type="hidden" name="s" value="{{$p->sort}}"/>
              <input type="hidden" name="o" value="{{$p->order}}"/>
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
              <button type="button" class="btn btn-warning" onclick="searchWithTag(0)" >{{$item->name}}</button>
              @else
              <button type="button" class="btn btn-primary" onclick="searchWithTag({{$item->id}})" >{{$item->name}}</button>
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
        @foreach($list as $item)
        <div class="form-group row" style="font-size: 20; color: white;">
          <div class="col-md-11 mx-auto">
            <div class="row">
              <div class="col-md-10 card @if($i % 2) bg-primary @else bg-info @endif" style="color: white">
                <div class="card-body ps-0">
                  <a href="{{Params::link2Detail($item->id, $p)}}">
                    <label class="form-check-label form-control-lg" style="color: white">
                      {{LearnQuestion::dspFillIndexQ($item)}}
                    </label>
                  </a>
                </div>
              </div>
              <div class="col-md-1 card border border-0">
                <div class="card-head ms-auto">
                  率
                </div>
                <div class="card-body px-0 fs-3">
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
                <div class="card-body px-0 fs-3">
                  @if($item->type == LearnQuestion::FILLBLANK && !$p->hidden)
                  <a href='{{route('hideFill', Params::paramsWithId($item->id, $p))}}' title="倉庫に入れる">
                    <i class="fas fa-file-import"></i>
                  </a>
                  @elseif($item->type == LearnQuestion::FILLBLANK && $p->hidden)
                  <a href='{{route('showHiddenFill', Params::paramsWithId($item->id, $p))}}' title="倉庫から出す">
                    <i class="fas fa-file-export"></i>
                  </a>
                  @elseif($item->type == LearnQuestion::TRANSLATE && !$p->hidden)
                  <a href='{{route('hideTrans', Params::paramsWithId($item->id, $p))}}' title="倉庫に入れる">
                    <i class="fas fa-file-import"></i>
                  </a>
                  @else
                  <a href='{{route('showHiddenTrans', Params::paramsWithId($item->id, $p))}}' title="倉庫から出す">
                    <i class="fas fa-file-export"></i>
                  </a>
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
        <div class="col-md-3 mx-auto">
          {{$list->links('vendor.pagination.bootstrap-5', ['p' => $p])}}
        </div>
      </div>
    </div>
  </main>
</div>
@endsection
@section('js')
<script>
function searchWithTag(id) {
  item = document.getElementById('tagId');
  item.value = id;
  document.getElementById('searchForm').submit();
}
</script>
@endsection