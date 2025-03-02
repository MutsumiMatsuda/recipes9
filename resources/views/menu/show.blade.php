@extends('layouts.front')
@section('title', '献立詳細')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-10 mx-auto">
                <h2>献立詳細</h2>
                <div class="form-group row">
                    <label class="col-md-2" for="name">献立名</label>
                    <div class="col-md-7">
                      <div class="card card-body border-primary">
                        {{ $menu->name }}
                      </div>
                    </div>
                    @if($menu->image_path)
                    <div class="col-md-3">
                      <img src="{{ Utl::imgPathMenu($menu->image_path) }}" width="160px">
                    </div>
                    @endif

                </div>
                <div class="form-group row">
                    <label class="col-md-2" for="body">本文</label>
                    <div class="col-md-10">
                      <div class="card card-body border-primary">
                        {!! nl2br($menu->body) !!}
                      </div>
                    </div>
                </div>
            </div>
        </div>
        <hr/>
        <h3>この献立のレシピ</h3>
        <div class="row py-2">
          @foreach($menu->recipes as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-outline-dark" href="/recipe/show?id={{ $item->id }}" role="button">{{ $item->name }}</a>
            </div>
          @endforeach
        </div>
    </div>
@endsection
