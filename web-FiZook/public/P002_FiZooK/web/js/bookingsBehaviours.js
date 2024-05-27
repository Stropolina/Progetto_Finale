function buildBookingsTable(bookings) {
    const body = document.querySelector('#bookings-table-body');
    body.innerHTML = "";

    bookings.map(function (booking) {
        let tr = document.createElement('tr');

       tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${booking.Start}`));
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${booking.End}`));
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${booking.Class}`));
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${booking.Subject}`));
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${booking.Room}`));
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${booking.Activity}`));

        var linkId = `${booking.BookingId}`;
        var entity = JSON.stringify(booking);

        var aEdit = createLink(linkId, "modal-open-update text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'booking-dialog', 'booking-title', 'update', '');",
            `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                                    </svg>`);
        tr.appendChild(createLinkCell("whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6", aEdit));

        var aDelete = createLink(linkId, "modal-open text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'delete-booking-dialog', 'delete-booking-name', 'delete', 'id');",
            `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                    </svg>`)
        tr.appendChild(createLinkCell("whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6", aDelete));

        body.appendChild(tr);
    });

}

function buildBookingsMobile(bookings) {
    const body = document.querySelector('#bookings-mobile');
    body.innerHTML = "";

    bookings.map(function (booking) {
        let li = document.createElement('li');
        li.classList = "overflow-hidden rounded-xl border border-gray-200";

        let dl = createDescriptionList("-my-3 divide-y divide-gray-100 px-6 py-4 text-sm leading-6");

        let dtId = createTermList("rounded-xl py-1 px-2 text-xs font-medium ring-inset text-pink-700 bg-pink-50", `${booking.Id}`);
        
        var linkId = `${booking.BookingId}`;
        var entity = JSON.stringify(booking);

        let divActions = createDivision("flex items-center justify-center gap-x-2");
        let aEdit = createLink(linkId, "modal-open-update text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'dayoff-dialog', 'dayoff-title', 'update', '');", 
                                    `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                                    </svg>`);
        divActions.appendChild(aEdit);

        let aDelete = createLink(linkId, "modal-open text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'delete-dayoff-dialog', 'delete-dayoff-name', 'delete', 'name');", 
                                    `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                    </svg>`);
        divActions.appendChild(aDelete);
        
        let divId = createDivision("flex py-3 justify-between");
        divId.appendChild(dtId);
        divId.appendChild(divActions);
        dl.appendChild(divId);

        let start = `${booking.Start}`;
        let end = `${booking.End}`;
        let segmentsStart = start.split(' ');
        let segmentsEnd = end.split(' ');
        let date = parseFromJsonDate(segmentsStart[0]);
        let time = 'Dalle ' + segmentsStart[1] + ' alle ' + segmentsEnd[1];

        let dtDate = createTermList("text-sm text-gray-500", date);
        let divDate = createDivision("flex justify-between gap-x-4 py-3");
        divDate.appendChild(dtDate);

        let dtTime = createTermList("text-sm text-gray-500", time);
        let divTime = createDivision("flex justify-between gap-x-4 py-3");
        divTime.appendChild(dtTime);

        let subjectClass = `${booking.Subject}` + ' - ' + `${booking.Class}`;

        let dtSubjectClass = createTermList("text-sm text-gray-500", subjectClass);
        let divContent = createDivision("flex justify-between gap-x-4 py-3");
        divContent.appendChild(dtSubjectClass);

        let dtActivity = createTermList("text-sm text-gray-500", `${booking.Activity}`);
        let divActivity = createDivision("flex justify-between gap-x-4 py-3");
        divActivity.appendChild(dtActivity);

        let dtRoom = createTermList("text-sm text-gray-500", `${booking.Room}`);
        let divRoom = createDivision("flex justify-between gap-x-4 py-3");
        divRoom.appendChild(dtRoom);
        
        dl.appendChild(divDate);
        dl.appendChild(divTime);
        dl.appendChild(divContent);
        dl.appendChild(divActivity);
        dl.appendChild(divRoom);

        li.appendChild(dl);

        body.appendChild(li);
    });
}

async function getBookingsByUser(userId) {
    startStopSpinner();
    var client = new RestClient(baseUrl);

    try {
        const response = await client.get('/bookings/users/@userId', { userId: userId });
        bookings = response.result;

        if (window.screen.width >= 1024) {
            buildBookingsTable(bookings);
        } else {
            buildBookingsMobile(bookings);
        }

        dialogEventsRegistration("delete-booking-dialog", ".modal-open");
        dialogEventsRegistration("booking-dialog", ".modal-open-update");
    } catch (error) {
        console.error("Error fetching bookings:", error);
    }

    startStopSpinner();
}

async function prepareUpdate(item) {
    var client = new RestClient(baseUrl);

    const dateInput = document.getElementById('date');
    dateInput.value = item.Start != undefined ? parseFromJsonDate(item.Start) : "";

    startTime = item.Start.substring(11, 16);
    const startTimeInput = document.getElementById('start-time');
    startTimeInput.value = item.Start != undefined ? startTime : "";

    endTime = item.End.substring(11, 16);
    const endTimeInput = document.getElementById('end-time');
    endTimeInput.value = item.End != undefined ? endTime : "";

    try {
        const response = await client.get('/bookings/@id', { id: item.BookingId });
        booking = response.result;

        if (booking != undefined) {
            const idInput = document.getElementById('id-booking');
            idInput.value = booking.Id != undefined ? booking.Id : 0; 

            const classInput = document.getElementById('class');
            classInput.value = booking.ClassId != undefined ? booking.ClassId : "";

            const subjectInput = document.getElementById('subject');
            subjectInput.value = booking.SubjectId != undefined ? booking.SubjectId : "";

            const roomInput = document.getElementById('room');
            roomInput.value = booking.RoomId != undefined ? booking.RoomId : "";

            const activityInput = document.getElementById('activity');
            activityInput.value = booking.ActivityId != undefined ? booking.ActivityId : "";
        }
    } catch (error) {
        console.error("Error fetching booking:", error);
    }


}

function prepareForStore(userId) {
    let idInput = document.getElementById('id-booking');
    let dateInput = document.getElementById('date');
    let startTimeInput = document.getElementById('start-time');
    let endTimeInput = document.getElementById('end-time');
    let classInput = document.getElementById('class');
    let subjectInput = document.getElementById('subject');
    let roomInput = document.getElementById('room');
    let activityInput = document.getElementById('activity');

    if (validateInputs([idInput, dateInput, startTimeInput, endTimeInput, classInput, subjectInput, roomInput, activityInput])) {
        var booking = new Booking();
        var userBooking = new UserBooking();

        date = parseCustomDate(dateInput.value);
        start = date + " " + startTimeInput.value;
        end = date + " " + endTimeInput.value;

        booking.id = idInput.value.trim();
        booking.start = start;
        booking.end = end;
        booking.class = classInput.value.trim();
        booking.subject = subjectInput.value.trim();
        booking.room = roomInput.value.trim();
        booking.activity = activityInput.value.trim();

        userBooking.booking = booking;
        userBooking.userId = userId;
        userBooking.id = booking.id;

        persistItem(userBooking.id === 0 ? "/bookings/users" : "/bookings", "booking-dialog", userBooking.id === 0 ? userBooking : userBooking.booking, getBookingsByUser, userId);
    } else {
        window.alert("Dati obbligatori mancanti");
    }
}