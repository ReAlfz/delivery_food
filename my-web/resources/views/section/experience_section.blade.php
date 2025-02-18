{{-- Experience --}}

<section id="experience" class="py-32">
    <div class="container">
        <div class="flex flex-wrap items-center justify-center px-12">
            <div class="mx-auto w-full lg:w-1/2">
                <h2 class="text-responsive font-semibold
                    text-primary text-xl lg:text-2xl">
                    Experience and Education
                </h2>
                <h1 class="text-responsive font-bold text-secondary pt-[4px]
                    text-2xl lg:text-3xl">
                    Resume of Experience and Education
                </h1>
            </div>
            <div class="mx-auto w-full lg:w-1/2 lg:pl-8">
                <h3 class="text-responsive font-normal pt-5 text-base lg:text-lg">
                    Highlight my progress in my career and studies, showcasing the practical experience, academic
                    achievements and skills I have gained along the way.
                </h3>
            </div>
        </div>
        <div class="flex flex-wrap lg:justify-between pt-10">
            <div class="flex mx-[5px] lg:mx-auto w-full lg:w-[40%]">
                <div class="relative flex flex-col">

                    {{-- Vertical Line --}}
                    <div class="absolute w-[2px] bg-primary left-5 top-7 bottom-7"></div>
                    @foreach ($experience as $data)
                        <div class="flex pl-[12px] items-center py-5 pr-[12px] md:pr-0 relative">

                            {{-- Circle Indicator --}}
                            <div class="circle"></div>

                            {{-- Content --}}
                            <div class="flex items-center carier-card">
                                <div class="icon-carier">
                                    <svg width="25" height="40" fill="currentColor" stroke="currentColor"
                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path
                                            d="M184 48H328c4.4 0 8 3.6 8 8V96H176V56c0-4.4 3.6-8 8-8zm-56 8V96H64C28.7 96 0 124.7 0 160v96H192 320 512V160c0-35.3-28.7-64-64-64H384V56c0-30.9-25.1-56-56-56H184c-30.9 0-56 25.1-56 56zM512 288H320v32c0 17.7-14.3 32-32 32H224c-17.7 0-32-14.3-32-32V288H0V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V288z">
                                        </path>
                                    </svg>
                                </div>
                                <div class="ml-4 w-full">
                                    <div class="flex flex-col flex-wrap w-full pb-5">
                                        <h2 class="text-lg font-semibold text-secondary">
                                            {{ $data['position'] }}
                                        </h2>
                                        <h2 class="text-base font-semibold text-primary pt-[5px]">
                                            {{ $data['company'] }}
                                        </h2>
                                    </div>
                                    <p class="w-full text-sm text-gray-600 tracking-normal break-words">
                                        {{ $data['description'] }}
                                    </p>
                                    <div class="flex pt-5 items-center justify-start">
                                        <li class="mb-[1px]"></li>
                                        <h6 class="text-sm text-dark block">{{ $data['time'] }}</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>

            <div class="flex w-full mx-[5px] lg:mx-auto lg:w-[40%]">
                <div class="flex flex-col w-full">
                    <div class="relative flex flex-col">
                        {{-- vertical line --}}
                        <div class="absolute w-[2px] bg-primary left-5 top-7 bottom-7"></div>
                        @foreach ($academy as $data)
                            <div class="flex pl-[12px] items-center space-x-4 py-5 relative">
                                {{-- Circle Indicator --}}
                                <div class="circle"></div>

                                {{-- Content --}}
                                <div class="flex items-center carier-card">
                                    <div class="icon-carier">
                                        <svg width="25" height="44" fill="currentColor" stroke="currentColor"
                                            xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
                                            <path
                                                d="M320 32c-8.1 0-16.1 1.4-23.7 4.1L15.8 137.4C6.3 140.9 0 149.9 0 160s6.3 19.1 15.8 22.6l57.9 20.9C57.3 229.3 48 259.8 48 291.9v28.1c0 28.4-10.8 57.7-22.3 80.8c-6.5 13-13.9 25.8-22.5 37.6C0 442.7-.9 448.3 .9 453.4s6 8.9 11.2 10.2l64 16c4.2 1.1 8.7 .3 12.4-2s6.3-6.1 7.1-10.4c8.6-42.8 4.3-81.2-2.1-108.7C90.3 344.3 86 329.8 80 316.5V291.9c0-30.2 10.2-58.7 27.9-81.5c12.9-15.5 29.6-28 49.2-35.7l157-61.7c8.2-3.2 17.5 .8 20.7 9s-.8 17.5-9 20.7l-157 61.7c-12.4 4.9-23.3 12.4-32.2 21.6l159.6 57.6c7.6 2.7 15.6 4.1 23.7 4.1s16.1-1.4 23.7-4.1L624.2 182.6c9.5-3.4 15.8-12.5 15.8-22.6s-6.3-19.1-15.8-22.6L343.7 36.1C336.1 33.4 328.1 32 320 32zM128 408c0 35.3 86 72 192 72s192-36.7 192-72L496.7 262.6 354.5 314c-11.1 4-22.8 6-34.5 6s-23.5-2-34.5-6L143.3 262.6 128 408z">
                                            </path>
                                        </svg>
                                    </div>
                                    <div class="ml-4 w-full">
                                        <div class="flex flex-col w-full pb-5">
                                            <h2 class="text-lg lg:text-xl font-semibold text-secondary">
                                                {{ $data['position'] }}
                                            </h2>
                                            <h2 class="text-base font-semibold text-primary">
                                                {{ $data['location'] }}
                                            </h2>
                                        </div>
                                        <p
                                            class="w-full text-sm lg:text-base text-gray-600 tracking-normal break-words">
                                            {{ $data['description'] }}
                                        </p>
                                        <div class="flex pt-5 items-center">
                                            <h6 class="text-sm lg:text-base text-dark">{{ $data['time'] }}</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

