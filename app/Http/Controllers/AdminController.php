<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\PdfRequest;
use App\Http\Requests\StoreTemplateRequest;
use App\Http\Requests\TemplateRequest;
use App\Http\Resources\TemplateResource;
use App\Http\Resources\UserResource;
use App\Template;
use App\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

class AdminController extends Controller
{
    public function login(LoginRequest $request)
    {
        // get email and password from request
        $credential = $request->only('email', 'password');
        // if there is a user with the same email and password coming from the request
        // create a token and return it
        if (Auth::attempt($credential)) {
            $user = Auth::user();
            if ($user->isAdmin()) {
                $data = $user->only('id', 'name', 'email', 'phone', 'avatar', 'logo');
                $data['primaryColor'] = $user->primaryColor;
                $data['secondaryColor'] = $user->secondaryColor;
                $data['isAdmin'] = $user->isAdmin();
                $data['token'] = $user->createToken('admin')->accessToken;
                return response()->json($data, 200);
            }

        }
        return response()->json(['error' => 'The Email or the password are incorrect'], 403);
    }

    public function logout(Request $request)
    {
        if ($request->user()) {
            $request->user()->token()->revoke();
            return response(['success' => 'you are logged out'], 200);
        }
        return response(['error' => 'you are already logged out'], 401);
    }

    public function users()
    {
        // get users who are doesn't have admin role
        $users = User::whereDoesntHave('role', function (Builder $query) {
            $query->where('name', 'admin');
        })->get();
        return UserResource::collection($users)->response()->setStatusCode(200);
    }

    public function templates()
    {
        // get users who are doesn't have admin role
        $templates = Template::all();
        return TemplateResource::collection($templates)->response()->setStatusCode(200);
    }

    public function store(StoreTemplateRequest $request)
    {

        $users = User::find($request->users_id);
        foreach ($users as $user) {
            $user->templates()->create([
                'payload' => $request->payload,
                'filename' => $request->filename,
            ]);
        }

        return TemplateResource::collection($users)->response()->setStatusCode(201);
    }

    public function show($id)
    {
        $template = Template::find($id);
        if (is_null($template)) {
            return response(['error' => 'record not found'], 404);
        }
        return TemplateResource::make($template)->response()->setStatusCode(200);
    }

    public function update(TemplateRequest $request, $id)
    {
        $template = Template::find($id);
        if (is_null($template)) {
            return response(['error' => 'record not found'], 404);
        }

        $template->update($request->validated());
        return response(['success' => 'updated'], 202);
    }

    public function delete($id)
    {
        $template = Template::find($id);
        if (is_null($template)) {
            return response(['error' => 'record not found'], 404);
        }
        $template->delete();
        return response(['success' => 'deleted'], 200);
    }

    public function UploadImage(Request $request)
    {
        $path = null;
        if ($request->has('logo')) {
            // user logo
            $path = $this->storeLogo($request->file('logo'), $request->user());
        }elseif ($request->has('avatar')) {
            // user avatar
            $path = $this->storeAvatar($request->file('avatar'), $request->user());
        } else {
            // user template image
            $path = $this->storeTemplateImage($request->file('image'));
        }

        return response([
            "success" => true,
            "file" => [
                "url" => asset("images/$path"),
            ]
        ], 200);
    }

    public function convertToPdf(PdfRequest $request)
    {
        $htmlContent = str_replace(url(''), public_path(), $request->htmlContent);
        $data = $request->only('name', 'email', 'logo', 'avatar', 'phone', 'primaryColor');
        $data['htmlContent'] = $htmlContent;
        $pdf = \PDF::setOptions(['images' => true])->loadView('pdf', compact('data'));
        return $pdf->download($request->filename . '.pdf');
    }

    private function storeLogo($file, $user)
    {
        $name = time() . "." . $file->getClientOriginalExtension();
        $file->storeAs("/images/logos", $name);

        // delete old logo if it is not the default one
        // we can't the delete the default one because it is used as the the default logo for our upcoming users
        if ($user->logo !== "default.jpg") {
            Storage::delete('/images/logos/' . $user->logo);
        }
        $user->update(['logo' => $name]);
        $path = "logos/$name";
        return $path;
    }

    private function storeAvatar($file, $user)
    {
        $name = time() . "." . $file->getClientOriginalExtension();
        $file->storeAs("/images/avatars", $name);

        // delete old logo if it is not the default one
        // we can't the delete the default one because it is used as the the default logo for our upcoming users
        if ($user->avatar !== "default.jpg") {
            Storage::delete('/images/avatars/' . $user->avatar);
        }
        $user->update(['avatar' => $name]);
        $path = "avatars/$name";
        return $path;
    }

    private function storeTemplateImage($file)
    {
        $name = time() . "." . $file->getClientOriginalExtension();
        $file->storeAs("/images/templates", $name);
        $path = "templates/$name";
        return $path;
    }
}






