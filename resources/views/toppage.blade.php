@extends('layouts.common')

{{-- admin.blade.phpの@yield('title')に'ニュースの新規作成'を埋め込む --}}
@section('title', '料理の検索')

@section('content')
<div class="container">
    <div class="row">
        <h1検索項目選択></h1>
        <form action="{{ action('User\RecipeController@create') }}" method="get">

            @if (count($errors) > 0)
          　    <ul>
          　　        @foreach($errors->all() as $e)
                        <li>{{ $e }}</li>
                    @endforeach
                </ul>
            @endif

            <div class="row">
                <div class="col-md-4">
                    <input type="text" name="keyword" size="100" value="{{$keyword}}" class="form-control" placeholder="検索したい項目名">
                </div>
            </div>

            <div class="row">
              <button type="button">お気に入り</button>
              <button type="button">あっさり</button>
              <button type="button">簡単料理</button>
              <button type="button">作り置き</button>
              <button type="button">箸休め</button>
            </div>

            <div class="row">
              <button type="button">スープ</button>
              <button type="button">サラダ</button>
              <button type="button">魚料理</button>
              <button type="button">イベント</button>
              <button type="button">パーティ</button>
            </div>

            <div class="row">
              <p>調理法</p>
              <select name ="keyword_id" id="select1" onChange="changeSelect2()">
                @foreach( $keywords as $keyword)
                  <option value="{{ $keyword->id }}">{{ $keyword->name }}</option>
      　　　　  @endforeach
              </select>
              <p>ABCメニュー</p>
              <select name ="recipe_id" id="select2">
                  @foreach( $recipes as $recipe)
                    <option value="{{ $recipe->id }}">{{ $recipe->name }}</option>
                  @endforeach
              </select>
              <p>その他</p>{{-- 麺・ご飯, 肉類, デザート, 卵料理, パン, hiro, kids, カテゴリ無し --}}
              <select name ="recipe_id" id="select2">
                  @foreach( $recipes as $recipe)
                    <option value="{{ $recipe->id }}">{{ $recipe->name }}</option>
                  @endforeach
              </select>
            </div>

            {{ csrf_field() }}

            <input type="submit" name="submit" value ="送信">
        </form>
    </div>
</div>
@endsection

@section('js')
<script type = "text/javascript">
  function createSelectBox(){
      //連想配列の配列
        var arr = [
            {val:"01", txt:"栄養素"},
            {val:"02", txt:"調理法"},
            {val:"03", txt:"料理の印象"}、
            {val:"04", txt:"料理の好み"},
            {val:"05", txt:"難易度"},
            {val:"06", txt:"作り置き"}
            ];
    function changeSelect2()
        var arr01 = [
            {val:"1", txt:"マグネシュウム"},
            {val:"2", txt:"カリウム"}
            ];
        var arr02 = [
            {val:"1", txt:"圧力鍋"},
            {val:"2", txt:"オーブン"}
            ];
        var arr03 = [
            {val:"1", txt:"あっさり"}
            ];
        var arr04 = [
            {val:"1", txt:"お気に入り"}
            ];
        var arr05 = [
            {val:"1", txt:"簡単料理"}
            ];
        var arr06 = [
            {val:"1", txt:"作り置き"}
            ];


        var arrs = [
            {id:"1", arr:arr01},
            {id:"2", arr:arr02},
            {id:"3", arr:arr03}
        ];

        var select1 = document.getElementById("select1");//変数select1を宣言
        var select2 = document.getElementById("select2"); //変数select2を宣言

        select2.options.length = 0; // 選択肢の数がそれぞれに異なる場合、これが重要
            var arr = [];
            var tmp = [];
            for (var i = 0; i < arrs.length; i++) {
                tmp  = arrs[i];
                if (tmp.id == select1.options[select1.selectedIndex].value) {
                arr = tmp.arr;
                break;
                }
            }
    }

        //連想配列をループ処理で値を取り出してセレクトボックスにセットする
              for(var i=0;i<arr.length;i++){
                  let op = document.createElement("option");
                  op.value = arr[i].val;  //value値
                  op.text = arr[i].txt;   //テキスト値
                  document.getElementById("test").appendChild(op);
              }





for( let i = 0; i <　arr.length; i++ ) {
select2.options[i] = new Option(arr[i].txt, arr[i].val);
}
          </script>
@endsection
