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
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|confirmed|min:6',
            'address' => 'required|string|max:255'
        ]);

        if ($validate_data->fails()) {
            return response()->json([
                'status' => 403,
                'message' => 'Validation Error',
                'errors' => $validate_data->errors(),

            ], 403);
        }

        try {
            $user = User::create([
                'username' => $request->username,
                'email' => $request->email,
                'password' => Hash::make($request->password),
                'address' => $request->address,
            ]);

            $token_access = $user->createToken('auth_token')->plainTextToken;
            return response()->json([
                'status' => 201,
                'message' => 'Register successful',
                'access_token' => $token_access,
                'users' => $user
            ], 201);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception Error',
                'errors' => $ex->getMessage()
            ], 403);
        }
    }

    public function login(Request $request)
    {
        $validate_data = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string|min:6'
        ]);

        if ($validate_data->fails()) {
            return response()->json([
                'status' => 'validate',
                'errors' => $validate_data->errors()
            ], 403);
        }

        $credentials = $request->only('email', 'password');

        try {
            if (!Auth::attempt($credentials)) {
                return response()->json([
                    'status' => 403,
                    'message' => 'Validation Error',
                    'errors' => 'Invalid Credentials'
                ], 403);
            }

            $user = User::firstWhere('email', $request->email);
            $token_access = $user->createToken('auth_token')->plainTextToken;

            return response()->json([
                'status' => 200,
                'message' => 'Login Successful',
                'access_token' => $token_access,
                'users' => $user
            ], 200);
        } catch (\Exception $ex) {
            return response()->json([
                'status' => 403,
                'message' => 'Exception Error',
                'errors' => $ex->getMessage()
            ], 403);
        }
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 200,
            'message' => 'logout successful'
        ], 200);
    }
}
