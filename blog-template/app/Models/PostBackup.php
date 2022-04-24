<?php

namespace App\Models;
use Illuminate\Support\Facades\File;
use Spatie\YamlFrontMatter\YamlFrontMatter;

// use Illuminate\Database\Eloquent\Factories\HasFactory;
// use Illuminate\Database\Eloquent\Model;

class Post2
{
    public $title;
    public $body;
    public $excerpt;
    public $slug;
    public $date;

    public function __construct($title,$body,$excerpt,$slug,$date){
    	$this->title = $title;
    	$this->body = $body;
    	$this->excerpt = $excerpt;
    	$this->slug = $slug;
    	$this->date = $date;
    }

    public static function all(){
    	return cache()->remember('posts.all',now()->addSeconds(5),function(){
    		return collect(File::files(resource_path('posts')))
    					->map(fn($file) => YamlFrontMatter::parseFile($file))
    					->map(fn($document) => new Post(
    						$document->title,
    						$document->body(),
    						$document->excerpt,
    						$document->slug,
    						$document->date,
    					))
    					->sortBy('date');
    	});
    }

    public static function find($slug){
    	return static::all()->firstWhere('slug',$slug);
    }

    public static function findOrFail($slug){
    	$post = static::find($slug);
    	if (!$post) {
    		abort(404);
    	}
    	return $post;
    }
}
