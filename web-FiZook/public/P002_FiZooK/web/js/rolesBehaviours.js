function buildRolesTable(roles) {
    const body = document.querySelector('#roles-table-body');
    body.innerHTML = "";

    roles.map(function (role) {
        let tr = document.createElement('tr');
        
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${role.Id}`));
        tr.appendChild(createCell("whitespace-nowrap px-6 py-4 text-sm text-gray-500", `${role.Name}`));

        var linkId = `${role.Id}`;
        var entity = JSON.stringify(role);

        var aEdit = createLink(linkId, "modal-open-update text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'role-dialog', 'role-title', 'update', '');", 
                                    `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                                    </svg>`);
        tr.appendChild(createLinkCell("whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6", aEdit));

        var aDelete = createLink(linkId, "modal-open text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'delete-role-dialog', 'delete-role-name', 'delete', 'name');", 
                                    `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                    </svg>`)
        tr.appendChild(createLinkCell("whitespace-nowrap py-4 pl-3 pr-4 text-right text-sm font-medium sm:pr-6", aDelete));

        body.appendChild(tr);
    });

}

function buildRolesGridList(roles) {
    const body = document.querySelector('#roles-grid-list');
    body.innerHTML = "";

    roles.map(function (role) {
        let li = document.createElement('li');
        li.classList = "overflow-hidden rounded-xl border border-gray-200";

        let dl = createDescriptionList("-my-3 divide-y divide-gray-100 px-6 py-4 text-sm leading-6");

        let dtId = createTermList("rounded-xl py-1 px-2 text-xs font-medium ring-inset text-pink-700 bg-pink-50", `${role.Id}`);
        
        var linkId = `${role.Id}`;
        var entity = JSON.stringify(role);

        let divActions = createDivision("flex items-center justify-center gap-x-2");
        let aEdit = createLink(linkId, "modal-open-update text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'role-dialog', 'role-title', 'update', '');", 
                                    `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125" />
                                    </svg>`);
        divActions.appendChild(aEdit);

        let aDelete = createLink(linkId, "modal-open text-pink-600 hover:text-pink-500", "javascript:openDialog(" + entity + ", 'delete-role-dialog', 'delete-role-name', 'delete', 'name');", 
                                    `<svg fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                                    </svg>`);
        divActions.appendChild(aDelete);
        
        let divId = createDivision("flex py-3 justify-between");
        divId.appendChild(dtId);
        divId.appendChild(divActions);
        dl.appendChild(divId);

        let dtName = createTermList("text-sm text-gray-500", `${role.Name}`);
        let divContent = createDivision("flex justify-between gap-x-4 py-3");
        divContent.appendChild(dtName);
        dl.appendChild(divContent);

        li.appendChild(dl);

        body.appendChild(li);
    });
}

async function getRoles() {
    startStopSpinner();
    var client = new RestClient(baseUrl);

        try { 
            const rolesTable = document.querySelector('#roles-table');
            const response = await client.get('/roles');
            roles = response.result;

            if (window.screen.width >= 1024) {
                buildRolesTable(roles);
            } else {
                buildRolesGridList(roles);
            }

            dialogEventsRegistration("delete-role-dialog", ".modal-open");
            dialogEventsRegistration("role-dialog", ".modal-open-update");
        } catch (error) {
            console.error("Error fetching roles:", error);
        }

    startStopSpinner();
}

function prepareUpdate(item) {
    const idInput = document.getElementById('id-role');
    idInput.value = item.Id != undefined ? item.Id : 0; 

    const nameInput = document.getElementById('name-role');
    nameInput.value = item.Name != undefined ? item.Name : ""; 
}

function prepareForStore() {
    let nameInput = document.getElementById('name-role');
    let idInput = document.getElementById('id-role');

    if (validateInput(nameInput)) {
        var role = new Role();

        role.name = nameInput.value.trim();
        role.id = idInput.value.trim();

        persistItem("/roles", "role-dialog", role, getRoles);
    } else {
        window.alert("Dati obbligatori mancanti");
    }
}