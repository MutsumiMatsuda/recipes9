<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RecipeController;
use App\Http\Controllers\MenuController;
use App\Http\Controllers\MaterialController;
use App\Http\Controllers\NutrientController;
use App\Http\Controllers\HowtoController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CountryController;
use App\Http\Controllers\MainsubController;
use App\Http\Controllers\SeasonController;
use App\Http\Controllers\TagController;

use App\Http\Controllers\User\RecipeController as UserRecipeController;
use App\Http\Controllers\User\MenuController as UserMenuController;
use App\Http\Controllers\User\MaterialController as UserMaterialController;
use App\Http\Controllers\User\NutrientController as UserNutrientController;
use App\Http\Controllers\User\HowtoController as UserHowtoController;
use App\Http\Controllers\User\CategoryController as UserCategoryController;
use App\Http\Controllers\User\CountryController as UserCountryController;
use App\Http\Controllers\User\MainsubController as UserMainsubController;
use App\Http\Controllers\User\SeasonController as UserSeasonController;
use App\Http\Controllers\User\TagController as UserTagController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
/*
Route::get('/', function () {
    return view('welcome');
});
*/

Auth::routes();

Route::get('/', [RecipeController::class, 'index'])->name('toppage');
Route::get('recipe', [RecipeController::class, 'index'])->name('p_recipe');
Route::get('recipe/show', [RecipeController::class, 'show']);
Route::get('menu', [MenuController::class, 'index'])->name('p_menu');
Route::get('menu/show', [MenuController::class, 'show']);
Route::get('material', [MaterialController::class, 'index'])->name('p_material');
Route::get('material/show', [MaterialController::class, 'show']);
Route::get('nutrient', [NutrientController::class, 'index'])->name('p_nutrient');
Route::get('nutrient/show', [NutrientController::class, 'show']);
Route::get('howto', [HowtoController::class, 'index'])->name('p_howto');
Route::get('howto/show', [HowtoController::class, 'show']);
Route::get('category', [CategoryController::class, 'index'])->name('p_category');
Route::get('category/show', [CategoryController::class, 'show']);
Route::get('country', [CountryController::class, 'index'])->name('p_country');
Route::get('country/show', [CountryController::class, 'show']);
Route::get('mainsub', [MainsubController::class, 'index'])->name('p_mainsub');
Route::get('mainsub/show', [MainsubController::class, 'show']);
Route::get('season', [SeasonController::class, 'index'])->name('p_season');
Route::get('season/show', [SeasonController::class, 'show']);
Route::get('tag', [TagController::class, 'index'])->name('p_tag');
Route::get('tag/show', [TagController::class, 'show']);

Route::get('/phpinfo', function () {
    return view('phpinfo');
});

