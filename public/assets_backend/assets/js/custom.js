function check_discount(value){
    if(value){
        $('.discount-type').removeClass('hidden');
    } else {
        $('.discount-type').addClass('hidden');
    }
}

function addCat() {
    $('section#add-category').removeClass('hidden');
}
function removeAddCat(event) {
    event.preventDefault();
    $('section#add-category').addClass('hidden');
}



