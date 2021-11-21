
// get banner

var bannerElement = document.getElementById('banner');

var myArrayBanner = [
    'url("~/Content/Images/211001_BANNER_WEB_30SHINE_w.jpg")',
    'url("~/Content/Images/210814_Banner_an_toan_w.jpg")',
    'url("~/Content/Images/210814_Banner_SC_10_BC_w.jpg")'
]
var i = 0;
function showSlide() {
    bannerElement.style.backgroundImage = myArrayBanner[i];
    i++;
    if(i >= myArrayBanner.length) i = 0;
}
setInterval(showSlide, 3000)

function clickNextSlide() {
    showSlide();
}

// show model login

var loginElement = document.getElementById('btn-login');
var modelElement = document.getElementById('model')
loginElement.addEventListener('click', function() {
    modelElement.classList.add('block-display');
});

// close model 
var closeModelElement = document.getElementById('model-close');
closeModelElement.addEventListener('click', function() {
    modelElement.classList.remove('block-display');
})

// close menu
var openMenuElement = document.getElementById('open-menu-mobile');
var closeMenuElement = document.getElementById('close-menu-mobile');
var menuDownElement = document.getElementById('menu-down');
openMenuElement.addEventListener('click', function() {
    menuDownElement.style.display = 'block';
});
closeMenuElement.addEventListener('click', function() {
    menuDownElement.style.display = 'none';
});
