@extends('layouts.common')

@section('title', '登録済みレシピの一覧')

@section('content')
  <div class="container users-index">
    <div class="row">
      <h2 style="margin-bottom:30px">レシピ一覧</h2>
    </div>
    <div class="row mb-3">
      <div class="col-md-4 l-pad-l">
        <a href="{{ action('User\RecipeController@add') }}" role="button" class="btn btn-primary">レシピ新規作成</a>
      </div>
      <div class="col-md-8">
        <form action="{{ action('User\RecipeController@index') }}" method="get">
          <div class="form-group row l-mg-rl">
            <label class="col-md-2">レシピ</label>
            <div class="col-md-8">
              <input type="text" class="form-control" name="q" value="{{ $q }}">
            </div>
            <div class="col-md-2">
              {{ csrf_field() }}
              <input type="submit" class="btn btn-primary" value="検索">
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="row">
      <div class="list-news col-md-12 mx-auto">
        <div class="row">
          <table class="table table-dark">
            <thead>
              <tr class="header">
                <th width="5%">ID</th>
                <th width="10%">画像</th>
                <th width="20%">レシピ</th>
                <th width="53%">作り方</th>
                <th width="7%">操作</th>
              </tr>
            </thead>
            <tbody>
              @foreach($recipes as $recipe)
                <tr>
                  <th>{{ $recipe->id }}</th>
                  <td>@if($recipe->image_path)<img width="80px" src="{{ Utl::imgPathRecipe($recipe->image_path) }}"/>@endif</td>
                  <td>{{ Str::limit($recipe->name, 30) }}</td>
                  <td>{{ Str::limit($recipe->body, 100) }}</td>
                  <td>
                    <div>
                      <a href="{{ action('User\RecipeController@edit', ['id' => $recipe->id]) }}">編集</a><br/>
                      {{--<a href="{{ action('User\RecipeController@delete', ['id' => $recipe->id]) }}">削除</a>--}}
                      @php Utl::confirmATag('', 'delItem', action('User\RecipeController@delete', ['id' => $recipe->id]), '削除') @endphp
                    </div>
                  </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
@endsection

@section('js')
  <script>
  {{ Utl::putConfirmJs('delItem', '本当に削除してよろしいですか？') }}
  </script>
@endsection