Route::group(['prefix' => 'user', 'middleware' => 'auth'], function() {
  Route::get('recipe/create', [UserRecipeController::class, 'add'])->name('addrecipe');
  Route::post('recipe/create', [UserRecipeController::class, 'create']);
  Route::get('recipe/edit', [UserRecipeController::class, 'edit']);
  Route::post('recipe/edit', [UserRecipeController::class, 'update']);
  Route::get('recipe/delete', [UserRecipeController::class, 'delete']);
  Route::get('recipe', [UserRecipeController::class, 'index'])->name('recipe');

  Route::get('menu/create', [UserMenuController::class, 'add']);
  Route::post('menu/create', [UserMenuController::class, 'create']);
  Route::get('menu/edit', [UserMenuController::class, 'edit']); // 追記
  Route::post('menu/edit', [UserMenuController::class, 'update']); // 追記
  Route::get('menu/delete', [UserMenuController::class, 'delete']);
  Route::get('menu', [UserMenuController::class, 'index'])->name('menu');

  Route::get('nutrient', [UserNutrientController::class, 'index'])->name('nutrient');
  Route::get('nutrient/create', [UserNutrientController::class, 'add']);
  Route::post('nutrient/create', [UserNutrientController::class, 'create']);
  Route::get('nutrient/edit', [UserNutrientController::class, 'edit']);
  Route::post('nutrient/edit', [UserNutrientController::class, 'update']);

  Route::get('material', [UserMaterialController::class, 'index'])->name('material');
  Route::get('material/create', [UserMaterialController::class, 'add']);
  Route::post('material/create', [UserMaterialController::class, 'create']);
  Route::get('material/edit', [UserMaterialController::class, 'edit']);
  Route::post('material/edit', [UserMaterialController::class, 'update']);

  Route::get('category', [UserCategoryController::class, 'index'])->name('category');
  Route::get('category/create', [UserCategoryController::class, 'add']);
  Route::post('category/create', [UserCategoryController::class, 'create']);
  Route::get('category/edit', [UserCategoryController::class, 'edit']);
  Route::post('category/edit', [UserCategoryController::class, 'update']);
  Route::get('category/delete', [UserCategoryController::class, 'delete']);

  Route::get('howto', [UserHowtoController::class, 'index'])->name('howto');
  Route::get('howto/create', [UserHowtoController::class, 'add']);
  Route::post('howto/create', [UserHowtoController::class, 'create']);
  Route::get('howto/edit', [UserHowtoController::class, 'edit']);
  Route::post('howto/edit', [UserHowtoController::class, 'update']);
  Route::get('howto/delete', [UserHowtoController::class, 'delete']);

  Route::get('country', [UserCountryController::class, 'index'])->name('country');
  Route::get('country/create', [UserCountryController::class, 'add']);
  Route::post('country/create', [UserCountryController::class, 'create']);
  Route::get('country/edit', [UserCountryController::class, 'edit']);
  Route::post('country/edit', [UserCountryController::class, 'update']);
  Route::get('country/delete', [UserCountryController::class, 'delete']);

  Route::get('mainsub', [UserMainsubController::class, 'index'])->name('mainsub');
  Route::get('mainsub/create', [UserMainsubController::class, 'add']);
  Route::post('mainsub/create', [UserMainsubController::class, 'create']);
  Route::get('mainsub/edit', [UserMainsubController::class, 'edit']);
  Route::post('mainsub/edit', [UserMainsubController::class, 'update']);
  Route::get('mainsub/delete', [UserMainsubController::class, 'delete']);

  Route::get('season', [UserSeasonController::class, 'index'])->name('season');
  Route::get('season/create', [UserSeasonController::class, 'add']);
  Route::post('season/create', [UserSeasonController::class, 'create']);
  Route::get('season/edit', [UserSeasonController::class, 'edit']);
  Route::post('season/edit', [UserSeasonController::class, 'update']);
  Route::get('season/delete', [UserSeasonController::class, 'delete']);

  Route::get('tag', [UserTagController::class, 'index'])->name('tag');
  Route::get('tag/create', [UserTagController::class, 'add']);
  Route::post('tag/create', [UserTagController::class, 'create']);
  Route::get('tag/edit', [UserTagController::class, 'edit']);
  Route::post('tag/edit', [UserTagController::class, 'update']);
  Route::get('tag/delete', [UserTagController::class, 'delete']);
});

Route::get('test', [App\Http\Controllers\TopPageController::class, 'test'])->name('test');

Route::get('learner', [App\Http\Controllers\Learners\PagesController::class, 'qTop'])->name('learnerTop');

Route::get('learner/trans', [App\Http\Controllers\Learners\PagesController::class, 'transIndex'])->name('transIndex');
Route::get('learner/trans/hidden', [App\Http\Controllers\Learners\PagesController::class, 'transHiddenIndex'])->name('transHidden');
Route::get('learner/trans/hide', [App\Http\Controllers\Learners\PagesController::class, 'hideTrans'])->name('hideTrans');
Route::get('learner/trans/show', [App\Http\Controllers\Learners\PagesController::class, 'showHiddenTrans'])->name('showHiddenTrans');
Route::get('learner/trans/try', [App\Http\Controllers\Learners\PagesController::class, 'tryTrans'])->name('tryTrans');
Route::get('learner/trans/prevtry', [App\Http\Controllers\Learners\PagesController::class, 'tryPrevTrans'])->name('tryPrevTrans');

