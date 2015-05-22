function calculate_time(final_time, target_element, finish_message) {
  var current_time = Math.floor((new Date).getTime()/1000)

  var diff = final_time - current_time;

  if (diff < 0) {
    target_element.html(finish_message);
  } else {
    hours = Math.floor(diff/(60*60));
    diff_no_hours = diff - (hours*60*60);
    minutes = Math.floor(diff_no_hours/60);
    seconds = diff_no_hours - minutes*60

    hours = format_time_number(hours);
    minutes = format_time_number(minutes);
    seconds = format_time_number(seconds);

    var time_text = hours+":"+minutes+":"+seconds;
    target_element.html(time_text);

    setTimeout(function() {
      calculate_time(final_time, target_element, finish_message);
    }, 333);
  }
}

function format_time_number(number) {
  if(number < 10) {
    return number = "0" + number;
  } else {
    return number;
  }
}
