document.addEventListener("DOMContentLoaded", function(event) { 
    if (window.location.href.indexOf("license") > -1) {
        document.getElementsByTagName('option')[3].setAttribute('selected','selected');
    }
    if (window.location.href.indexOf("partnership") > -1) {
        document.getElementsByTagName('option')[1].setAttribute('selected','selected');
    }
});
