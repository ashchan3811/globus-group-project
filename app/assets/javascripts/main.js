/*global $*/
$(function() {
    $(window).load(function() {
        $('#gallery-container').snapGallery({
            minWidth: 150,
            maxCols: 3,
            margin: 6
        });
    });
});