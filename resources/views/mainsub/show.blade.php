@extends('layouts.front')
@section('title', '料理分類詳細')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>料理分類詳細</h2>
        <div class="form-group row">
          <label class="col-md-2">分類名</label>
          <div class="col-md-10">
            <div class="card card-body border-primary">
              {{ $mainsub->name }}
            </div>
          </div>
        </div>

        <hr/>
        <h3>この分類レシピ</h3>
        <div class="row py-2">
          @foreach($mainsub->recipes as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
            </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
@endsection