{{-- skill --}}

<section id="skill" class="py-32">
    <div class="container">
        <div class="flex flex-wrap items-center justify-center px-12 pb-14">
            <div class="mx-auto items-center w-full lg:w-1/2">
                <h2 class="text-responsive font-semibold
                    text-primary text-xl lg:text-2xl">
                    Technical and Programming Skill
                </h2>
                <h1 class="text-responsive font-bold text-secondary pt-[4px]
                    text-2xl lg:text-3xl">
                    What can I do for service clients you
                </h1>
            </div>
            <div class="mx-auto w-full lg:w-1/2 lg:pl-8">
                <h3 class="font-normal pt-5 text-base lg:text-lg text-justify tracking-normal hyphens-auto break-words">
                    Passionate Flutter and Laravel developer crafting seamless web and mobile experiences. Skilled in
                    building high-performance applications with elegant code and intuitive design, turning ideas into
                    powerful digital solutions.
                </h3>
            </div>
        </div>
        <div class="grid px-12 grid-cols-1 gap-8 md:grid-cols-2 xl:grid-cols-3">
            @foreach ($skill as $data)
                <div class="w-full h-full">
                    <div
                        class="skill-card bg-white shadow-lg rounded-2xl overflow-hidden transition-transform transform hover:-translate-y-2 hover:shadow-2xl p-6">
                        <div class="flex justify-center items-center relative w-24 h-24 mx-auto">
                            <span
                                class="flex items-center justify-center w-20 h-20 z-10 rounded-full shadow-lg bg-slate-100">
                                {!! $data['svg'] !!}
                            </span>
                        </div>
                        <h3 class="text-lg font-bold text-gray-800 text-center mt-6">
                            {{ $data['title'] }}
                        </h3>
                        <p class="text-sm text-gray-600 text-center break-words px-4 mt-2 leading-relaxed">
                            {{ $data['description'] }}
                        </p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
