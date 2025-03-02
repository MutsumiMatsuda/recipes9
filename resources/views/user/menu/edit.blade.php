@extends('layouts.common')
@section('title', '献立の編集')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <h2>献立の編集</h2>
                <form action="{{ action('User\MenuController@update') }}" method="post" enctype="multipart/form-data">
                    @if (count($errors) > 0)
                        <ul>
                            @foreach($errors->all() as $e)
                                <li>{{ $e }}</li>
                            @endforeach
                        </ul>
                    @endif
                    <div class="form-group row">
                        <label class="col-md-2" for="name">献立名</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="name" value="{{ $menu->name}}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2" for="body">本文</label>
                        <div class="col-md-10">
                            <textarea class="form-control" name="body" rows="20">{{ $menu->body }}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-2" for="image">画像</label>
                        <div class="col-md-10">
                            <input type="file" class="form-control-file" name="image">
                            <div class="form-text text-info">
                              @if($menu->image_path)
                                <img width="100px" src="{{ Utl::imgPathMenu($menu->image_path) }}"/>
                              @endif
                              設定中: {{ $menu->image_path }}
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="checkbox" class="form-check-input" name="remove" value="true">画像を削除
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-10">
                            <input type="hidden" name="id" value="{{ $menu->id }}">
                            {{ csrf_field() }}
                            <input type="submit" class="btn btn-primary" value="更新">
                        </div>
                    </div>
                </form>
                <h3>この献立のレシピ</h3>
                <div class="row py-2">
                  @foreach($menu->recipes as $item)
                    <div class="col-md-4 pr-1 py-2">
                      <a class="btn btn-lg btn-warning" href="/user/recipe/edit?id={{ $item->id }}" role="button">{{ $item->name }}</a>
                    </div>
                  @endforeach
                </div>
            </div>
        </div>
        <hr/>
    </div>
@endsection
