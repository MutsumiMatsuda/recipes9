@extends('layouts.front')
@section('title', 'タイプ詳細')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-8 mx-auto">
        <h2>タイプ詳細</h2>
        <div class="form-group row">
          <label class="col-md-2">タイプ名</label>
          <div class="col-md-10">
            <div class="card card-body border-primary">
              {{ $category->name }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <hr/>
    <h3>このタイプのレシピ</h3>
    <div class="row py-2">
      @foreach($category->recipes as $item)
        <div class="col-md-4 pr-1 py-2">
          <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
        </div>
      @endforeach
    </div>
  </div>
@endsection
