document.addEventListener("DOMContentLoaded", function () {
    // Select all product containers
    let productContainers = document.querySelectorAll('.col-12.col-md-6.col-lg-4');

    // Loop through each product container
    productContainers.forEach(function (productContainer) {
        // Get the price element within this product container
        let priceElement = productContainer.querySelector('.price');

        // Get the amount from the hidden input inside this price element
        let amount = parseInt(priceElement.querySelector("input[type='hidden']").value);

        // Create a new formatter for each price element
        let formatter = new Intl.NumberFormat("vi-VN", {style: "currency", currency: "VND"});

        // Format the amount and set it as the inner text of the price element
        priceElement.querySelector(".num").innerText = formatter.format(amount);
    });
});
