document.addEventListener('DOMContentLoaded', function () {
    var citis = document.getElementById("province");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");

    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };

    axios(Parameter)
            .then(function (response) {
                renderCity(response.data);
            })
            .catch(function (error) {
                console.error("Error fetching data:", error);
            });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function () {
            districts.length = 1;
            wards.length = 1;
            if (this.value != "") {
                const result = data.filter(n => n.Id === this.value);
                for (const k of result[0].Districts) {
                    districts.options[districts.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        districts.onchange = function () {
            wards.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;
                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }

    document.getElementById('orderForm').addEventListener('submit', function (e) {
        e.preventDefault();
        var detailedAddress = document.querySelector('input[name="address"]').value;
        var ward = wards.options[wards.selectedIndex].text;
        var district = districts.options[districts.selectedIndex].text;
        var province = citis.options[citis.selectedIndex].text;
        var fullAddress = detailedAddress + ", " + ward + ", " + district + ", " + province;

        // Add hidden input for full address
        var inputFullAddress = document.createElement('input');
        inputFullAddress.type = 'hidden';
        inputFullAddress.name = 'fullAddress';
        inputFullAddress.value = fullAddress;
        document.getElementById('orderForm').appendChild(inputFullAddress);

        processPayment(e);
    });

    function processPayment(event) {
        event.preventDefault();
        var paymentMethod = document.querySelector('input[name="payment-method"]:checked').value;
        var form = document.getElementById('orderForm');

        if (paymentMethod === 'vnpay') {
            form.action = 'processVNPAYPayment'; // Redirect to VNPAY payment
        } else {
            form.action = 'processOrder'; // Redirect to COD payment
        }

        form.submit(); // Submit form to process payment
    }
});