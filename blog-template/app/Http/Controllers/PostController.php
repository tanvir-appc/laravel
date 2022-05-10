<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Post;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // first messy approach
        // $posts = Post::latest();
        // if (request('search')) {
        //     $posts->where('title','like','%'.request('search').'%')
        //     ->orWhere('body','like','%'.request('search').'%');
        // }
        // return view('posts',[
        //     'posts' => $posts->get(),
        //     'categories' => Category::all(),
        //     'currentCategory' => Category::firstWhere('slug',request('category'))
        // ]);


        // second filter approach

        // dd(request('search'));
        // dd(Category::firstWhere('slug',request('category')));
        return view('posts.index',[
            // 'posts' => Post::latest()->filter(request(['search','category']))->get(),
            'posts' => Post::latest()->filter(request(['search','category','author']))->get()
            // 'categories' => Category::all(),
            // 'currentCategory' => Category::firstWhere('slug',request('category'))
            // 'posts' => Post::latest()->without(['category','author'])->get()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Post $post)
    {
        return view('posts.show',[
            'post' => $post
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
