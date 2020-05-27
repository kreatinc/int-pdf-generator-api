<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PdfRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'html_content' => 'required',
            'filename' => 'required',
            'email' => 'required|email',
            'name' => 'required',
            'logo' => 'required',
            'avatar' => 'required',
            'phone' => 'required',
            'primary_color' => 'required|max:7',
        ];
    }
}
