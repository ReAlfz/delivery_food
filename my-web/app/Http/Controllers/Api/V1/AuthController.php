<?php

namespace App\Http\Controllers\Api\V1;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $validate_data = Validator::make($request->all(), [
            'username' => 'required|string|max:255',
            'phone' => 'required|string|regex:/^[0-9]{10,15}/|max:255|unique:users',
            'password' => 'required|string|confirmed|min:6',
        ]);

        if ($validate_data->fails()) {
            return response()->json([
                'status' => 403,
                'message' => 'Validation Error',
                'errors' => collect($validate_data->errors()->toArray())
                    ->map(fn($messages) => $messages[0])
                    ->all(),
            ], 403);
        }

        try {
            $userData = User::create([
                'username' => $request->username,
                'phone' => $request->phone,
                'password' => Hash::make($request->password),
            ]);

            $token_access = $userData->createToken('auth_token')->plainTextToken;
            return response()->json([
                'status' => 201,
                'message' => 'Register successful',
                'access_token' => $token_access,
                'users' => $userData,
            ], 201);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception Error',
                'errors' => $ex->getMessage()
            ], 200);
        }
    }

    public function login(Request $request)
    {
        $validate_data = Validator::make($request->all(), [
            'phone' => 'required|string|regex:/^[0-9]{10,15}/',
            'password' => 'required|string|min:6'
        ]);

        if ($validate_data->fails()) {
            return response()->json([
                'status' => 403,
                'message' => 'Validation Error',
                'errors' => collect($validate_data->errors()->toArray())
                    ->map(fn($messages) => $messages[0])
                    ->all(),
            ], 403);
        }

        $credentials = $request->only('phone', 'password');

        try {
            if (!Auth::attempt($credentials)) {
                return response()->json([
                    'status' => 403,
                    'message' => 'Validation Error',
                    'errors' => 'Incorrect Phone Number or Password'
                ], 403);
            }

            $userData = User::firstWhere('phone', $request->phone);
            $userData->tokens()->delete();
            $token_access = $userData->createToken('auth_token')->plainTextToken;

            return response()->json([
                'status' => 200,
                'message' => 'Login Successful',
                'access_token' => $token_access,
                'users' => $userData
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception Error',
                'errors' => $ex->getMessage()
            ], 403);
        }
    }

    public function update_user(Request $request) {}

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 200,
            'message' => 'logout successful'
        ], 200);
    }
}
