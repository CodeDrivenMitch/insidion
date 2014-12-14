// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

var oldContent;
var animating = false;

$(document).ready(function () {
    $('.box').click(function (el) {
        if(animating) return;
        var box = $(el.target);

        while (!box.hasClass('box') && !box.hasClass('currentBox')) {
            box = box.parent();
        }

        if (box.hasClass('currentBox')) {
            if(!animating) {
                box.switchClass('currentBox', 'box', 500, "easeInOutQuad", function() {
                    animating = false;
                });
                box[0].innerHTML = oldContent;
            }
            return;
        }


        var data = box.data();
        var url = '/block/' + data['type'] + '/' + data['id'];

        $.ajax({
            method: 'get',
            url: url
        }).success(function (data) {
            oldContent = box[0].innerHTML;
            box.find('.innerContent').html(data);

            animating = true;
            box.switchClass('box', 'currentBox', 500, "easeInOutQuad", function() {
                animating = false;
            });
        })
    });
});
