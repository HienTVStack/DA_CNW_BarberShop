function toast({title= '', message = '', type = 'Info', duration = 3000}) {
    const main = document.getElementById('toast');
    if (main) {
        const toast = document.createElement('div');
        //auto remove toast
        const autoRemoveId = setTimeout(function() {
            main.removeChild(toast);
        }, duration + 1000); 
        //remove toast click
        toast.onclick = function(e){
            if(e.target.closest('.toast__close')) {
                main.removeChild(toast);
                clearTimeout(autoRemoveId);
            }
        }
        const icons = {
            success: 'fa fa-check',
            warning: 'fa fa-engine-warning',
            error: 'fa fa-exclamation-triangle'
        };
        const icon = icons[type];
        const delay = (duration / 1000).toFixed(2);
        toast.classList.add('toast', `toast--${type}`);
        toast.style.animation = `slideInLeft ease 0.3s, fadeOut linear 1s ${delay}s forwards`

        toast.innerHTML = `
             <div class="toast__icon">
                <i class="${icon}"></i>
            </div>
            <div class="toast__body">
                <h3 class="toast__title">${title}</h3>
                <p class="toast__msg">${message}</p>
            </div>
            <div class="toast__close">
                 <i class="fa fa-times" aria-hidden="true"></i>
            </div>
        `;
        main.appendChild(toast);

        
    }
}
// toast({
//     title: "Success",
//     message: "Lorem ipsum dolor sit amet consectetur adipisicing elit",
//     type: "warning",
//     duration: 3000
//    })
function showSuccessToast() {
    toast({
    title: "Thành công",
    message: "Bạn đã đăng kí thành công",
    type: "success",
    duration: 1000
})
}
function showErrorToast() {
         toast({
    title: "Thất bại",
    message: "Bạn chưa đăng kí thành công",
    type: "error",
    duration: 3000
})      
}
function showNullInputNumberPhone() {
    toast({
        title: "Chú ý",
        message: "Bạn vui lòng nhập số diện thoại",
        type: "error",
        duration: 3000
    })
}

// var loginElement = document.getElementById('btn-login');
// var modelElement = document.getElementById('model')
// loginElement.addEventListener('click', showSuccessToast
// );

var btnBannerElement = document.getElementById('banner-model__btn');
var btnBannerElement_mobile = document.getElementById('banner-model__btn-mobile');

var getTxtInputPhone = document.getElementById('txtInputPhone');
btnBannerElement.addEventListener('click',function() {
    if(getTxtInputPhone.value === "") 
        showNullInputNumberPhone();
    else {
        showSuccessToast();
    }
});
btnBannerElement_mobile.addEventListener('click', function() {
    if(getTxtInputPhone.value === "") 
        showNullInputNumberPhone();
    else {
        showSuccessToast();
    }
})
