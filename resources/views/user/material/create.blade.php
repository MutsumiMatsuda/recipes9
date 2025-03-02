{{-- layouts/common.blade.phpを読み込む --}}
@extends('layouts.common')

{{-- admin.blade.phpの@yield('title')に埋め込む文字列を指定 --}}
@section('title', '材料の新規登録')

{{-- admin.blade.phpの@yield('content')に以下のタグを埋め込む --}}
@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>材料の新規登録</h2>
        <form action="{{ action('User\MaterialController@create') }}" method="post" enctype="multipart/form-data">

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
              <input type="text" name="name" value="{{ old('name') }}" placeholder="材料名を入力">
            </div>
            <div class="col-md-4 py-2">
              <h3>別名</h3>
              <input type="text" name="name2" value="{{ old('name2') }}" placeholder="材料の別名を入力">
            </div>
            <div class="col-md-4 py-2">
              <h3>別名２</h3>
              <input type="text" name="name3" value="{{ old('name3') }}" placeholder="材料の別名２を入力">
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>カテゴリ</h3>
              <select name ="material_category_id" id="select4">
                @foreach( $categories as $item)
                  <option value="{{ $item->id }}" @if(old('material_category_id') == $item->id) selected="selected" @endif>{{ $item->name }}</option>
                @endforeach
              </select>
            </div>
            <div class="col-md-2 pr-1 py-2">
              <h3>旬</h3>
              <select name ="season_id" id="select4">
                <option value="0" @if(old('season_id') == 0) selected="selected" @endif>指定無し</option>
                @foreach( $seasons as $item)
                  <option value="{{ $item->id }}" @if(old('season_id') == $item->id) selected="selected" @endif>{{ $item->name }}</option>
                @endforeach
              </select>
            </div>
          </div>

          <h3>栄養素</h3>
          @for($i = 0; $i < 10; $i++)
            @php
              $selId1 = sprintf("select1%d", $i + 1);
              $nutSelName = 'nutrient_material_id[' . $i . ']';
              $oldNutSelName = 'nutrient_material_id.' . $i;
            @endphp
            <div class="row py-2">
              <div class="col-md-3 py-2">
                <select name ="{{ $nutSelName }}" id="{{ $selId1 }}")>
                  <option value="0" @if(old($oldNutSelName) == 0) selected="selected" @endif>選んで下さい</option>
                  @foreach($nutrients as $nutrient)
                    <option value="{{ $nutrient->id }}" @if(old($oldNutSelName) == $nutrient->id) selected="selected" @endif>{{ $nutrient->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
          @endfor

          {{ csrf_field() }}
          <input type="submit" name="submit" value ="送信">
        </form>
      </div>
    </div>
  </div>
@endsection

@section('js')
@endsection
