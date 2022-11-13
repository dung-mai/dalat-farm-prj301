/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


    function searchProduct(txt) {
        $.ajax({
            url: '/PROJECT_PRJ301/searchajax',
            type: "get",
            data: {
                q : txt
            },
            async: true,
            success: function (data) {
                var row = document.getElementById('product-display');
                row.innerHTML = data;
            },
            error: function (xhr) {

            }
        });
    }
