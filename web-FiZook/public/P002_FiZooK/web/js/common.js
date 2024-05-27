const baseUrl = window.location.origin + "/P002_FiZook/services";

function checkAuthentication(url) {
    if (getSession("authBag")) {
        var authBag = getSession("authBag");
        if (!authBag.isAuthenticated) {
            window.location.replace(url);
        } else {
            const currentUserName = document.getElementById('currentUserName');

            if (currentUserName) {
                const fullName = authBag.user.FirstName + " " + authBag.user.LastName;
                currentUserName.innerText = fullName;
            }

            const currentUserPicture = document.getElementById('currentUserPicture');

            if (currentUserPicture) {
                let image = document.createElement('img');
                image.className = "h-8 w-8 rounded-full bg-gray-50";
                image.src = authBag.user.Photo;
                currentUserPicture.appendChild(image);
            }

        }
    } else {
        window.location.replace(url);
    }
}

function setCurrentUserPicture(picture) {
    const currentUserPicture = document.getElementById('currentUserPicture');

    if (currentUserPicture) {
        let image = document.createElement('img');
        image.className = "h-8 w-8 rounded-full bg-gray-50";
        image.src = picture;
        currentUserPicture.appendChild(image);
    }
}

function logout() {
    clearSession();
    location.reload();
}

function dialogEventsRegistration(elementId, selector) {
    const dialog = document.getElementById(elementId);
    const links = document.querySelectorAll(selector);

    links.forEach(link => {
        link.addEventListener('click', function (event) {
            dialog.classList.toggle('hidden');
        });
    });
}

function startDialog(item, dialogId, elementId, actionType, propertyList) {
    let dialog = document.getElementById(dialogId);

    if (dialog) {
        dialog.classList.toggle('hidden');

        openDialog(item, dialogId, elementId, actionType, propertyList);
    }
}

async function openDialog(item, dialogId, elementId, actionType, propertyList) {
    try {
        if (item) {
            setSession("currentItem", item);

            var content = "";

            switch (actionType) {
                case 'create':
                    prepareUpdate(item);
                    content = "Aggiungi";
                    break;
                case 'update':
                    prepareUpdate(item);
                    content = "Modifica";
                    break;
                case 'delete':
                    var segments = propertyList.split('-');

                    for (let index = 0; index < segments.length; index++) {
                        var property = item[toPascalCase(segments[index])];
                        content += property + " ";
                    }
                    break;
                default:
                    break;
            }

            document.getElementById(elementId).innerHTML = content;
        } else {
            closeDialog(dialogId);
        }
    } catch (error) {
        closeDialog(dialogId)
        console.error("Error fetching item:", error);
    }
}

function closeDialog(elementId) {
    removeSession("currentItem");
    const dialog = document.getElementById(elementId);
    dialog.classList.toggle('hidden');
}

async function deleteItem(path, elementId, callback, parameter = undefined) {
    var id = getSession('currentItem').Id;
    if (id) {
        var client = new RestClient(baseUrl);

        try {
            const response = await client.delete(path + "/" + id);

            if (response.hasError == false) {
                closeDialog(elementId);
                if (parameter != undefined) {
                    callback(parameter);
                } else {
                    callback();
                }
            }
        } catch (error) {
            console.error("Eliminazione non effettuata: ", error);
        }
    }
}

function toPascalCase(value) {
    return (value.match(/[a-zA-Z0-9]+/g) || []).map(w => `${w.charAt(0).toUpperCase()}${w.slice(1)}`).join('');
}

async function persistItem(path, elementId, item, callback, parameter = undefined){
    if (item) {
        var client = new RestClient(baseUrl);

        try {
            var action = "update";
            if (item.id == 0)
                action = "create";

            const response = action == "create" ? await client.post(path, item) : await client.put(path, item);

            if (response.hasError == false) {
                closeDialog(elementId);
                if (parameter != undefined) {
                    callback(parameter);
                } else {
                    callback();
                }
            }
        } catch (error) {
            console.error("Azione non effettuata:", error);
        }
    }
}

function validateInput(element) {
    if (!element) {
        return false;
    }

    if (element.value == undefined) {
        return false;
    }

    if (element.value.trim() == "") {
        return false;
    }

    return true;
}

function validateInputs(elements) {
    if (elements.length > 0) {
        for (let index = 0; index < elements.length; index++) {
            const element = elements[index];
            
            if (!validateInput(element)) {
                return false;
            }
        };

        return true;
    }

    return false;
}

function startStopSpinner() {
    let spinner = document.getElementById("spinner-container");

    if (spinner) {
        spinner.classList.toggle('hidden');
    }
}

function parseCustomDate(value) {
    let segments = value.split("/");

    return segments[2] + "-" + segments [1] + "-" + segments[0];
}

function addTime(value) {
    let date = parseCustomDate(value);
    let time = new Array();
    
    let start = date + " 00:00:00";
    let end = date + " 23:59:59";

    time[0] = start;
    time[1] = end;

    return time;
}

function parseFromJsonDate(value) {
    let element = value.substring(0, 10);
    let segments = element.split("-")

    return segments[2] + "/" + segments[1] + "/" + segments[0];
}

function checkPermission() {
    let authBag = getSession('authBag');
    let permissions = authBag?.permissions;
    let elements = document.querySelectorAll("[data-permission]");

    elements.forEach(element => {
        let permission = element.getAttribute("data-permission");
        if (!permissions.includes(permission)) {
            element.classList.add('hidden');
        }
    });
}

function checkPagePermission(permission, path) {
    let authBag = getSession('authBag');
    let permissions = authBag?.permissions;

    if (!permissions.includes(permission)) {
        window.location.replace(path);
    }
}

function search(element, path) {
    searchBar = document.getElementById(element);
    setSession('searchFilter', searchBar.value);
    window.location.replace(path);
}

function getIsoDateTime() {
    let localDateTime = new Date().toLocaleString();
    let segments = localDateTime.split(',');
    let isoDateTime = parseCustomDate(segments[0]) + segments[1];

    return isoDateTime;
}