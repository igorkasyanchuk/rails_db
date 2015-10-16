window.onload = function() {
  stickyFooter();
  //you can either uncomment and allow the setInterval to auto correct the footer
  //or call stickyFooter() if you have major DOM changes
  //setInterval(checkForDOMChange, 1000);
};

//check for changes to the DOM
function checkForDOMChange() {
  stickyFooter();
}

//check for resize event if not IE 9 or greater
window.onresize = function() {
  stickyFooter();
}

//lets get the marginTop for the <footer>
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

}

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
}