$(document).ready(function () {
    function my_function() {
        var text1 = document.getElementsByTagName("input")[2];
        var a_value = text1.value;
        var text2 = document.getElementsByTagName("input")[3];
        var b_value = text2.value;
        var text3 = document.getElementsByTagName("input")[4];
        var c_value = text3.value;
        if (document.getElementById('Linear').checked) {
            $("p#show_input_q").html("<b>" + a_value + "</b>\n" +
                "x + <b>" + b_value + "</b> = 0 ");
        } else {
            $("p#show_input_q").html("<b>" + a_value + "</b>\n" +
                " x<sup>2</sup> + <b>" + b_value + "</b>\n" +
                " x + <b>" + c_value + "</b> = 0 ");
        }
    }
    $("#Linear").click(function () {
        $("div#c_element").hide();
        $("input#c_element").hide();
        my_function();
    });
    $("#Quadratic").click(function () {
        $("div#c_element").show();
        $("input#c_element").show();
        my_function();
    });
    $("div#input_form").change(my_function);

});
