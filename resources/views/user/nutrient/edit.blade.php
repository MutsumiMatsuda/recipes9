{{-- layouts/common.blade.phpを読み込む --}}
@extends('layouts.common')

{{-- common.blade.phpの@yield('title')に埋め込む --}}
@section('title', '栄養素の編集')

{{-- common.blade.phpの@yield('content')に以下のタグを埋め込む --}}
@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>栄養素の編集</h2>
        <form action="{{ action('User\NutrientController@update') }}" method="post" enctype="multipart/form-data">

          @if (count($errors) > 0)
          　<ul>
          　　@foreach($errors->all() as $e)
                <li>{{ $e }}</li>
              @endforeach
            </ul>
          @endif

          <div class="form-group row">
              <label class="col-md-2">栄養素名</label>
              <div class="col-md-10">
                  <input type="text" class="form-control" name="name" value="{{ old('name', $nutrient->name) }}" placeholder="栄養素名を入力">
              </div>
          </div>

          <div class="form-group row">
              <label class="col-md-2">メモ</label>
              <div class="col-md-10">
                  <textarea class="form-control" name="memo" rows="5">{{ old('memo', $nutrient->memo) }}</textarea>
              </div>
          </div>

          <h3>この栄養素を含む材料</h3>
          <div class="row py-2">
            @foreach($nutrient->materials as $item)
              <div class="col-md-4 pr-1 py-2">
                <a class="btn btn-lg btn-warning" href="/user/material/edit?id={{ $item->id }}" role="button">{{ $item->name }}</a>
              </div>
            @endforeach
          </div>

          <h3>栄養素を含む材料を追加</h3>
          <h4>材料の栄養素は、材料の編集からも設定できます</h4>

          @php $curMatCat = $materialCategories->first(); @endphp
          <div class="row py-2">
            <div class="col-md-3 py-2">
              <select name ="material_category_id" id="select1" onChange="swapSelectOptions('select1', 'select2')">
                @foreach($materialCategories as $category)
                  <option value="{{ $category->id }}" @if(old('material_category_id') == $category->id) selected="selected" @php $curMatCat = $category; @endphp @endif>{{ $category->name }}</option>
                @endforeach
              </select>
            </div>
            <div class="col-md-5 py-2">
              <select name ="material_id" id="select2">
                <option value="0" @if(old('material_id') == 0) selected="selected" @endif>選んで下さい</option>
                @foreach($curMatCat->materials as $material)
                  <option value="{{ $material->id }}" @if(old('material_id') == $material->id) selected="selected" @endif>{{ $material->name }}</option>
                @endforeach
              </select>
            </div>
          </div>

          {{ csrf_field() }}
          <input type="hidden" name="id" value="{{ $nutrient->id }}">
          <input type="submit" name="submit" value ="送信">
        </form>
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
