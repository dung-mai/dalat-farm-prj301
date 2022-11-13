/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function adjustQuantityButton(button) {
    const input = document.querySelector('.quantity-display');
    if (button.value === '+') {
        input.value = parseInt(input.value) + 1;
    } else {
        if (parseInt(input.value) <= "0") {
            input.value = 0;
        } else {
            input.value = parseInt(input.value) - 1;
        }
    }
}
