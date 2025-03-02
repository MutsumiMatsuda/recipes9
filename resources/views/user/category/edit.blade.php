@extends('layouts.common')
@section('title', 'タイプの編集')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <h2>タイプの編集</h2>
                <form action="{{ action('User\CategoryController@update') }}" method="post" enctype="multipart/form-data">

                    @if (count($errors) > 0)
                        <ul>
                            @foreach($errors->all() as $e)
                                <li>{{ $e }}</li>
                            @endforeach
                        </ul>
                    @endif
                    <div class="form-group row">
                        <label class="col-md-2">タイプ名</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="name" value="{{ old('name', $category->name) }}">
                        </div>
                    </div>
                    {{ csrf_field() }}
                    <input type="hidden" name="id" value="{{ $category->id }}">
                    <input type="submit" class="btn btn-primary" value="更新">
                </form>
            </div>
        </div>

        <hr/>
        <h3>このタイプのレシピ</h3>
        <div class="row py-2">
          @foreach($category->recipes as $item)
            <div class="col-md-4 pr-1 py-2">
              <a class="btn btn-lg btn-warning" href="/user/recipe/edit?id={{ $item->id }}" role="button">{{ $item->name }}</a>
            </div>
          @endforeach
        </div>
    </div>
@endsection
