{{-- 問題一覧ページ(各種問題統合) --}}
@extends('learner.layouts.common')

{{-- title --}}
@section('title', LearnQuestion::pageTitle($p->type) . '問題種類一覧')

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
        {{-- タイトル --}}
        <div class="row py-2">
          <div class="col-md-5 card bg-light" style="color: black;">
            <div class="align-items-center text-center" style="font-size: 18px; color: black">問題種類一覧</div>
          </div>
        </div>
        @php $i = 1; @endphp
        @foreach($list as $item)
        <div class="form-group row" style="font-size: 20; color: white;">
          <div class="col-md-11 mx-auto">
            <div class="row">
              @if($i % 2)
              <div class="col-md-10 card bg-primary" style="color: white">
              @else
              <div class="col-md-10 card bg-info" style="color: white">
              @endif
                <div class="card-body ps-0">
                  <a href="/typeEdit?id={{$item->id}}">
                    <label class="form-check-label form-control-lg" style="color: white">
                      {{$item->name}}
                    </label>
                  </a>
                </div>
              </div>
              <div class="col-md-1 card border border-0">
                <div class="card-head ms-auto">
                  率
                </div>
                <div class="card-body ms-0 ps-0 fs-4">
                  <a href='{{route('typeEdit', Params::paramsWithId($item->id, $p))}}' title="編集する">
                    <i class="far fa-edit"></i>
                  </a>
                </div>
              </div>
              <div class="col-md-1 card border border-0">
                <div class="card-head ms-auto">
                </div>
                <div class="card-body px-0 fs-4">
                  {{--
                    @if(!$p->hidden)
                    <a href='{{route('hideFill', Params::paramsWithId($item->id, $p))}}' title="削除する" onclick="return confirmDelete('{{LearnQuestion::shorten($item)}}');">
                      <i class="fas fa-trash"></i>
                    </a>
                    @else
                    <a href='{{route('showHiddenFill', Params::paramsWithId($item->id, $p))}}' title="倉庫から出す">
                      <i class="fas fa-file-export"></i>
                    </a>
                    @endif
                  --}}
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
@section('js')
<script>
// 削除確認
function confirmDelete(m) {
  return confirm("「" + m + "」を削除してよろしいですか？")
}
</script>
@endsection
