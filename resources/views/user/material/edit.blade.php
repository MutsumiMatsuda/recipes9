{{-- layouts/common.blade.phpを読み込む --}}
@extends('layouts.common')

{{-- admin.blade.phpの@yield('title')に埋め込む文字列を指定 --}}
@section('title', '材料の編集')

{{-- admin.blade.phpの@yield('content')に以下のタグを埋め込む --}}
@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>材料の編集</h2>
        <form action="{{ action('User\MaterialController@update') }}" method="post" enctype="multipart/form-data">

          @if (count($errors) > 0)
          　<ul>
          　　@foreach($errors->all() as $e)
                <li>{{ $e }}</li>
              @endforeach
            </ul>
          @endif

          <div class="row py-2">
            <div class="col-md-4 py-2">
              <h3>材料名</h3>
              <input type="text" name="name" value="{{ old('name', $material->name) }}" placeholder="材料名を入力">
            </div>
            <div class="col-md-4 py-2">
              <h3>別名</h3>
              <input type="text" name="name2" value="{{ old('name2', $material->name2) }}" placeholder="材料の別名を入力">
            </div>
            <div class="col-md-4 py-2">
              <h3>別名２</h3>
              <input type="text" name="name3" value="{{ old('name3', $material->name3) }}" placeholder="材料の別名２を入力">
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>カテゴリ</h3>
              <select name ="material_category_id" id="select4">
                @foreach( $categories as $category)
                  <option value="{{ $category->id }}" @if(old('material_category_id', $material->material_category_id) == $category->id) selected="selected" @endif>{{ $category->name }}</option>
                @endforeach
              </select>
            </div>
            <div class="col-md-2 pr-1 py-2">
              <h3>旬</h3>
              <select name ="season_id" id="select4">
                <option value="0" @if(old('season_id', $material->season_id) == 0) selected="selected" @endif>選択無し</option>
                @foreach( $seasons as $item)
                  <option value="{{ $item->id }}" @if(old('season_id', $material->season_id) == $item->id) selected="selected" @endif>{{ $item->name }}</option>
                @endforeach
              </select>
            </div>
          </div>

          <h3>栄養素</h3>
          @php
            $matnuts = $material->nutrients->toArray();
          @endphp
          @for($i = 0; $i < 10; $i++)
            @php
              $matnut = $i < count($matnuts) ? $matnuts[$i] : null;
              $curSelNut = $matnut ? $matnut['id'] : 0;
              $selId1 = sprintf("select1%d", $i + 1);
              $nutSelName = 'nutrient_material_id[' . $i . ']';
              $oldNutSelName = 'nutrient_material_id.' . $i;
            @endphp
            <div class="row py-2">
              <div class="col-md-3 py-2">
                <select name ="{{ $nutSelName }}" id="{{ $selId1 }}")>
                  <option value="0" @if(old($oldNutSelName) == 0) selected="selected" @endif>選んで下さい</option>
                  @foreach($nutrients as $nutrient)
                    <option value="{{ $nutrient->id }}" @if(old($oldNutSelName, $curSelNut) == $nutrient->id) selected="selected" @endif>{{ $nutrient->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
          @endfor

          {{ csrf_field() }}
          <input type="hidden" name="id" value="{{ $material->id }}">
          <input type="submit" name="submit" value ="送信">
        </form>
      </div>
    </div>

    <hr/>
    <h3>この材料が使われているレシピ</h3>
    <div class="row py-2">
      @foreach($material->recipes as $item)
        <div class="col-md-4 pr-1 py-2">
          <a class="btn btn-lg btn-warning" href="/user/recipe/edit?id={{ $item->id }}" role="button">{{ $item->name }}</a>
        </div>
      @endforeach
    </div>
  </div>
@endsection

@section('js')
@endsection
