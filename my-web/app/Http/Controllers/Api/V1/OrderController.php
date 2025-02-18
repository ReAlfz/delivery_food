<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\PivotOrderMenu;
use App\Models\Voucher;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function order($user_id)
    {
        try {
            $order = Order::with(['getMenuForOrder.getDataMenuForOrder'])
                ->where('user_id', $user_id)
                ->get();

            $allData = $order->map(function ($orderData) {
                $menu = $orderData->getMenuForOrder->map(function ($menuData) {
                    return [
                        'id' => $menuData->getDataMenuForOrder->id,
                        'name' => $menuData->getDataMenuForOrder->name,
                        'category' => $menuData->getDataMenuForOrder->category,
                        'price' => $menuData->getDataMenuForOrder->price,
                        'quantity' => $menuData->quantity,
                        'image' => $menuData->getDataMenuForOrder->image,
                        'topping' => json_decode($menuData->topping),
                    ];
                });

                return [
                    'id' => $orderData->id,
                    'no_receipt' => $orderData->no_receipt,
                    'total_price' => $orderData->total_price,
                    'date' => $orderData->date,
                    'status' => $orderData->status,
                    'menu' => $menu,
                ];
            });

            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'data' => $allData,
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Errors in Exception',
                'errors' => $ex->getMessage(),
            ], 403);
        }
    }

    public function detailOrder($order_id)
    {
        try {
            $order = Order::with(['getMenuForOrder.getDataMenuForOrder'])
                ->where('id', $order_id)
                ->get();

            $allData = $order->map(function ($orderData) {
                $menu = $orderData->getMenuForOrder->map(function ($menuData) {
                    return [
                        'id' => $menuData->getDataMenuForOrder->id,
                        'name' => $menuData->getDataMenuForOrder->name,
                        'category' => $menuData->getDataMenuForOrder->category,
                        'price' => $menuData->getDataMenuForOrder->price,
                        'quantity' => $menuData->quantity,
                        'image' => $menuData->getDataMenuForOrder->image,
                        'topping' => json_decode($menuData->topping),
                    ];
                });

                return [
                    'id' => $orderData->id,
                    'no_receipt' => $orderData->no_receipt,
                    'total_price' => $orderData->total_price,
                    'date' => $orderData->date,
                    'status' => $orderData->status,
                    'menu' => $menu,
                ];
            });

            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'data' => $allData,
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Erros in Exception',
                'errors' => $ex->getMessage(),
            ], 403);
        }
    }

    public function voucher()
    {
        try {
            $voucher = Voucher::all();
            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'data' => $voucher
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Errors in Exception',
                'errors' => $ex->getMessage(),
            ], 403);
        }
    }

    public function createOrder(Request $request)
    {
        DB::beginTransaction();
        try {
            $no_receipt = self::generateInvoice();

            $order = Order::create([
                'user_id' => Auth::id(),
                'no_receipt' => $no_receipt,
                'total_price' => $request->total_price,
                'date' => Carbon::now()->format('Y-m-d'),
                'status' => 1,
            ]);

            $pivotData = [];
            foreach ($request->input('menu') as $menuItems) {
                $pivotData[] = [
                    'order_id' => $order->id,
                    'menu_id' => $menuItems['id_menu'],
                    'quantity' => $menuItems['quantity'],
                    'topping' => json_encode($menuItems['topping']),
                ];
            }

            PivotOrderMenu::insert($pivotData);
            DB::commit();

            return response()->json([
                'status' => 200,
                'message' => 'create data successfuly',
            ]);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Errors in Exception',
                'errors' => $ex->getMessage(),
            ], 403);
        }
    }

    function generateInvoice()
    {
        $month = Carbon::now()->format('m');
        $year = Carbon::now()->format('Y');

        $lastInvoice = Order::whereYear('created_at', $year)
            ->whereMonth('created_at', $month)
            ->orderBy('id', 'desc')
            ->first();

        $lastNumber = $lastInvoice ? intval(explode('/', $lastInvoice->no_receipt)[0]) : 0;
        $newNumber = str_pad($lastNumber + 1, 3, '0', STR_PAD_LEFT);

        $invouceNumber = $newNumber . "/INV/" . $month . "/" . $year;
        return $invouceNumber;
    }
}
