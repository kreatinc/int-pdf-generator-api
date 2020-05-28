<?php

namespace App\Providers;

use App\Template;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use Laravel\Passport\Passport;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Passport::routes();

        Passport::tokensExpireIn(now()->addHours(3));

        Passport::refreshTokensExpireIn(now()->addHours(3));


        Gate::define('own-template',function ($user, $template_id) {
            $template = Template::find($template_id);
            return $user->id === $template->user_id;
        });
    }
}
