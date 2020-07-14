var search = document.getElementById("search");
var listHint = document.getElementById("listHint");
var selectHint = document.getElementById("selectHint");

const keystorage ="todoLiss";

search.addEventListener("focus", searchFocus);
search.addEventListener("focusout", onClear);
search.addEventListener("keyup", timkiem);
search.addEventListener("keydown", onPress);


function searchFocus() {
    const datalist = JSON.parse(localStorage.getItem(keystorage));
    if (datalist != null) {
        const html = datalist.map(res=> {
            return `<button id="selectHint" onclick="chonsp('${res}')" type="button" style="display: block; color: #000000; width: 100%; text-align: start; font-weight: 300">${res}</button>`
        }).join('');
        listHint.innerHTML = html;
    }
}

function timkiem() {
    if (search.value.trim() === "") {
        searchFocus();
    } else {
        sendHttpRequest('Get', `http://localhost:64168/api/PostApi?query=${search.value}`).then(resJson=> {
            const data = JSON.parse(resJson);
            const html = data.map(res=> {
                return `<button id="selectHint" onclick="chonsp('${res}')" type="button" style="display: block; color: #000000; width: 100%; text-align: start; font-weight: 300">${res}</button>`
            }).join('');
            listHint.innerHTML = html;
        });
    }
}

function onPress(e) {
    if (e.keyCode == 13) {
        if (search.value.trim() !== "") {
            var data = JSON.parse(localStorage.getItem(keystorage));
            var list = [];
            if (data != null) {
                list = data;
            }
            if (list.indexOf(search.value)=== -1) {
                list.push(search.value)
                localStorage.setItem(keystorage, JSON.stringify(list));
            }
        }
    }
}

function sendHttpRequest(method, url, data) {
    const promise = new Promise((res, rej) =>{
        const xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.onload = () => {
            res(xhr.response)
        }

        xhr.onerror = function(){
            rej("Có gì đó bị sai!");
        }

        if (data) {
            xhr.setRequestHeader('Content-Type', 'application/json');
        }

        xhr.send(JSON.stringify(data));
    })
    return promise;
}

function chonsp(value) {
    search.value = value;
    timkiem();
    search.focus();
};

function onClear() {
    setTimeout(() => {
        listHint.innerHTML = "";
    }, 80)
}
