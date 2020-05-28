<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\PdfRequest;
use App\Http\Requests\StoreTemplateRequest;
use App\Http\Requests\TemplateRequest;
use App\Http\Resources\TemplateResource;
use App\Http\Resources\UserResource;
use App\Image;
use App\Template;
use App\User;
use finfo;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

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
            if($user->isAdmin()) {
                $data = $user->only('name','email');
                $data['isAdmin'] = $user->isAdmin();
                $data['token'] = $user->createToken('admin')->accessToken;
                return response()->json($data, 200);
            }

        }
        return response()->json(['error' => 'The Email or the password are incorrect'], 403);
    }

    public function logout(Request $request)
    {
        if($request->user()) {
            $request->user()->token()->revoke();
            return response(['success' => 'you are logged out'], 200);
        }
        return response(['error' => 'you are already logged out'], 401);
    }

    public function users() {
        // get users who are doesn't have admin role
        $users = User::whereDoesntHave('role',function (Builder $query){
            $query->where('name','admin');
        })->get();
        return UserResource::collection($users)->response()->setStatusCode(200);
    }

    public function templates() {
        // get users who are doesn't have admin role
        $templates = Template::all();
        return TemplateResource::collection($templates)->response()->setStatusCode(200);
    }

    public function store(StoreTemplateRequest $request) {

        $users = User::find($request->users_id);
        foreach ($users as $user) {
            $user->templates()->create([
                'payload' => $request->payload,
                'filename'=> $request->filename,
            ]);
        }

        return TemplateResource::collection($users)->response()->setStatusCode(201);
    }

    public function show($id) {
        $template = Template::find($id);
        if(is_null($template)) {
            return response(['error'=>'record not found'],404);
        }
        return TemplateResource::make($template)->response()->setStatusCode(200);
    }

    public function update(TemplateRequest $request, $id) {
        $template = Template::find($id);
        if(is_null($template)) {
            return response(['error'=>'record not found'],404);
        }

        $template->update($request->validated());
        return response(['success' => 'updated'], 202);
    }

    public function delete($id) {
        $template = Template::find($id);
        if(is_null($template)) {
            return response(['error'=>'record not found'],404);
        }
        $template->delete();
        return response(['success'=>'deleted'],200);
    }

    public function UploadImage(Request $request) {
        $file = $request->file('image');
        $name = time().$file->getClientOriginalName();
        $file->storeAs('/public/', $name);

        return response([
            "success" => true,
            "file" => [
                "url" => asset("storage/$name"),
            ]
        ], 200);
    }

    public function convertToPdf(PdfRequest $request)
    {
        $html_content = $this->urlConverter($request->html_content);
        $data = $request->only('name', 'logo', 'avatar', 'phone', 'primary_color');
        $data['html_content'] = $html_content;
        $pdf = \PDF::setOptions(['images' => true])->loadView('pdf', compact('data'));
        return $pdf->download($request->filename . '.pdf');
    }

    function urlConverter($text){
        // get all img elements
        $pattern = "/<img.* /";
        preg_match_all($pattern, $text, $elements);
        foreach ($elements[0] as $key=>$element) {

            // get url from src
            $splitedElement = explode('"',$element);
            $url = $splitedElement[1];

            // get full image name
            $splitedSource = explode("/",$url);
            $imgName = $splitedSource[count($splitedSource)-1];

            // build new url
            $newImageUrl = public_path(). "/storage/".$imgName;

            // replace old url with the new one
            $text = str_replace($url,$newImageUrl,$text);
        }
        return $text;
    }
}






