<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
            'phone' => $this->phone,
            'avatar' => $this->avatar,
            'logo' => $this->logo,
            'primaryColor' => $this->primaryColor,
            'secondaryColor' => $this->secondaryColor,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
