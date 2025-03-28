@extends('layouts.front')
@section('title', '登録済み献立の一覧')

@section('content')
    <div class="container">
        <div class="row">
            <h2>献立一覧</h2>
        </div>
        <div class="row mb-3">
            <div class="col-md-8">
                <form action="{{ action('MenuController@index') }}" method="get">
                    <div class="form-group row">
                        <label class="col-md-2">献立名</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="cond_name" value="{{ $cond_name }}">
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
                            <tr>
                                <th width="10%">ID</th>
                                <th width="20%">写真</th>
                                <th width="20%">献立名</th>
                                <th width="43%">本文</th>
                                <th width="7%">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($posts as $menu)
                                <tr>
                                    <th>{{ $menu->id }}</th>
                                    <td>
                                        @if ($menu->image_path)
                                        <img width="100px" src="{{ Utl::imgPathMenu($menu->image_path) }}">
                                        @endif
                                    </td>
                                    <td>{{ \Str::limit($menu->name, 100) }}</td>
                                    <td>{{ \Str::limit($menu->body, 250) }}</td>
                                    <td>
                                        <div>
                                            <a href="{{ action('MenuController@show', ['id' => $menu->id]) }}">詳細</a>
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
