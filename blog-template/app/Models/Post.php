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
    public function scopeFilter($query,array $filters){
    	$query->when(isset($filters['search'])?$filters['search']:false,function($query,$search){
            $query->where('title','like','%'.$search.'%')
                ->orWhere('body','like','%'.$search.'%');
        });
        $query->when(isset($filters['category'])?$filters['category']:false,function($query,$category){
        	$query->whereHas('category',function($query) use ($category){
        		$query->where('slug',$category);
        	});
            // $query
            // 	->whereExists(function($query) use ($category){
            // 		$query
            // 			->from('categories')
            // 			->whereColumn('categories.id','posts.category_id')
            // 			->where('categories.slug',$category);
            // 	});
        });
    }
}
