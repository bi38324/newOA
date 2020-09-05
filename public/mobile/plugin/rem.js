!function () {
    var pageWid = 375;
    function a() {
        console.log(document.documentElement.clientWidth);
        document.documentElement.style.fontSize = document.documentElement.clientWidth/pageWid*1.6/16*1000+"%"
    }
    var b = null;
    window.addEventListener("resize", function () {
        clearTimeout(b);
        b = setTimeout(a, 100)
    }, !1);
    a()
}(window);