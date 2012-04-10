$(function() {
  $(".pagination a").live("click", function() {
    $(".pagination").html('<img src="http://t1.gstatic.com/images?q=tbn:ANd9GcTZwRwsB6cYOuh0ay953yJ02hG2Sqmv5Le46NYu8Gm6PYTbvnt59A" />')

    $.getScript(this.href);
    return false;
  });
});

 jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
 });
