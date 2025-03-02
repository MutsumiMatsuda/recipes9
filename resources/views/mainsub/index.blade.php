@extends('layouts.front')

@section('title', '分類一覧')

@section('content')
  <div class="container users-index">
    <div class="row">
      <h2 style="margin-bottom:30px">主菜/副菜などの分類一覧</h2>
    </div>
    <div class="row">
      <div class="col-md-8">
        <form action="{{ action('MainsubController@index') }}" method="get">
          <div class="form-group row l-mg-rl">
            <label class="col-md-2">分類名</label>
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
                <th width="10%">分類</th>
                <th width="78%">登録レシピ</th>
                <th width="7%">操作</th>
              </tr>
            </thead>
            <tbody>
              @foreach($items as $item)
                <tr>
                  <th>{{ $item->id }}</th>
                  <td>{{ str_limit($item->name, 15) }}</td>
                  <td>
                    @php
                      $i = 0;
                      foreach($item->recipes as $recipe) {
                        if ($i) {
                          echo ', ';
                        }
                        echo $recipe->name;
                        $i++;
                        if ($i > 3) {
                          break;
                        }
                      }
                    @endphp
                  </td>
                  <td>
                    <div>
                      <a href="{{ action('MainsubController@show', ['id' => $item->id]) }}">詳細</a>
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
