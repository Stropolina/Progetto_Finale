function createCell(classes, content) {
    let td = document.createElement('td');
    td.className = classes;
    td.innerHTML = content;

    return td;
}

function createLink(id, classes, link, content) {
    let a = document.createElement('a');
    a.id = id;
    a.className = classes;
    a.href = link;
    a.innerHTML = content;

    return a;
}

function createLinkCell(classes, linkElement) {
    let td = document.createElement('td');
    td.className = classes;

    td.appendChild(linkElement);

    return td;
}

function createDescriptionList(classes) {
    let dl = document.createElement('dl');
    dl.className = classes;

    return dl;
}

function createDivision(classes) {
    let div = document.createElement('div');
    div.className = classes;

    return div;
}

function createTermList(classes, content) {
    let dt = document.createElement('dt');
    dt.className = classes;
    dt.innerHTML = content;

    return dt;
}

function createParagraph(classes, content) {
    let p = document.createElement('p');
    p.className = classes;
    p.innerHTML = content;

    return p;
}

function createElement(tag, classes) {
    let element = document.createElement(tag);
    element.className = classes;

    return element;
}