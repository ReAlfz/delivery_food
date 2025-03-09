<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Menu;
use Illuminate\Http\Request;

class MenuController extends Controller
{

    public function menuPage($page, $category = null)
    {
        try {
            $menu = (is_null($category))
                ? Menu::paginate(5, ['*'], 'page', $page)
                : Menu::where('category', $category)->paginate(5, ['*'], 'page', $page);

            if ($page > $menu->lastPage()) {
                return response()->json([
                    'status' => 204,
                    'message' => 'No More Data',
                    'page' => $menu->lastPage(),
                ], 200);
            }

            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'page' => $menu->currentPage(),
                'data' => $menu->items(),
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception error',
                'errors' => $ex->getMessage(),
            ], 200);
        }
    }

    public function menuById($id)
    {
        try {
            $menu = Menu::with('getToppingForMenu')->find($id);

            $resultMenu = $menu->getToppingForMenu->map(function ($topping) {
                return [
                    'id' => $topping->id,
                    'name' => $topping->name,
                    'price' => $topping->price,
                    'menu_id' => $topping->pivot->menu_id,
                    'topping_id' => $topping->pivot->topping_id
                ];
            });

            if (!$resultMenu || !$menu) {
                return response()->json([
                    'status' => 403,
                    'message' => 'successfuly get data',
                    'data' => 'data not found',
                ], 200);
            }

            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'data' => [
                    'id' => $menu->id,
                    'name' => $menu->name,
                    'category' => $menu->category,
                    'price' => $menu->price,
                    'description' => $menu->description,
                    'image' => $menu->image,
                    'topping_menu' => $resultMenu
                ],
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception error',
                'errors' => $ex->getMessage(),
            ], 200);
        }
    }

    public function searchMenuByKeyword(Request $request)
    {
        try {
            $request->validate(['keyword' => 'required|string|min:3']);
            $keyword = $request->keyword;
            $menu = Menu::whereRaw('LOWER(name) LIKE ?', ['%' . strtolower($keyword) . '%'])->get();

            if ($menu->isEmpty()) {
                return response()->json([
                    'status' => 403,
                    'message' => 'Search data not found',
                ], 200);
            }

            return response()->json([
                'status' => 200,
                'message' => 'Successfuly get data',
                'data' => $menu,
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception error',
                'errors' => $ex->getMessage(),
            ], 200);
        }
    }
}
