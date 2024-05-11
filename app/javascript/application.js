// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// -------------------for reply form open and close-------------------
var elements = document.getElementsByClassName("reply_button");
const openReplyForm = function () {
    var status = this.nextElementSibling.style.display
    if (status === 'block') {
        this.nextElementSibling.style = 'display: none;'
    } else {
        this.nextElementSibling.style = 'display: block;'
    }
};
for (var i = 0; i < elements.length; i++) {
    elements[i].addEventListener('click', openReplyForm, false);
}

// -----------------for like the stories using ajax------------------

var elements = document.getElementsByClassName("hearts");
const like_stories = function () {
    const story_id = this.getAttribute('story_id');
    fetch('/stories/' + story_id + '/like_story')
};
for (var i = 0; i < elements.length; i++) {
    elements[i].addEventListener('click', like_stories, false);
}

