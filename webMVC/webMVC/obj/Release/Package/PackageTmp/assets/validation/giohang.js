var themgiohang = document.getElementById("themgiohang");
var slspduocchon = document.getElementById("slspduocchon");
var mauspduocchon = document.getElementById("mauspduocchon");
var maspduocchon = document.getElementById("maspduocchon");

themgiohang.addEventListener("click", addCart);

function addCart() {
    var form = document.createElement("form");
    var masp = document.createElement("input");
    var mausp = document.createElement("input");
    var slsp = document.createElement("input");

    form.method = "POST";
    form.action = "/product/ThemGioHang";

    masp.value = maspduocchon.value;
    masp.name = "masp";
    form.appendChild(masp);

    mausp.value = mauspduocchon.options[mauspduocchon.selectedIndex].text;
    mausp.name = "mausp";
    form.appendChild(mausp);

    slsp.value = slspduocchon.value;
    slsp.name = "slsp";
    form.appendChild(slsp);

    document.body.appendChild(form);

    form.submit();
}