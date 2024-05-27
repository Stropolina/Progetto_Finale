function acceptCookies(elementId) {
    const banner = document.getElementById(elementId);
    banner.classList.add('hidden');

    setCookie('userAcceptedCookies', 'true', 182);
}
 
function setCookie(name, value, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + value + ";" + expires + ";path=/";
}
 
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) === ' ') c = c.substring(1);
        if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}
 
function checkCookie(elementId) {
    var user = getCookie('userAcceptedCookies');
    if (user !== "true") {
        const banner = document.getElementById(elementId);
        banner.classList.remove('hidden');
    }
}

function declineCookies(elementId, link) {
    closeDialog(elementId);
    window.location.replace(link);
}