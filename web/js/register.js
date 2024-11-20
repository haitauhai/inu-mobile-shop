
document.addEventListener("DOMContentLoaded", function () {
    var pElements = document.getElementsByClassName("errorMessage");
    for (var i = 0; i < pElements.length; i++) {
        var pElement = pElements[i];
        if (!pElement.textContent.trim()) {
            pElement.style.display = 'none';
        }
    }
});

$(document).ready(function() {
    let isUsernameValid = false;
    let isPasswordValid = false;

    function updateNextButton() {
        if (isUsernameValid && isPasswordValid) {
            $("#nextBtn").prop('disabled', false).css('opacity', '1');
        } else {
            $("#nextBtn").prop('disabled', true).css('opacity', '0.5');
        }
    }

    $('#txtUser').on('input', function () {
        var username = $('#txtUser').val();
        $.ajax({
            url: 'CheckUsernameServlet',
            type: 'POST',
            data: {username: username},
            success: function (response) {
                console.log("Server response:", response);
                $('#usernameError').show();
                if (response === 'valid') {
                    $('#usernameError').text('Username is valid.');
                    $('#usernameError').removeClass('invalid').addClass('valid');
                    isUsernameValid = true;
                } else {
                    $('#usernameError').text('Username already exists');
                    $('#usernameError').removeClass('valid').addClass('invalid');
                    isUsernameValid = false;
                }
                updateNextButton();
            },
            error: function (xhr, status, error) {
                console.error("AJAX error:", status, error);
                $('#usernameError').show().text('Error checking username.');
                isUsernameValid = false;
                updateNextButton();
            }
        });
    });

    function validatePasswords() {
        var password = $('#txtPass').val();
        var reenterPassword = $('#reenterPassword').val();
        var passwordError = $('#passwordError');
        
        if (reenterPassword === "") {
            passwordError.text('').hide();
            isPasswordValid = false;
        } else if (password !== reenterPassword) {
            passwordError.text('Passwords do not match').show();
            isPasswordValid = false;
        } else {
            passwordError.text('').hide();
            isPasswordValid = true;
        }
        updateNextButton();
        return isPasswordValid;
    }

    $('#txtPass, #reenterPassword').on('input', validatePasswords);

    $("#nextBtn").click(function() {
        if (isUsernameValid && isPasswordValid) {
            $("#step1").removeClass("active");
            $("#step2").addClass("active");
        }
    });

    // Khởi tạo trạng thái nút Next
    updateNextButton();

    // Fetch provinces
    $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function(data_tinh){
        if(data_tinh.error == 0){
            $.each(data_tinh.data, function (key_tinh, val_tinh) {
                $("#province").append('<option value="'+val_tinh.id+'">'+val_tinh.full_name+'</option>');
            });
            
            // Fetch districts when province changes
            $("#province").change(function(e){
                var idtinh = $(this).val();
                $.getJSON('https://esgoo.net/api-tinhthanh/2/'+idtinh+'.htm', function(data_quan){
                    if(data_quan.error == 0){
                        $("#district").html('<option value="">Quận/Huyện</option>');
                        $("#ward").html('<option value="">Phường/Xã</option>');
                        $.each(data_quan.data, function (key_quan, val_quan) {
                            $("#district").append('<option value="'+val_quan.id+'">'+val_quan.full_name+'</option>');
                        });
                        
                        // Fetch wards when district changes
                        $("#district").change(function(e){
                            var idquan = $(this).val();
                            $.getJSON('https://esgoo.net/api-tinhthanh/3/'+idquan+'.htm', function(data_phuong){
                                if(data_phuong.error == 0){
                                    $("#ward").html('<option value="">Phường/Xã</option>');
                                    $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                        $("#ward").append('<option value="'+val_phuong.id+'">'+val_phuong.full_name+'</option>');
                                    });
                                }
                            });
                        });
                    }
                });
            });
        }
    });

    $('#registerForm').on('submit', function(e) {
        var detailedAddress = $('input[name="address"]').val();
        var ward = $('#ward option:selected').text();
        var district = $('#district option:selected').text();
        var province = $('#province option:selected').text();
        
        var fullAddress = detailedAddress + ", " + ward + ", " + district + ", " + province;
        $('<input>').attr({
            type: 'hidden',
            name: 'fullAddress',
            value: fullAddress
        }).appendTo('#registerForm');
    });
});
