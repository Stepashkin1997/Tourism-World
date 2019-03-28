$(document).ready(function () {
    $('#country').change(function () {
        var a = $("select#country").val();
        $.ajax({
            url: "/Home/CitySearch/", //url страницы (action_ajax_form.php)
            type: "POST", //метод отправки
            dataType: "text", //формат данных
            data: "country="+a,  // Сеарилизуем объект
            success: onAjaxSuccess
        });
        //var b = $("select#country").val();
        //$.post(
        //    a,
        //    {
        //        country: b,
        //    },
        //    onAjaxSuccess
        //);

    });
});

function onAjaxSuccess(data) {
    $("#city").empty();
    data = jQuery.parseJSON(data);
    for (var i = 0; i < data.length; i++) {
        $("#city").append("<option>" + data[i].Name + "</option>");
    }
}