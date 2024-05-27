function buildResults(body, results, title) {

    let liResults = createElement('li', "py-4");
    
    let h2 = createElement('h2', "text-base font-medium text-gray-500");
    h2.innerHTML = title;

    liResults.appendChild(h2);

    let ul = createElement('ul', "mt-3 grid grid-cols-1 gap-5 sm:grid-cols-2 sm:gap-6 lg:grid-cols-4");
    ul.setAttribute('role', "list");

    results.map(function (result) {
        let liItem = createElement('li', "col-span-1 flex rounded-md shadow-sm");
        
        let a = createElement('a', "modal-open h-full flex w-16 flex-shrink-0 items-center justify-center bg-pink-600 rounded-l-md text-sm font-medium text-white");
        a.href = 'javascript:find(' + result.Key + ', "' + title + '")';

        let div = createDivision("h-full flex w-16 flex-shrink-0 items-center justify-center bg-pink-600 rounded-l-md text-sm font-medium text-white");
        
        switch (title) {
            case 'Studenti':
                div.innerHTML = '<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z" /></svg>';
                break;
        
            case 'Insegnanti':
                div.innerHTML = '<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" d="M4.26 10.147a60.438 60.438 0 0 0-.491 6.347A48.62 48.62 0 0 1 12 20.904a48.62 48.62 0 0 1 8.232-4.41 60.46 60.46 0 0 0-.491-6.347m-15.482 0a50.636 50.636 0 0 0-2.658-.813A59.906 59.906 0 0 1 12 3.493a59.903 59.903 0 0 1 10.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.717 50.717 0 0 1 12 13.489a50.702 50.702 0 0 1 7.74-3.342M6.75 15a.75.75 0 1 0 0-1.5.75.75 0 0 0 0 1.5Zm0 0v-3.675A55.378 55.378 0 0 1 12 8.443m-7.007 11.55A5.981 5.981 0 0 0 6.75 15.75v-1.5" /></svg>';
                break;

            case 'Classi':
                div.innerHTML = '<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-4.682-2.72m.94 3.198.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0 1 12 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 0 1 6 18.719m12 0a5.971 5.971 0 0 0-.941-3.197m0 0A5.995 5.995 0 0 0 12 12.75a5.995 5.995 0 0 0-5.058 2.772m0 0a3 3 0 0 0-4.681 2.72 8.986 8.986 0 0 0 3.74.477m.94-3.197a5.971 5.971 0 0 0-.94 3.197M15 6.75a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 3a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Zm-13.5 0a2.25 2.25 0 1 1-4.5 0 2.25 2.25 0 0 1 4.5 0Z" /></svg>';
                break;
        }

        a.appendChild(div);

        let divContainer = createDivision("flex flex-1 items-center justify-between truncate rounded-r-md border-b border-r border-t border-gray-200 bg-white");
        let divNameTitle = createDivision("flex-1 truncate px-4 py-2 text-sm");

        let pName = createElement('p', "font-medium text-gray-900 hover:text-gray-600");
        pName.innerHTML = result.Value;
        
        let pTitle = createElement('p', "text-gray-500");
        pTitle.innerHTML = title;

        divNameTitle.appendChild(pName);
        divNameTitle.appendChild(pTitle);

        divContainer.appendChild(divNameTitle);

        liItem.appendChild(a);
        liItem.appendChild(divContainer);
        
        ul.appendChild(liItem);
    });

    liResults.appendChild(ul);

    body.appendChild(liResults);
}

async function find(entityId, type) {
    try {
        var client = new RestClient(baseUrl);
        let dateTime = getIsoDateTime();
        

        switch (type) {
            case "Studenti":
                const studentResponse = await client.get('/bookings/student/@userId/@currentDate', {userId: entityId, currentDate: dateTime});
                const student = studentResponse.result;
                setSession("currentItem", student);
                prepareResult(student);
                break;
            case "Insegnanti":
                const teacherResponse = await client.get('/bookings/teacher/@userId/@currentDate', {userId: entityId, currentDate: dateTime});
                const teacher = teacherResponse.result;
                setSession("currentItem", teacher);
                prepareResult(teacher);
            break;
            case "Classi":
                const classResponse = await client.get('/bookings/class/@classId/@currentDate', {classId: entityId, currentDate: dateTime});
                const classroom = classResponse.result;
                setSession("currentItem", classroom);
                prepareResult(classroom);
                break;
            
        }
    } catch (error) {
        console.error("Error fetching specific item:", error);
    }
}

function prepareResult(item) {
    const who = document.getElementById('who');
    who.innerText = item.Who != undefined ? item.Who : ""; 

    const where = document.getElementById('where');
    where.innerText = item.Where != undefined ? item.Where : "Non è presente"; 

    const what = document.getElementById('what');
    what.innerText = item.What != undefined ? item.What : "";
}