Route::get('learner/fill', [App\Http\Controllers\Learners\PagesController::class, 'fillIndex'])->name('fillIndex');
Route::get('learner/fill/hidden', [App\Http\Controllers\Learners\PagesController::class, 'fillHiddenIndex'])->name('fillHidden');
Route::get('learner/fill/hide', [App\Http\Controllers\Learners\PagesController::class, 'hideFill'])->name('hideFill');
Route::get('learner/fill/show', [App\Http\Controllers\Learners\PagesController::class, 'showHiddenFill'])->name('showHiddenFill');
Route::get('learner/fill/try', [App\Http\Controllers\Learners\PagesController::class, 'tryFill'])->name('tryFill');
Route::get('learner/fill/prevtry', [App\Http\Controllers\Learners\PagesController::class, 'tryPrevFill'])->name('tryPrevFill');

Route::get('learner/tag/try', [App\Http\Controllers\Learners\PagesController::class, 'tryWithTag'])->name('tryWithTag');
Route::get('learner/tag/prevtry', [App\Http\Controllers\Learners\PagesController::class, 'tryPrevWithTag'])->name('tryPrevWithTag');

Route::get('learner/detail', [App\Http\Controllers\Learners\PagesController::class, 'qDetail'])->name('transDetail');
Route::post('learner/check', [App\Http\Controllers\Learners\PagesController::class, 'qCheck'])->name('transCheck');
Route::get('learner/add', [App\Http\Controllers\Learners\PagesController::class, 'add'])->name('transAdd');
Route::post('learner/add', [App\Http\Controllers\Learners\PagesController::class, 'create'])->name('transCreate');
Route::get('learner/edit', [App\Http\Controllers\Learners\PagesController::class, 'edit'])->name('transEdit');
Route::post('learner/update', [App\Http\Controllers\Learners\PagesController::class, 'update'])->name('transUpdate');

Route::get('learner/fill/detail', [App\Http\Controllers\Learners\PagesController::class, 'fillDetail'])->name('fillDetail');
Route::post('learner/fill/check', [App\Http\Controllers\Learners\PagesController::class, 'fillCheck'])->name('fillCheck');
Route::get('learner/fill/add', [App\Http\Controllers\Learners\PagesController::class, 'addFill'])->name('fillAdd');
Route::post('learner/fill/add', [App\Http\Controllers\Learners\PagesController::class, 'createFill'])->name('fillCreate');
Route::get('learner/fill/edit', [App\Http\Controllers\Learners\PagesController::class, 'editFill'])->name('fillEdit');
Route::post('learner/fill/update', [App\Http\Controllers\Learners\PagesController::class, 'updateFill'])->name('fillUpdate');

Route::get('learner/type', [App\Http\Controllers\Learners\TypeController::class, 'index'])->name('typeIndex');
Route::get('learner/type/detail', [App\Http\Controllers\Learners\TypeController::class, 'detail'])->name('typeDetail');
Route::get('learner/type/add', [App\Http\Controllers\Learners\TypeController::class, 'add'])->name('typeAdd');
Route::post('learner/type/create', [App\Http\Controllers\Learners\TypeController::class, 'create'])->name('typeCreate');
Route::get('learner/type/edit', [App\Http\Controllers\Learners\TypeController::class, 'edit'])->name('typeEdit');
Route::post('learner/type/update', [App\Http\Controllers\Learners\TypeController::class, 'update'])->name('typeUpdate');


Route::post('learner/chinese', [App\Http\Controllers\Learners\PagesController::class, 'getChinese'])->name('chinese');
Route::post('learner/pinyin', [App\Http\Controllers\Learners\PagesController::class, 'getPinyin'])->name('pinyin');
Route::post('learner/english', [App\Http\Controllers\Learners\PagesController::class, 'getEnglish'])->name('english');

Route::get('learner/sakura', [App\Http\Controllers\Learners\PagesController::class, 'sakura'])->name('sakura');
Route::post('learner/sakura', [App\Http\Controllers\Learners\PagesController::class, 'checkAnswer']);
Route::get('learner/stars', [App\Http\Controllers\Learners\PagesController::class, 'stars'])->name('stars');
Route::get('learner/momiji', [App\Http\Controllers\Learners\PagesController::class, 'momiji'])->name('momiji');
Route::get('learner/confetti', [App\Http\Controllers\Learners\PagesController::class, 'confetti'])->name('confetti');
Route::get('learner/starwars', [App\Http\Controllers\Learners\PagesController::class, 'starwars'])->name('starwars');
