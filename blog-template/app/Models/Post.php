<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Category;

class Post extends Model
{
    use HasFactory;
    // protected $guarded = [];
    protected $with = ['category','author'];

    public function category(){
    	return $this->belongsTo(Category::class);
    }
    public function author(){
    	return $this->belongsTo(User::class,'user_id');
    }
    public function scopeFilter($query, array $filters){
        // filter by search
        $query->when(
            $filters['search'] ?? false, fn($query,$search) => 
                $query->where(fn($query)=>
                    $query->where('title','like','%'.$search.'%')
                    ->orWhere('body','like','%'.$search.'%')
        ));

        // filter by category
        $query->when(
            $filters['category'] ?? false, fn($query,$category) => 
                // $query
                //     ->whereExists(fn($query) =>
                //         $query->from('categories')
                //             ->whereColumn('categories.id','posts.category_id')
                //             ->where('categories.slug',$category))
                $query->whereHas('category',fn($query) => $query->where('slug',$category))
        );

        // filter by author
        $query->when(
            $filters['author'] ?? false, fn($query,$author) => 
                $query->whereHas('author',fn($query) => $query->where('username',$author))
        );
    }
}
