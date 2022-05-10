<x-dropdown>
    <x-slot name="trigger">
        <button class="py-2 pl-3 pr-9 text-sm font-semibold w-full lg:w-32 text-left flex lg:inline-flex">
            {{ isset($currentCategory) ? ucwords($currentCategory->name) : 'Categories' }}

            <x-icon name="down-arrow" class="absolute pointer-events-none" style="right: 12px;"/>
        </button>
    </x-slot>

    <!-- <x-dropdown-item href="/" :active="request()->routeIs('home')">All</x-dropdown-item> -->
    @php
        $allhref = "/";
        if(request('search')){
            $allhref .= "?".http_build_query(request()->except('category'));
        }
    @endphp
    <x-dropdown-item href="{{$allhref}}" :active="!request('category') ?? true">All</x-dropdown-item>

    @foreach ($categories as $category)
        @php
            $href = "/?category={$category->slug}";
            if(request('search')){
                $href .= "&".http_build_query(request()->except('category'));
            }
        @endphp
        <x-dropdown-item
            href="{{$href}}"
            :active='isset($currentCategory) && $currentCategory->is($category)'
        >{{ ucwords($category->name) }}</x-dropdown-item>
    @endforeach
</x-dropdown>