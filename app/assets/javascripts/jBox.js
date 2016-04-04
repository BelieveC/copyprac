// Konstruktor
var jBox = function (settings) {
    
    var imageSelector = ".jbox-img";
    var altText = true;
    
    if(typeof settings != "undefined"){
        if(settings.imageSelector) { imageSelector = settings.imageSelector; }
        if(settings.altText) { altText = settings.altText; }
    }
    
    // Variables
    var jBoxContainer = $(".jbox-container");
    var jBoxContainerImg = $(".jbox-container img");
    var altTextBox = $(".jbox-container .img-alt-text");
    var buttonPrev = $(".jbox-container .jbox-prev");
    var buttonNext = $(".jbox-container .jbox-next");
    var buttonClose = $(".jbox-container .jbox-close");
    var buttons = $(".jbox-container .jbox-next, .jbox-container .jbox-prev, .jbox-container jbox-.close");
    var animationSpeed = 250;
    var cssAnimationDuration = 150;
    var mouseIsOnImg = false;
    var mouseIsOnButtons = false;
    var buttonPopUpDelay = 300;
    var transitionIsOver = true;

    // Gallery Initialization
    var gallery = $(imageSelector);
    var lastImg = gallery[gallery.length - 1].getAttribute("src");
    var firstImg = gallery[0].getAttribute("src");

    // (document).ready event
    $(document).ready(function () {
        $(".jbox-img").click(function () {
            var clickedImg = $(this).attr("src");
            openJBox(clickedImg, "first");
        });
    });

    // Mouseenter/-leave Events
    jBoxContainerImg.mouseenter(function () {
        mouseIsOnImg = true;
    });
    jBoxContainerImg.mouseleave(function () {
        mouseIsOnImg = false;
    });
    buttons.mouseenter(function () {
        mouseIsOnImg = true;
        mouseIsOnButtons = true;
    });
    buttons.mouseleave(function () {
        mouseIsOnImg = false;
        mouseIsOnButtons = false;
    });

    // Click Events
    jBoxContainer.click(function () {
        if (!mouseIsOnImg) {
            closeJBox();
        }
    });

    buttonNext.click(function () {
        openJBox(getNextImg("next"), "next");
    });

    buttonPrev.click(function () {
        openJBox(getNextImg("prev"), "prev");
    });

    buttonClose.click(function () {
        closeJBox();
    });

    // Swipe Events
    jBoxContainer.swipe({
        swipe: function (event, direction) {
            if (direction == "left") {
                openJBox(getNextImg("next"), "next");
            }
            if (direction == "right") {
                openJBox(getNextImg("prev"), "prev");
            }
            if (direction == 'up' || direction == 'down') {
                closeJBox();
            }
        }
    });

    // Keypress Events
    $(document).keyup(function (e) {

        // Esc
        if (e.keyCode == 27) {
            closeJBox();
            buttonClosePopUp();
        }
        // Prev
        if ((e.keyCode || e.which) == 37) {
            openJBox(getNextImg("prev"), "prev");
            buttonPrevPopUp();
        }
        // Next
        if ((e.keyCode || e.which) == 39) {
            openJBox(getNextImg("next"), "next");
            buttonNextPopUp();
        }
    });

    // Functions
    function openJBox(clickedImg, direction) {
        if (clickedImg == "lastOrFirst") {
            return;
        }

        jBoxContainer.fadeIn(animationSpeed);

        var fadeInClass;
        var fadeOutClass;

        if (direction == "next") {
            fadeInClass = "fade-in-right";
            fadeOutClass = "fade-out-left";
        }
        if (direction == "prev") {
            fadeInClass = "fade-in-left";
            fadeOutClass = "fade-out-right";
        }

        if (direction != "first") {
            // If not first Image
            if (transitionIsOver) {
                jBoxContainerImg.addClass(fadeOutClass);
                setTimeout(function () {
                    jBoxContainerImg.removeClass(fadeOutClass);
                    jBoxContainerImg.addClass(fadeInClass);
                    transitionIsOver = false;
                    jBoxContainerImg.attr("src", clickedImg);
                    altTextBox.text(getAltText(clickedImg));
                    setTimeout(function () {
                        jBoxContainerImg.removeClass(fadeInClass);
                        transitionIsOver = true;
                    }, cssAnimationDuration);
                }, cssAnimationDuration);
            }
        }
        else {
            // If First Image is opened
            jBoxContainerImg.attr("src", clickedImg);
            altTextBox.text(getAltText(clickedImg));
        }

        if (clickedImg == firstImg) {
            disableButton("prev");
        }
        else {
            enableButton("prev");
        }
        if (clickedImg == lastImg) {
            disableButton("next");
        }
        else {
            enableButton("next");
        }

        disableScroll();
    }

    function closeJBox() {
        jBoxContainer.fadeOut(animationSpeed);
        jBoxContainerImg.attr("src", "");
        enableScroll();
    }

    function getNextImg(direction) {
        var lastOrFirst = "lastOrFirst";

        if (direction == "prev") {
            if (jBoxContainerImg.attr("src") == gallery[0].getAttribute("src")) {
                return lastOrFirst;
            }
        }
        if (direction == "next") {
            if (jBoxContainerImg.attr("src") == gallery[gallery.length - 1].getAttribute("src")) {
                return lastOrFirst;
            }
        }

        var currentImg = jBoxContainerImg.attr("src");
        var nextImg;

        if (direction == "next") {
            for (var i = 0; i < gallery.length; i++) {
                if (currentImg == gallery[i].getAttribute("src")) {
                    i++;
                    nextImg = gallery[i].getAttribute("src");
                    break;
                }
            }

            return nextImg;
        }
        if (direction == "prev") {
            for (var i = 0; i < gallery.length; i++) {
                if (currentImg == gallery[i].getAttribute("src")) {
                    i--;
                    nextImg = gallery[i].getAttribute("src");
                    break;
                }
            }

            return nextImg;
        }
    }

    function getAltText(currentJBoxImg) {
        var altText = "";

        for (var i = 0; i < (gallery.length - 1); i++) {
            if (currentJBoxImg == gallery[i].getAttribute("src")) {
                altText = gallery[i].getAttribute("alt");
                break;
            }
        }

        if (altText == null) {
            altText = "";
        }

        return altText;
    }

    function disableButton(direction) {
        if (direction == "prev") {
            buttonPrev.hide();
        }

        if (direction == "next") {
            buttonNext.hide();
        }
    }

    function enableButton(direction) {

        if (direction == "prev") {
            buttonPrev.show();
        }

        if (direction == "next") {
            buttonNext.show();
        }
    }

    function buttonNextPopUp() {
        if (mouseIsOnButtons) {
            return;
        }

        buttonNext.addClass("pop-up");
        setTimeout(function () {
            buttonNext.removeClass("pop-up");
        }, buttonPopUpDelay);
    }

    function buttonPrevPopUp() {
        if (mouseIsOnButtons) {
            return;
        }

        buttonPrev.addClass("pop-up");
        setTimeout(function () {
            buttonPrev.removeClass("pop-up");
        }, buttonPopUpDelay);
    }

    function buttonClosePopUp() {
        if (mouseIsOnButtons) {
            return;
        }

        buttonClose.addClass("pop-up");
        setTimeout(function () {
            buttonClose.removeClass("pop-up");
        }, buttonPopUpDelay);
    }

    // Disable Scrolling
    var keys = { 37: 1, 38: 1, 39: 1, 40: 1 };

    function preventDefault(e) {
        e = e || window.event;
        if (e.preventDefault)
            e.preventDefault();
        e.returnValue = false;
    }

    function preventDefaultForScrollKeys(e) {
        if (keys[e.keyCode]) {
            preventDefault(e);
            return false;
        }
    }

    function disableScroll() {
        if (window.addEventListener) // older FF
            window.addEventListener('DOMMouseScroll', preventDefault, false);
        window.onwheel = preventDefault; // modern standard
        window.onmousewheel = document.onmousewheel = preventDefault; // older browsers, IE
        window.ontouchmove = preventDefault; // mobile
        document.onkeydown = preventDefaultForScrollKeys;
    }

    function enableScroll() {
        if (window.removeEventListener)
            window.removeEventListener('DOMMouseScroll', preventDefault, false);
        window.onmousewheel = document.onmousewheel = null;
        window.onwheel = null;
        window.ontouchmove = null;
        document.onkeydown = null;
    }
    // End Disable Scrolling   
}