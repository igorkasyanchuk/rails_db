window.onload = function() {
  stickyFooter();
};

function checkForDOMChange() {
  stickyFooter();
};

window.onresize = function() {
  stickyFooter();
};

function getCSS(element, property) {
  var elem = document.getElementsByTagName(element)[0];
  var css = null;
  if (elem.currentStyle) {
    css = elem.currentStyle[property];
  } else if (window.getComputedStyle) {
  css = document.defaultView.getComputedStyle(elem, null).
  getPropertyValue(property);
  }
  return css;
};

function stickyFooter() {
  if (document.getElementsByTagName("footer")[0].getAttribute("style") != null) {
    document.getElementsByTagName("footer")[0].removeAttribute("style");
  }
  if (window.innerHeight != document.body.offsetHeight) {
    var offset = window.innerHeight - document.body.offsetHeight;
    var current = getCSS("footer", "margin-top");

    if (isNaN(current) == true) {
      document.getElementsByTagName("footer")[0].setAttribute("style","margin-top:0px;");
      current = 0;
    } else {
      current = parseInt(current);
    }

    if (current+offset > parseInt(getCSS("footer", "margin-top"))) {
      document.getElementsByTagName("footer")[0].setAttribute("style","margin-top:"+(current+offset)+"px;");
    }
  }
};