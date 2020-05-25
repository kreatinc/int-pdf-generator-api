<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginRequest;
use App\Http\Requests\PdfRequest;
use App\Http\Requests\TemplateRequest;
use App\Http\Resources\TemplateResource;
use App\Image;
use App\Template;
use finfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function login(LoginRequest $request)
    {
        // get email and password from request
        $credential = $request->only('email', 'password');
        // if there is a user with the same email and password coming from the request
        // create a token and return it
        if (Auth::attempt($credential)) {
            $user = Auth::user();

            if(!$user->isAdmin()) {
                $data['name'] = $user->name;
                $data['email'] = $user->email;
                $data['isAdmin'] = $user->isAdmin();
                $data['token'] = $user->createToken('user')->accessToken;
                return response()->json($data, 200);
            }
        }
        return response()->json(['error' => 'The Email or the password are incorrect'], 403);
    }

    public function index() {
        $templates = Auth::user()->templates;
        return TemplateResource::collection($templates)->response()->setStatusCode(200);
    }

    public function show($id) {
        $template = Template::find($id);
        return TemplateResource::make($template)->response()->setStatusCode(200);
    }

    public function update(TemplateRequest $request, $id) {
        $template = Template::find($id);
        $template->update($request->validated());
        return response(['success' => 'updated'], 202);
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
        $data = $request->only('name', 'email', 'logo', 'avatar', 'phone', 'primary_color');
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
