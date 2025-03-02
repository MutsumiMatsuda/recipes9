@extends('layouts.front')
@section('title', '調理法詳細')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>調理法詳細</h2>
        <div class="form-group row">
          <label class="col-md-2">調理法名</label>
          <div class="col-md-10">
            <div class="card card-body border-primary">
              {{ $howto->name }}
            </div>
          </div>
        </div>

        <hr/>
        <h3>この調理法のレシピ</h3>
        <div class="row py-2">
          @foreach($howto->recipes as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
            </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
@endsection
