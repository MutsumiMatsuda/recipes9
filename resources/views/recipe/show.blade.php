@extends('layouts.front')
@section('title', 'レシピ詳細')

@section('style')
  /* 画像のモーダル関連 */
  .modal-middle {		//モーダルウィンドウの縦表示位置を調整
  	margin: 5% auto;
  }

  .modal-img_footer {	//表示予定のテキストとボタンを中央揃え
  	padding: .5em;
  	text-align: center;
  }
@endsection

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <div class="row py-2">
          <div class="col-md-9 py-2">
            <div class="card bg-success">
              <a class="btn btn-lg btn-outline-dark text-white" href="#" role="button"><h3>{{ $recipe->name }}</h3></a>
            </div>
          </div>
          @if($recipe->image_path)
          <div class="col-md-3">
            <img src="{{ Utl::imgPathRecipe($recipe->image_path) }}" width="160px">
          </div>
          @endif
        </div>
        <div class="row py-2">
          <div class="col-md-3 pr-1 py-2">
            <h3>献立</h3>
            <div class="card bg-info">
              <a class="btn btn-lg btn-outline-dark text-white" href="/menu/show?id={{ $recipe->menu->id }}" role="button">{{ $recipe->menu->name }}</a>
            </div>
          </div>

          <div class="col-md-3 pr-1 py-2">
            <h3>タイプ</h3>
            <div class="card bg-info">
              <a class="btn btn-lg btn-outline-dark text-white" href="/category/show?id={{ $recipe->category->id }}" role="button">{{ $recipe->category->name }}</a>
            </div>
          </div>

          @if($recipe->howto)
            <div class="col-md-2 pr-1 py-2">
              <h3>調理法</h3>
              <div class="card bg-info">
                <a class="btn btn-lg btn-outline-dark text-white" href="/howto/show?id={{ $recipe->howto->id }}" role="button">{{ $recipe->howto->name }}</a>
              </div>
            </div>
          @endif
          @if($recipe->recipe_country_id)
            <div class="col-md-2 pr-1 py-2">
              <h3>国別</h3>
              <div class="card bg-info">
                <a class="btn btn-lg btn-outline-dark text-white" href="/country/show?id={{ $recipe->recipe_country_id }}" role="button">{{ $recipe->country->name }}</a>
              </div>
            </div>
          @endif
          @if($recipe->mainsub_id)
            <div class="col-md-2 pr-1 py-2">
              <h3>主菜/副菜</h3>
              <div class="card bg-info">
                <a class="btn btn-lg btn-outline-dark text-white" href="/mainsub/show?id={{ $recipe->mainsub_id }}" role="button">{{ $recipe->mainsub->name }}</a>
              </div>
            </div>
          @endif

          @auth
            <div class="col-md-3 pr-1 py-2 ml-auto">
              <a class="btn btn-lg btn-warning" href="/user/recipe/edit?id={{ $recipe->id }}" role="button">編集画面へ</a>
            </div>
          @endauth
        </div>

        <div class="row py-2">
          <div class="col-md-3">
            <div class="chkbox">
              <input type="checkbox" id="favorite" name="is_favorite" disabled="true" @if ($recipe->is_favorite == 1) checked @endif>
              <label for="favorite">おいしい</label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="chkbox">
              <input type="checkbox" id="easy" name="is_easy" disabled="true" @if ($recipe->is_easy == 1) checked @endif>
              <label for="easy">かんたん</label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="chkbox">
              <input type="checkbox" id="refresh" name="is_refresh" disabled="true" @if ($recipe->is_refresh == 1) checked @endif>
              <label for="refresh">お弁当</label>
            </div>
          </div>
          <div class="col-md-3">
            <div class="chkbox">
              <input type="checkbox" id="healthy" name="is_healthy" disabled="true" @if ($recipe->is_healthy == 1) checked @endif>
              <label for="healthy">身体に良い</label>
            </div>
          </div>
        </div>

      <div class="row py-2">
        <div class="col-md-3 ml-auto">
          <a class="btn btn-lg btn-warning" href="/recipe" role="button">一覧に戻る</a>
        </div>
      </div>


        <h3>材料</h3>
        <div class="row py-2">
          @foreach($recipe->recipeMaterials as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-outline-dark" href="/material/show?id={{ $item->material->id }}" role="button">{{ $item->material->name . " " . $item->amount }}</a>
            </div>
          @endforeach
        </div>

        <hr/>

        @if(count($recipe->seasonings))
        <h3>(合わせ)調味料</h3>
        @foreach($recipe->seasonings as $item)
          <div class="row py-2">
            {{-- <div class="card-group py-2"> --}}
              <div class="col-md-4">
                <div class="card card-body border-primary">
                  <h4 class="card-title">{{ $item->name }}</h4>
                </div>
              </div>
              <div class="col-md-8">
                <div class="card card-body border-primary">
                  {{ $item->body }}
                </div>
              </div>
            {{-- </div> --}}
          </div>
        @endforeach
        @endif

        <h3>作り方</h3>
        <div class="row">
          <div class="card card-body border-primary">
            {!! Utl::nl2br($recipe->body) !!}
          </div>
        </div>

        {{-- 作り方画像のモーダル表示 --}}
        @if($recipe->image_path2)
        <hr/>
        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#image_Modal" style="cursor:pointer">作り方画像を見る</button>
        <div class="modal fade" id="image_Modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
          <div class="modal-dialog modal-lg modal-middle">
            <div class="modal-content">
              <div class="modal-body">
                <img src="{{ Utl::imgPathRecipeHowto($recipe->image_path2) }}" alt="作り方画像" width="720" class="aligncenter size-full wp-image-425"/>
              </div>
              <div class="modal-img_footer">
                <button type="button" class="btn btn-success" data-dismiss="modal">閉じる</button>
              </div>
            </div>
          </div>
        </div>
        @endif

        <hr/>
        <h3>このレシピで摂れる栄養素</h3>
        <div class="row py-2">
          @foreach($recipe->nutrients() as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-outline-dark" href="/nutrient/show?id={{ $item['id'] }}" role="button">{{ $item['name'] }}</a>
            </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
@endsection

@section('js')
@endsection
