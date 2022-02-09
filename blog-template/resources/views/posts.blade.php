<x-layout>
    @foreach( $posts as $post)
        <article>
            <h1><a href="posts/{{$post->id}}">{!! $post->title !!}</a></h1>
            <p>{!! $post->excerpt !!}</p>
        </article>
    @endforeach

    <x-footer-scripts>
        <script src="/home.js"></script>
    </x-footer-scripts>
</x-layout>