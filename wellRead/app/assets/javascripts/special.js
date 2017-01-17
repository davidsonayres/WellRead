// (function() {
//     $('#rating-form').raty({
//             path: 'public/images/stars/'
//         scoreName: 'rating[rating]',
//         // score: "1"
//     });
//
//
//
//     $('#rating').raty({
//         readOnly:true,
//         score: function(){
//             return $(this).attr('data-score');
//         },
//             path: 'public/images/stars/'
//         // starOff: image_path("images/star-off.png")
//         // starHalf: image_path("images/star-half.png")
//         // starOn: image_path("images/star-on.png")
//     });
//
//     $('#average-rating').raty({
//         readOnly:true,
//         score: function(){
//             return $(this).attr('data-score');
//         },
//             path: 'public/images/stars/'
//     });
// })();

$(document).ready(function() {
    $('#rating-form').raty({
    path: '/',
    scoreName: 'rating[rating]',
    // score: "1"
    starOn: 'images/stars/star-on.png',
    starHalf: 'images/stars/star-half.png',
    starOff: 'images/stars/star-off.png'
});
})

$(document).ready(function() {
    $('#rating').raty({
    readOnly:true,
    score: function(){
        return $(this).attr('data-score');
    },
    path: '/',
    starOn: 'images/stars/star-on.png',
    starHalf: 'images/stars/star-half.png',
    starOff: 'images/stars/star-off.png'
    });
})
$(document).ready(function() {
    $('#average-rating').raty({
    readOnly:true,
    score: function(){
        return $(this).attr('data-score');
    },
    path: '/',
    starOn: 'images/stars/star-on.png',
    starHalf: 'images/stars/star-half.png',
    starOff: 'images/stars/star-off.png'
    });
});
