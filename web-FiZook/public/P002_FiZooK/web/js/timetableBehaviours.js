function buildTimetablesTable(timetables) {
    const body = document.querySelector('#timetable-body');
    body.innerHTML = "";

    timetables.map(function (timetable) {

        let div = createDivision("flex flex-row p-4");

        let divTime = createDivision("basis-1/6 grid grid-rows-2 justify-start");

        let startTime = new Date(`${timetable.Start}`).toLocaleTimeString();
        let endTime = new Date(`${timetable.End}`).toLocaleTimeString();

        let divStart = createDivision("text-base text-gray-500");
        divStart.innerHTML = startTime;
        let divEnd = createDivision("text-base text-gray-500");
        divEnd.innerHTML = endTime;
        divTime.appendChild(divStart);
        divTime.appendChild(divEnd);

        let divSubject = createDivision("basis-2/3 text-lg text-gray-900 font-semibold justify-start");
        subject = `${timetable.Subject}`;
        divSubject.innerHTML =  (subject != "null" ? subject : "Nessuna lezione");

        let divRoomClass = createDivision("basis-1/6 justify-start");  

        let divRoom = createDivision("text-base text-gray-500");
        divRoom.innerHTML = subject != "null" ? `${timetable.Room}` : "";
        let divClass = createDivision("text-base text-gray-500");
        divClass.innerHTML = subject != "null" ? `${timetable.Class}` : "";

        divRoomClass.appendChild(divRoom);
        divRoomClass.appendChild(divClass);

        div.appendChild(divTime);
        div.appendChild(divSubject);
        div.appendChild(divRoomClass);

        body.appendChild(div);
    });
}

function buildTimetablesTableMobile(timetables) {
    const body = document.querySelector('#timetable-body-mobile');
    body.innerHTML = "";

    timetables.map(function (timetable) {
        let div = createDivision("grid grid-cols-2 justify-between p-4");

        let startTime = new Date(`${timetable.Start}`).toLocaleTimeString();
        let endTime = new Date(`${timetable.End}`).toLocaleTimeString();

        let divTime = createDivision("grid grid-rows-2");
        let pStart = createParagraph("text-sm text-gray-500",  startTime);
        let pEnd = createParagraph("text-sm text-gray-500",  endTime);
        divTime.appendChild(pStart);
        divTime.appendChild(pEnd);

        let subjectClass = `${timetable.Subject}` + " - " + `${timetable.Class}`;

        let divSubjectClassRoom = createDivision("grid grid-rows-2 justify-end");
        let pSubjectClass = createParagraph("text-sm text-gray-900 text-base font-semibold",  subjectClass);
        let pRoom = createParagraph("text-sm text-gray-500",  `${timetable.Room}`);
        divSubjectClassRoom.appendChild(pSubjectClass);
        divSubjectClassRoom.appendChild(pRoom);

        div.appendChild(divTime);
        div.appendChild(divSubjectClassRoom);

        body.appendChild(div);
    });
}


async function getTimetables() {
    startStopSpinner();
    var client = new RestClient(baseUrl);

        try { 
            var body;
            authBag = getSession('authBag');

            if (window.screen.width >= 1024) {
                body = document.getElementById("timetable-date").value;
            } else {
                body = document.getElementById("timetable-date-mobile").value;
            }
            
            var view = new Booking();
            var time = addTime(body);

            view.class = authBag.classes[0].Class;
            view.start = time[0];
            view.end = time[1];
            view.userType = authBag.user.UserType;
            view.userId = authBag.user.Id;

            const response = await client.post('/timetables', view);
            timetables = response.result;

            if (window.screen.width >= 1024) {
                buildTimetablesTable(timetables);
            } else {
                buildTimetablesTableMobile(timetables);
            }
        } catch (error) {
            console.error("Error fetching timetable: ", error);
        }

    startStopSpinner();
}