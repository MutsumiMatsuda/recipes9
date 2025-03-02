{{-- layouts/front.blade.phpを読み込む --}}
@extends('layouts.front')

{{-- common.blade.phpの@yield('title')に埋め込む --}}
@section('title', '栄養素詳細')

{{-- common.blade.phpの@yield('content')に以下のタグを埋め込む --}}
@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>栄養素詳細</h2>

          <div class="form-group row">
              <label class="col-md-2">栄養素名</label>
              <div class="col-md-10">
                <div class="card card-body border-primary">
                  {{ $nutrient->name }}
                </div>
              </div>
          </div>

          <div class="form-group row">
              <label class="col-md-2">メモ</label>
              <div class="col-md-10">
                  <div class="card card-body border-primary">
                    {!! Utl::nl2br($nutrient->memo) !!}
                  </div>
              </div>
          </div>

          <h3>この栄養素を含む材料</h3>
          <div class="row py-2">
            @foreach($nutrient->materials as $item)
              <div class="col-md-4 pr-1 py-2">
                <a class="btn btn-lg btn-outline-dark" href="/material/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
              </div>
            @endforeach
          </div>

          <hr/>
          <h3>この栄養素を摂れるレシピ</h3>
          <div class="row py-2">
            @foreach($nutrient->recipes() as $item)
              <div class="col-md-4 pr-1 py-2">
                <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item['id'] }}" role="button">{{ $item['name'] }}</a>
              </div>
            @endforeach
          </div>
        </div>

      </div>
    </div>
  </div>
@endsection

@section('js')
<script type = "text/javascript">
  let jsMatAry = {!! $jsAry !!};
  console.log(jsMatAry);
  function swapSelectOptions(id1, id2)
  {
    var select1 = document.getElementById(id1);//変数select1を宣言
    var select2 = document.getElementById(id2); //変数select2を宣言

    select2.options.length = 0; // 選択肢の数がそれぞれに異なる場合、これが重要
    var arr = [];
    var tmp = [];
    for (var i = 0; i < jsMatAry.length; i++) {
      tmp  = jsMatAry[i];
      if (tmp.id == select1.options[select1.selectedIndex].value) {
        arr = tmp.arr;
        break;
      }
    }
    select2.options[0] = new Option("選んで下さい", '0');
    for( let i = 1; i <=　arr.length; i++ ) {
      select2.options[i] = new Option(arr[i].txt, arr[i].val);
    }
  }
</script>
@endsection
