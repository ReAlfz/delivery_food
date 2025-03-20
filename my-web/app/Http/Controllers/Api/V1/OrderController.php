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

use function PHPUnit\Framework\isEmpty;

class OrderController extends Controller
{
    public function orderOnGoing($user_id, $page)
    {
        try {
            $order = Order::with(['getMenuForOrder.getDataMenuForOrder'])
                ->where('user_id', $user_id)
                ->whereIn('status', [0, 1, 2])
                ->orderBy('id', 'desc')
                ->paginate(5, ['*'], 'page', $page);

            if ($page > $order->lastPage()) {
                return response()->json([
                    'status' => 204,
                    'message' => 'No More Data',
                    'page' => $order->lastPage(),
                ], 200);
            }

            if ($order->isEmpty()) {
                return response()->json([
                    'status' => 403,
                    'message' => 'Order ongoing is empty',
                ], 200);
            }

            $allData = $order->map(function ($orderData) {
                return [
                    'id' => $orderData->id,
                    'no_receipt' => $orderData->no_receipt,
                    'total_price' => $orderData->total_price,
                    'date' => $orderData->date,
                    'status' => $orderData->status,
                    'menu' => $orderData->getMenuForOrder->map(function ($menuData) {
                        return [
                            'id' => $menuData->getDataMenuForOrder->id,
                            'name' => $menuData->getDataMenuForOrder->name,
                            'category' => $menuData->getDataMenuForOrder->category,
                            'price' => $menuData->getDataMenuForOrder->price,
                            'quantity' => $menuData->quantity,
                            'image' => $menuData->getDataMenuForOrder->image,
                            'topping' => json_decode($menuData->topping),
                        ];
                    }),
                ];
            });

            return response()->json([
                'status' => 200,
                'message' => 'successfuly get data',
                'page' => $order->currentPage(),
                'data' => $allData,
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Errors in Exception',
                'errors' => $ex->getMessage(),
            ], 200);
        }
    }

    public function changeStatusOrder($order_id)
    {
        try {
            $order = Order::find($order_id);

            if ($order) {
                if ($order->status < 3) {
                    $order->status += 1;
                    $order->save();

                    return response()->json([
                        'status' => 200,
                        'message' => 'Order status updated successfully',
                    ], 200);
                } else {
                    return response()->json([
                        'status' => 404,
                        'message' => 'Order already delivered',
                    ], 404);
                }
            } else {
                return response()->json([
                    'status' => 404,
                    'message' => 'Order not found',
                ], 404);
            }
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Errors in Exception',
                'errors' => $ex->getMessage(),
            ], 200);
        }
    }

    public function cancelOrder($order_id)
    {
        try {
            $order = Order::find($order_id);

            if ($order) {
                $order->status = 4;
                $order->save();
                return response()->json([
                    'status' => 200,
                    'message' => 'Order status updated successfully',
                ], 200);
            } else {
                return response()->json([
                    'status' => 404,
                    'message' => 'Order not found',
                ], 404);
            }
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Errors in Exception',
                'errors' => $ex->getMessage(),
            ], 200);
        }
    }

    public function orderOnHistory($user_id, $page)
    {
        try {
            $order = Order::with(['getMenuForOrder.getDataMenuForOrder'])
                ->where('user_id', $user_id)
                ->whereIn('status', [3, 4])
                ->orderBy('id', 'desc')
                ->paginate(5, ['*'], 'page', $page);

            if ($page > $order->lastPage()) {
                return response()->json([
                    'status' => 204,
                    'message' => 'No More Data',
                    'page' => $order->lastPage(),
                ], 200);
            }

            if ($order->isEmpty()) {
                return response()->json([
                    'status' => 403,
                    'message' => 'Order history is empty',
                ], 200);
            }

            $allData = $order->map(function ($orderData) {
                return [
                    'id' => $orderData->id,
                    'no_receipt' => $orderData->no_receipt,
                    'total_price' => $orderData->total_price,
                    'date' => $orderData->date,
                    'status' => $orderData->status,
                    'menu' => $orderData->getMenuForOrder->map(function ($menuData) {
                        return [
                            'id' => $menuData->getDataMenuForOrder->id,
                            'name' => $menuData->getDataMenuForOrder->name,
                            'category' => $menuData->getDataMenuForOrder->category,
                            'price' => $menuData->getDataMenuForOrder->price,
                            'quantity' => $menuData->quantity,
                            'image' => $menuData->getDataMenuForOrder->image,
                            'topping' => json_decode($menuData->topping),
                        ];
                    }),
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
            ], 200);
        }
    }

    public function detailOrder($order_id)
    {
        try {
            $order = Order::with(['getMenuForOrder.getDataMenuForOrder'])
                ->where('id', $order_id)
                ->first();

            $allData = [
                'id' => $order->id,
                'no_receipt' => $order->no_receipt,
                'total_price' => $order->total_price,
                'date' => $order->date,
                'status' => $order->status,
                'menu' => $order->getMenuForOrder->map(function ($menuData) {
                    return [
                        'id' => $menuData->getDataMenuForOrder->id,
                        'name' => $menuData->getDataMenuForOrder->name,
                        'category' => $menuData->getDataMenuForOrder->category,
                        'price' => $menuData->getDataMenuForOrder->price,
                        'quantity' => $menuData->quantity,
                        'image' => $menuData->getDataMenuForOrder->image,
                        'topping' => json_decode($menuData->topping),
                    ];
                }),
            ];

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
            ], 200);
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
            ], 200);
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
                'status' => 0,
            ]);

            $pivotData = [];
            foreach ($request->input('menu') as $menuItems) {
                $pivotData[] = [
                    'order_id' => $order->id,
                    'menu_id' => $menuItems['id_menu'],
                    'quantity' => $menuItems['quantity'],
                    'note' => $menuItems['note'],
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
            ], 200);
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
