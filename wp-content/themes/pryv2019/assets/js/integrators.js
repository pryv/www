
var toggle = function (elem) {
	elem.classList.toggle("show_desc");
};

var toggleText = function (elem) {
    if(elem.innerHTML == 'Hide description'){
        elem.innerHTML = 'See description';
    }
    else{
        elem.innerHTML = 'Hide description';
    }
};

// Listen for click events
document.addEventListener('click', function (event) {

	// Make sure clicked element is our toggle
	if (!event.target.classList.contains('description_toggle')) return;

	// Prevent default link behavior
	event.preventDefault();

	// // Get the content
	// var content = document.querySelector(event.target.hash);
	// if (!content) return;

	// Toggle the content
    toggle(event.target.previousElementSibling);
    toggleText(event.target);    

}, false);