function buildProfile(profile) {
    const body = document.querySelector('#profile-details');
    body.innerHTML = "";

    let div = createDivision("mx-auto max-w-7xl px-6 text-center lg:px-8");

    let divContainer = createDivision("items-center w-full h-full");

    let fullName = profile.user.FirstName + " " + profile.user.LastName;

    let img = document.createElement('img');
    img.className = "mx-auto h-50 w-50 rounded-full";
    img.src = profile.user.Photo;
    let h3 = document.createElement('h3');
    h3.className = "mt-6 text-3xl font-semibold tracking-tight text-gray-900";
    h3.innerHTML = fullName;
    let pType = createParagraph("text-xl text-gray-600", profile.user.UserType);

    let currentClasses;
    for (let i = 0; i < profile.classes.length; i++) {
        currentClasses = profile.classes[i].Class + " ";
    }
    let pClass = createParagraph("text-lg text-gray-600",  currentClasses);
    
    divContainer.appendChild(img);
    divContainer.appendChild(h3);
    divContainer.appendChild(pType);
    divContainer.appendChild(pClass);

    div.appendChild(divContainer);

    body.appendChild(div);
}

/* function buoldSubjectsTableForStudent(subjects) {
}

function buoldSubjectsTableForTeacher(elements) {
    const body = document.querySelector('#proile-table');
    body.innerHTML = "";

    elements.map(function (element) {
        let li = document.createElement('li');
        li.className = "col-span-1 flex rounded-md shadow-sm";

        let divClass = createDivision("border border-gray-200 flex w-16 flex-shrink-0 items-center justify-center rounded-l-md text-base font-medium text-gray-900");
        divClass.innerHTML = element.ClassName;
    });
} */


async function getProfile() {
    startStopSpinner();
    var authBag = getSession('authBag');
    /* var client = new RestClient(baseUrl); */

    try { 
        /* userId = authBag.user.Id;
        const response = await client.get('/subjects/user', userId);
        subjects = response.result;

        if (authBag.user.UserType == "Student") {
            buoldSubjectsTableForStudent(subjects)
        } else {
            buoldSubjectsTableForTeacher(subjects)
        } */

        buildProfile(authBag);
    } catch (error) {
        console.error("Error fetching profile: ", error);
    }

    startStopSpinner();
}