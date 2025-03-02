@extends('layouts.front')

@section('title', '材料詳細')

@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-10 mx-auto">
        <h2>材料詳細</h2>
          <div class="row py-2">
            <div class="col-md-8 py-2">
              <h3>材料名</h3>
              <div class="card card-body border-primary">
                {{ $material->name }}
                @if($material->name2) {{'、' . $material->name2}} @endif
                @if($material->name3) {{'、' . $material->name3}} @endif
              </div>
            </div>

            <div class="col-md-2 pr-1 py-2">
              <h3>カテゴリ</h3>
              <div class="card card-body border-primary">
                {{ $material->category->name }}
              </div>
            </div>
          </div>

          <hr/>
          <h3>この材料が含む栄養素</h3>
          <div class="row py-2">
            @foreach($material->nutrients as $item)
              <div class="col-md-4 pr-1 py-2">
                <a class="btn btn-lg btn-outline-dark" href="/nutrient/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
              </div>
            @endforeach
          </div>

          <hr/>
          <h3>この材料が使われているレシピ</h3>
          <div class="row py-2">
            @foreach($material->recipes as $item)
              <div class="col-md-4 pr-1 py-2">
                <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
              </div>
            @endforeach
          </div>
      </div>
    </div>

  </div>
@endsection

@section('js')
@endsection
