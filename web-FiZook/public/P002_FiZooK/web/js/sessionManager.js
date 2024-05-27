// Store value in Session
function setSession(key, value) {
    localStorage.setItem(key, JSON.stringify(value));
}

// Get value from Session by key
function getSession(key) {
return JSON.parse(localStorage.getItem(key));
}

// Remove key from Session 
function removeSession(key) {
    localStorage.removeItem(key);
}

// Clear Session
function clearSession() {
    localStorage.clear();
}

