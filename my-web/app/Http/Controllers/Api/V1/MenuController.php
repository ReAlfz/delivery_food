<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Menu;

class MenuController extends Controller
{
    public function menuAll()
    {
        try {
            $menu = Menu::all();
            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'data' => $menu,
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception error',
                'errors' => $ex->getMessage(),
            ], 403);
        }
    }

    public function menuPage($page)
    {
        try {
            $menu = Menu::paginate(5, ['*'], 'page', $page);

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
            ], 403);
        }
    }

    public function menuCategory($category)
    {
        try {
            $menuByCategory = Menu::where('category', $category)->get();
            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'data' => $menuByCategory,
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception error',
                'errors' => $ex->getMessage(),
            ], 403);
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
            ], 403);
        }
    }
}
