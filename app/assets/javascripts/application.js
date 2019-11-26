// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require moment
//= require tempusdominus-bootstrap-4.js
//= require fullcalendar
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


$(function () {
    function eventCalendar() {
        return $('#calendar').fullCalendar({});
    };
    function clearCalendar() {
        $('#calendar').html('');
    };
    $(document).on('turbolinks:load', function () {
        eventCalendar();
    });
    $(document).on('turbolinks:before-cache', clearCalendar);

    $('#calendar').fullCalendar({
        events: '/events.json',
        eventRender: function(event, element) {
            if (event.color == "Red") {
                element.css('background-color', 'rgb(237, 85, 101)' );
                element.css('border', 'rgb(237, 85, 101)' );
            } else if (event.color == "Blue") {
                element.css('background-color', 'rgb(28, 132, 198)' );
                element.css('border', 'rgb(28, 132, 198)' );
            } else if (event.color == "Yellow") {
                element.css('background-color', 'rgb(243, 226, 69)' );
                element.css('border', 'rgb(243, 226, 69)' );
            } else if (event.color == "Green") {
                element.css('background-color', 'rgb(26, 179, 148)' );
                element.css('border', 'rgb(26, 179, 148)' );
            } else if (event.color == "Orange") {
                element.css('background-color', 'rgb(248, 172, 89)' );
                element.css('border', 'rgb(248, 172, 89)' );
            } else if (event.color == "Purple") {
                element.css('background-color', 'rgb(146, 92, 190)' );
                element.css('border', 'rgb(146, 92, 190)' );
            } else if (event.color == "Others") {
                element.css('background-color', 'rgb(0, 0, 0)' );
                element.css('border', 'rgb(0, 0, 0)' );
            }
        },
        header: {
            left: 'month, agendaWeek, agendaDay',
            center: 'title',
            right: 'today, prev, next'
        },
        buttonText: {
            today: "Today",
            month: "Month",
            agendaWeek: 'Week',
            agendaDay: 'Day'
        },
        eventTextColor: 'white',
        slotDuration: "00:30:00",
        slotEventOverlap: false,
        nowIndicator: true,
        timeFormat: 'HH:mm',
        axisFormat: 'HH:mm'
    });
});