@extends('layouts.common')
@section('title', 'レシピの編集')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <div class="row">
          <div class="col-md-4">
            <h2>レシピの編集</h2>
          </div>
          <div class="col-md-4">
            <a class="btn btn-lg btn-warning" href="/recipe/show?id={{ $recipe->id }}" role="button">このレシピの詳細画面へ</a>
          </div>
          <div class="col-md-4">
            <a class="btn btn-lg btn-warning" href="/user/recipe" role="button">一覧へ戻る</a>
          </div>
        </div>

        <form action="{{ action('User\RecipeController@edit') }}" method="post" enctype="multipart/form-data">

          @if (count($errors) > 0)
          　<ul>
          　　@foreach($errors->all() as $e)
                <li>{{ $e }}</li>
              @endforeach
            </ul>
          @endif

          <div class="row py-2">
            <div class="col-md-4 py-2">
              <h3>レシピ名</h3>
              <input type="text" name="name" value="{{ old('name', $recipe->name) }}" placeholder="レシピ名を入力">
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>献立</h3>
              <select name ="menu_id" id="select4">
                @foreach( $menus as $menu)
                  <option value="{{ $menu->id }}" @if(old('menu_id', $recipe->menu_id) == $menu->id) selected="selected" @endif>{{ $menu->name }}</option>
                @endforeach
              </select>
            </div>

            <div class="col-md-3 pr-1 py-2">
              <h3>タイプ</h3>
              <select name ="recipe_category_id" id="select3" onChange="changeSelect4()">
                @foreach( $recipeCategories as $category)
    　　　　　　　<option value="{{ $category->id }}" @if(old('recipe_category_id', $recipe->recipe_category_id) == $category->id) selected="selected" @endif>{{ $category->name }}</option>
    　　　　　　@endforeach
              </select>
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>調理法</h3>
              <select name="howto_id">
                <option value="0" @if(old('howto_id', $recipe->howto_id) == 0) selected="selected" @endif>選択無し</option>
                @foreach($howtos as $howto)
    　　　　　　　<option value="{{ $howto->id }}" @if(old('howto_id', $recipe->howto_id) == $howto->id) selected="selected" @endif>{{ $howto->name }}</option>
    　　　　　　@endforeach
              </select>
            </div>
          </div>

          <div class="row py-2">
            <div class="col-md-2 pr-1 py-2">
              <h3>国別</h3>
              <select name ="recipe_country_id">
                <option value="0" @if(old('recipe_country_id') == 0) selected="selected" @endif>指定無し</option>
                @foreach( $countries as $country)
                  <option value="{{ $country->id }}" @if(old('recipe_country_id', $recipe->recipe_country_id) == $country->id) selected="selected" @endif>{{ $country->name }}</option>
                @endforeach
              </select>
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>主菜副菜</h3>
              <select name ="mainsub_id">
                <option value="0" @if(old('mainsub_id') == 0) selected="selected" @endif>指定無し</option>
                @foreach( $mainsubs as $item)
    　　　　　　　<option value="{{ $item->id }}" @if(old('mainsub_id', $recipe->mainsub_id) == $item->id) selected="selected" @endif>{{ $item->name }}</option>
    　　　　　　 @endforeach
              </select>
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>旬</h3>
              <select name ="season_id">
                <option value="0" @if(old('season_id') == 0) selected="selected" @endif>指定無し</option>
                @foreach( $seasons as $item)
                <option value="{{ $item->id }}" @if(old('season_id', $recipe->season_id) == $item->id) selected="selected" @endif>{{ $item->name }}</option>
                @endforeach
              </select>
            </div>
          </div>

          {{-- 材料、調味料の編集準備 --}}
          @php
            $recMats = $recipe->recipeMaterials;
            $recSeas = $recipe->seasonings->toArray();
          @endphp

          <h3>材料</h3>
          @for($i = 0; $i < 10; $i++)
            @php
              // 入力済みの材料
              $curRecMat = $i < count($recMats) ? $recMats[$i] : null;
              $defMatCatId = $curRecMat ? $curRecMat->material->material_category_id : $materialCategories->first()->id;
              $defMatId = $curRecMat ? $curRecMat->material->id : 0;
              $defAmount = $i < count($recMats) ? $recMats[$i]['amount'] : '';
              $curMatCat = $curRecMat ? $curRecMat->material->category : $materialCategories->first();

              $catSelName = 'material_category_id[' . $i . ']';
              $oldCatSelName = 'material_category_id.' . $i;
              $selId1 = sprintf("select1%d", $i + 1);
              $selId2 = sprintf("select2%d", $i + 1);
              $matSelName = 'material_id[' . $i . ']';
              $oldMatSelName = 'material_id.' . $i;
              $amountName = 'amount[' . $i . ']';
              $oldAmountName = 'amount.' . $i;
            @endphp
            <div class="row py-2">
              <div class="col-md-3 py-2">
                <select name ="{{ $catSelName }}" id="{{ $selId1 }}" onChange="swapSelectOptions('{{ $selId1 }}', '{{ $selId2 }}')">
                  @foreach($materialCategories as $category)
                    <option value="{{ $category->id }}" @if(old($oldCatSelName, $defMatCatId) == $category->id) selected="selected" @endif>{{ $category->name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-md-5 py-2">
                <select name ="{{ $matSelName }}" id="{{ $selId2 }}">
                  <option value="0" @if(old($oldMatSelName) == 0) selected="selected" @endif>選んで下さい</option>
                  @foreach($curMatCat->getSortedMaterials() as $material)
                    <option value="{{ $material->id }}" @if(old($oldMatSelName, $defMatId) == $material->id) selected="selected" @endif>{{ $material->name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="col-md-2 py-2">
                <input type="text" name="{{ $amountName }}" value="{{ old($oldAmountName, $defAmount) }}" placeholder="分量を入力">
              </div>
            </div>
          @endfor

          <h3>(合わせ)調味料</h3>
          @for($i = 0; $i < 5; $i++)
            @php
              $curSeaName = $i < count($recSeas) ? $recSeas[$i]['name'] : null;
              $curSeaBody = $i < count($recSeas) ? $recSeas[$i]['body'] : null;

              $seasonName = 'season[' . $i . ']';
              $seasonBody = 'season_body[' . $i . ']';
              $oldSeasonName = 'season.' . $i;
              $oldSeasonBody = 'season_body.' . $i;
            @endphp
            <div class="row py-2">
              <div class="col-md-4 py-2">
                <input type="text" name="{{ $seasonName }}" placeholder="調味料名" value="{{ old($oldSeasonName, $curSeaName) }}">
              </div>
              <div class="col-md-8 py-2">
                <input type="text" name="{{ $seasonBody }}" placeholder="調味料を入力" size="60" value="{{ old($oldSeasonBody, $curSeaBody) }}">
              </div>
            </div>
          @endfor

          <h3>作り方</h3>
          <div class="form-group row">
            <div class="col-md-10">
              <textarea class="form-control" name="body" placeholder="作り方を記入して下さい。" rows="20">{{ old("body", $recipe->body) }}</textarea>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-2"><h3>画像</h3></label>
            <div class="col-md-10">
              <input type="file" class="form-control-file" name="image">
              <div class="form-text text-info">
                @if($recipe->image_path)
                  <img width="100px" src="{{ Utl::imgPathRecipe($recipe->image_path) }}"/>
                @endif
                設定中: {{ $recipe->image_path }}
              </div>
              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="remove" value="true">画像を削除
                </label>
              </div>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-md-2"><h3>作り方画像</h3></label>
            <div class="col-md-10">
              <input type="file" class="form-control-file" name="image2">
              <div class="form-text text-info">
                @if($recipe->image_path2)
                  <img width="100px" src="{{ Utl::imgPathRecipeHowto($recipe->image_path2) }}"/>
                @endif
                設定中: {{ $recipe->image_path2 }}
              </div>
              <div class="form-check">
                <label class="form-check-label">
                  <input type="checkbox" class="form-check-input" name="remove2" value="true">画像を削除
                </label>
              </div>
            </div>
          </div>

          <h3>検索タグ</h3>
          <div class="row py-2">
            @foreach($tags as $item)
              <div class="col-md-2">
                <div class="chkbox">
                  <input type="checkbox" id="tags[{{$item->id}}]"
                  name="tags[{{$item->id}}]" @if((old('tags' . $item->id) == $item->id) || $recipe->hasTag($item->id)) checked @endif>
                  <label for="tags[{{$item->id}}]">{{$item->name}}</label>
                </div>
              </div>
            @endforeach
          </div>
          <div class="row py-2">

            <div class="chkbox col-md-2">
              <input type="checkbox" id="favorite" name="is_favorite" @if (old('is_favorite', $recipe->is_favorite) == 1) checked @endif>
              <label for="favorite">おいしい</label>
            </div>
            <div class="chkbox col-md-2">
              <input type="checkbox" id="easy" name="is_easy" @if (old('is_easy', $recipe->is_easy) == 1) checked @endif>
              <label for="easy">かんたん</label>
            </div>
            <div class="chkbox col-md-2">
              <input type="checkbox" id="refresh" name="is_refresh" @if (old('is_refresh', $recipe->is_refresh) == 1) checked @endif>
              <label for="refresh">お弁当</label>
            </div>
            <div class="chkbox col-md-2">
              <input type="checkbox" id="healthy" name="is_healthy" @if (old('is_healthy', $recipe->is_healthy) == 1) checked @endif>
              <label for="healthy">身体に良い</label>
            </div>
          </div>

          {{ csrf_field() }}
          <input type="hidden" name="id" value="{{ $recipe->id }}">
          <input type="submit" name="submit" value ="送信">
        </form>
      </div>
    </div>

    <hr/>
    <h3>このレシピで使われている材料</h3>
    <div class="row py-2">
      @foreach($recipe->materials as $item)
        <div class="col-md-4 pr-1 py-2">
          <a class="btn btn-lg btn-warning" href="/user/material/edit?id={{ $item->id }}" role="button">{{ $item->name }}</a>
        </div>
      @endforeach
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
    for( let i = 0; i <=　arr.length; i++ ) {
      select2.options[i + 1] = new Option(arr[i].txt, arr[i].val);
    }
  }
</script>
@endsection
