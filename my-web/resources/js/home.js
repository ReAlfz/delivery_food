const menu = document.querySelector('#menu');
const navMenu = document.querySelector('#nav-menu');

menu.addEventListener('click', function() {
    menu.classList.toggle('menu-active');
    navMenu.classList.toggle('hidden')
});


window.onscroll = function () {
    const header = document.querySelector('header')
    const fixNav = header.offsetTop;

    if (window.pageYOffset > fixNav) {
        header.classList.add('navbar-fixed');
    } else {
        header.classList.remove('navbar-fixed');
    }
}