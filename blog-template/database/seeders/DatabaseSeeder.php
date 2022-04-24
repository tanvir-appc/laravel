<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        // User::truncate();
        // Post::truncate();
        // Category::truncate();
    	$user = User::factory()->create([
    		'name' => 'Jone Doe'
    	]);
        Post::factory(6)->create([
        	'user_id' => $user->id
        ]);
    }
}
