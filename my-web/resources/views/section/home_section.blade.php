 {{-- start Home Section --}}
 <section id="home" class="h-[90dvh] pt-36">
     <div class="container">
         <div class="flex flex-wrap pt-16">
             {{-- Image Profile --}}
             <div class="relative mx-auto lg:w-1/2">
                 <img src="{{ asset('images/profile.png') }}" alt="Alfian rudiyanto"
                     class="max-w-full mx-auto responsive-scale">
                 <span
                     class="absolute bottom-4 left-[0%] lg:left-[10%] xl:left-[20%] 2xl:left-[25%] animate-slowbounce rounded-xl border-[1px] border-primary overflow-hidden w-16 h-16">
                     <img src="{{ asset('images/laravel.png') }}" class="object-cover w-full h-full">
                 </span>
                 <span
                     class="absolute top-[30%] right-[10%] lg:right-[20%] xl:right-[25%] 2xl:right-[30%] animate-slowbounce rounded-xl border-[1px] border-primary overflow-hidden w-16 h-16 bg-white">
                     <img src="{{ asset('images/flutter.png') }}" class="object-cover w-full h-full p-1.5">
                 </span>
             </div>

             {{-- Info Profile --}}
             <div class="mx-auto self-center pt-4 md:pt-6 lg:pt-8 px-4 lg:w-1/2">
                 <h2 class="text-responsive text-xl lg:text-2xl italic text-primary font-semibold pb-2">
                     Hello I'm
                 </h2>
                 <h1 class="text-responsive font-bold text-5xl lg:leading-[1.1] lg:text-7xl pb-4 lg:pb-6">
                     Alfian Rudiyanto
                 </h1>
                 <h3 class="text-responsive text-xl lg:text-2xl lg:pb-1">
                     Flutter and Laravel Developer
                 </h3>
                 <h3 class="text-responsive font-thin italic lg:text-xl lg:pb-4">
                     Experience is the name everyone gives to their
                     mistakes
                 </h3>
                 <div class="flex items-center justify-center lg:justify-start pt-4">
                     <a href=""
                         class="inline-flex items-center gap-2 border-[1.5px] border-primary rounded-full px-4 py-1.5 primary-color-hover font-bold lg:text-xl">
                         <span class="material-symbols-outlined block">
                             downloading
                         </span>
                         <span class="my-auto block">Resume</span>
                     </a>
                 </div>

             </div>
         </div>
     </div>
 </section>

 {{-- end Home Section --}}
