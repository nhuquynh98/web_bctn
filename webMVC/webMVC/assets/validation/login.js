var emailDangnhap = document.getElementById("emailDangnhap");
var matkhaudangnhap = document.getElementById("matkhaudangnhap");
var buttondangnhap = document.getElementById("buttondangnhap");
var loiemaildangnhap = document.getElementById("loiemaildangnhap");
var loimatkhaudangnhap = document.getElementById("loimatkhaudangnhap");


buttondangnhap.addEventListener("click", function () {
    var validate = true;
    if (kiemtraemaildangnhap()==false) {
        validate = false
    }
    if (kiemtramatkhaudangnhap() == false) {
        validate = false
    }
    if (validate == true) {
        buttondangnhap.type = "submit";
    }
});

function kiemtraemaildangnhap() {
    loiemaildangnhap.innerHTML = "";
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (emailDangnhap.value.length <= 0) {
        loiemaildangnhap.innerHTML = "Bạn chưa nhập email!";
        return false;
    } else if (!filter.test(emailDangnhap.value)) {
        loiemaildangnhap.innerHTML = "email không hợp lệ!";
        return false;
    }
    return true;
}

function kiemtramatkhaudangnhap() {
    loimatkhaudangnhap.innerHTML = "";
    if (matkhaudangnhap.value.length <= 0) {
        loimatkhaudangnhap.innerHTML = "Bạn chưa nhập mật khẩu!";
        return false;
    }
    return true;
}

var tendangky = document.getElementById("tendangky");
var hodangky = document.getElementById("hodangky")
var ngaysinhdangky = document.getElementById("ngaysinhdangky");
var sdtdangky = document.getElementById("sdtdangky");
var emaildangky = document.getElementById("emaildangky");


var matkhaudangky = document.getElementById("matkhaudangky");
var buttondangky = document.getElementById("buttondangky");

var loitendangky = document.getElementById("loitendangky");
var loihodangky = document.getElementById("loihodangky");
var loingaysinhdangky = document.getElementById("loingaysinhdangky");
var loisdtdangky = document.getElementById("loisdtdangky");
var loiemaildangky = document.getElementById("loiemaildangky");
var loimatkhaudangky = document.getElementById("loimatkhaudangky");


buttondangky.addEventListener("click", function () {
    var validate = true;
    if (kiemtratendangky() == false) {
        validate = false
    }
    if (kiemtrahodangky() == false) {
        validate = false
    }
    if (kiemtrangaysinhdangky() == false) {
        validate = false
    }
    if (kiemtrasdtdangky() == false) {
        validate = false
    }
    if (kiemtraemaildangky() == false) {
        validate = false
    }
    if (kiemtramatkhaudangky() == false) {
        validate = false
    }
    if (validate == true) {
        buttondangky.type = "submit";
    }
});

function kiemtratendangky() {
    loitendangky.innerHTML = "";
    if (tendangky.value.length <= 0) {
        loitendangky.innerHTML = "Bạn chưa nhập tên!";
        return false;
    }
    return true;
}

function kiemtrahodangky() {
    loihodangky.innerHTML = "";
    if (hodangky.value.length <= 0) {
        loihodangky.innerHTML = "Bạn chưa nhập họ!";
        return false;
    }
    return true;
}

function kiemtrangaysinhdangky() {
    loingaysinhdangky.innerHTML = "";
    if (ngaysinhdangky.value.length <= 0) {
        loingaysinhdangky.innerHTML = "Bạn chưa nhập ngày sinh!";
        return false;
    }
    return true;
}

function kiemtrasdtdangky() {
    loisdtdangky.innerHTML = "";
    if (sdtdangky.value.length <= 0) {
        loisdtdangky.innerHTML = "Bạn chưa nhập số điện thoại!";
        return false;
    }
    return true;
}

function kiemtraemaildangky() {
    loiemaildangky.innerHTML = "";
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (emaildangky.value.length <= 0) {
        loiemaildangky.innerHTML = "Bạn chưa nhập đúng email!";
        return false;
    } else if (!filter.test(emaildangky.value)) {
        loiemaildangky.innerHTML = "Bạn chưa nhập Email";
        return false;
    }
    return true;
}

function kiemtramatkhaudangky() {
    loimatkhaudangky.innerHTML = "";
    if (matkhaudangky.value.length <= 0) {
        loimatkhaudangky.innerHTML = "Bạn chưa nhập mật khẩu!";
        return false;
    }
    return true;
}
