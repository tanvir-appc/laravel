<x-layout>
    <h1>{{ $post->title }}</h1>
    {!! $post->body !!}

    <a href="/">Go back</a>

    <x-footer-scripts>
    </x-footer-scripts>
</x-layout>