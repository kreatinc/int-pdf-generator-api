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
        return response()->json(['error' => 'The Email or the password are incorrect'], 401);
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

    public function convertToPdf(PdfRequest $request) {
        $pdf = App::make('dompdf.wrapper');
        $pdf->loadHTML($request->htmlContent);
        return $pdf->download($request->filename.'.pdf');
    }

    public function UploadImage(Request $request) {
        $file = $request->file('image');
        $contents = $file->openFile()->fread($file->getSize());
        $image = Image::create(["image"=>$contents]);

//        $file = $request->file('image');
//        $name = time().$file->getClientOriginalName();
//        $file->storeAs('/public/', $name);
       return response([
               "success" => true,
               "file" => [
                   "url" => url("api/images/$image->id"),
               ]
       ], 200);
    }

    public function showImage($id) {
        $image = Image::find($id);
        if(is_null($image)) {
            return response(['error'=>'record not found'],404);
        }
        return response()->make($image->image, 200, array(
            'Content-Type' => (new finfo(FILEINFO_MIME))->buffer($image->image)
        ));
    }
}
