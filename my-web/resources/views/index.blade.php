<!DOCTYPE html>
<html lang="en" class="scroll-smooth">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100..900;1,100..900&family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
        rel="stylesheet">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0&icon_names=downloading,settings_heart" />
    @vite('resources/css/app.css')
</head>

<body>
    {{-- start Header --}}
    <header class="bg-transparent w-full h-[74px] absolute top-0 left-0 z-20">
        <div class="container relative">
            <div class="flex items-center justify-between relative flex-grow">
                <div class="py-6 px-4">
                    <a href="#"
                        class="block text-3xl lg:text-4xl text-primary italic font-extrabold font-merriweather">
                        Alf
                    </a>
                </div>

                <div class="flex items-center px-4">
                    <div class="hidden lg:block">
                        <nav id="show-menu" class="">
                            <ul class="relative lg:flex lg:items-center font-">
                                <li class="group">
                                    <a href="#home" class="navbar-items show-navbar-text">
                                        Home
                                    </a>
                                </li>
                                <li class="group">
                                    <a href="#about" class="navbar-items show-navbar-text">
                                        About
                                    </a>
                                </li>
                                <li class="group">
                                    <a href="#experience" class="navbar-items show-navbar-text">
                                        Experience
                                    </a>
                                </li>
                                <li class="group">
                                    <a href="#portfolio" class="navbar-items show-navbar-text">
                                        Portfolio
                                    </a>
                                </li>
                                <li class="group">
                                    <a href="#contact" class="navbar-items show-navbar-text">
                                        Contact
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <button id="menu" name="menu" type="button"
                        class="block absolute right-4 self-center lg:hidden">
                        <span class="menu-item duration-300 origin-top-left ease-in-out"></span>
                        <span class="menu-item"></span>
                        <span class="menu-item duration-300 origin-bottom-left ease-in-out"></span>
                    </button>
                    <nav id="nav-menu"
                        class="hidden absolute py-4 bg-white shadow-lg rounded-lg max-w-[250px]
                         w-full right-4 -mt-6 top-full">
                        <ul class="relative lg:flex lg:items-center">
                            <li class="group">
                                <a href="#home" class="navbar-items">
                                    Home
                                </a>
                            </li>
                            <li class="group">
                                <a href="#about" class="navbar-items">
                                    About
                                </a>
                            </li>
                            <li class="group">
                                <a href="#experience" class="navbar-items">
                                    Experience
                                </a>
                            </li>
                            <li class="group">
                                <a href="#portfolio" class="navbar-items">
                                    Portfolio
                                </a>
                            </li>
                            <li class="group">
                                <a href="#contact" class="navbar-items">
                                    Contact
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    {{-- end Header --}}

    <div class="fixed bottom-5 right-5 cursor-pointer">
        <a href="#" class="text-xl">🢁</a>
    </div>

    @include('section.home_section')
    @include('section.about_section')
    @include('section.experience_section')
    @include('section.contact_section')

    <footer class="py-14 px-[30px]">
        <div class="container mx-auto">
            <div class="grid grid-cols-1 md:grid-cols-2">
                <p class="flex items-center flex-wrap text-base lg:text-lg font-merriweather">
                    Developed with
                    <span class="px-1 material-symbols-outlined text-secondary text-lg lg:text-xl">
                        settings_heart
                    </span>
                    By
                    <span class="px-1 italic font-semibold text-primary text-lg lg:text-xl">
                        Alf
                    </span>
                    © 2025
                </p>
            </div>
        </div>
    </footer>

    @vite('resources/js/home.js')
</body>

</html>
