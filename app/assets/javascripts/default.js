var oldContent;
var animating = false;

jQuery.fn.reverse = [].reverse;

$(document).ready(function () {
    // set index on all static contents
    $('.staticContent').data('index', 0);

    // do rest
    $('.box').click(function (el) {
        if (animating) return;
        var box = $(el.target);

        while (!box.hasClass('box') && !box.hasClass('currentBox')) {
            box = box.parent();
        }

        if (box.hasClass('currentBox')) {
            if (!animating) {
                box.switchClass('currentBox', 'box', 500, "easeInOutQuad", function () {
                    animating = false;
                });
                box.find('.innerContent').html(oldContent);
            }
            return;
        }



        var b = $('.currentBox');
        if(b.length > 0) {
            b.switchClass('currentBox', 'box', 500, "easeInOutQuad");
            b.find('.innerContent').html(oldContent);
        }
        var data = box.data();
        var url = '/block/' + data['type'] + '/' + data['id'];

        $.ajax({
            method: 'get',
            url: url
        }).success(function (data) {
            oldContent = box.find('.innerContent').html();
            box.find('.innerContent').html(data);

            animating = true;
            box.switchClass('box', 'currentBox', 500, "easeInOutQuad", function () {
                animating = false;
            });
        })
    }).each(function () {
        var damn = $(this);
        setInterval(function () {
            animateImage(damn);
        }, 5000 + Math.random() * 3000);
    })
});

function animateImage(box) {
    var images = box.find('img.block-image');
    // No need to do anything when there is only 1 image
    if(images.length < 2) return;
    var staticContent = box.find('.staticContent');
    var imageIndex = staticContent.data('index');
    var currentIndex = 0;

    if (images.length - 1 == imageIndex) {
        images.fadeIn(500);
        staticContent.data('index', 0);
    } else {
        images.reverse().each(function () {
            if (currentIndex == imageIndex) {
                $(this).fadeOut();
            }
            currentIndex += 1;
        });
        staticContent.data('index', imageIndex + 1)
    }
}