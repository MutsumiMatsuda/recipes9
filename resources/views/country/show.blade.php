@extends('layouts.front')
@section('title', '国別料理詳細')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>国別料理詳細</h2>
        <div class="form-group row">
          <label class="col-md-2">国別料理名</label>
          <div class="col-md-10">
            <div class="card card-body border-primary">
              {{ $country->name }}
            </div>
          </div>
        </div>

        <hr/>
        <h3>レシピ</h3>
        <div class="row py-2">
          @foreach($country->recipes as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
            </div>
          @endforeach
        </div>
      </div>
    </div>
  </div>
@endsection
