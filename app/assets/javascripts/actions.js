
function CreateLogin(){
    BaseURL	=	'https://api.gobit.co';
    var form = $('#user-form').serialize();
    
    $.post("/api/sign_up", form,
    function(data, status){
        if (data.access_token) {
            localStorage.setItem('goBitAuth', JSON.stringify(data));
            window.location.replace("/app/build");
        }
        console.log(data)
    }).fail(function(xhr, status, error) {
        checkErrors(JSON.parse(xhr.responseText).errors);
    }); 
}
function CreateUser(){
    BaseURL =   'https://api.gobit.co';
    var form = $('#registerForm').serialize();
    $.post(BaseURL + "/v1/users", form,
    function(data, status){
        if (data.access_token) {
            localStorage.setItem('goBitAuth', JSON.stringify(data));
            window.location.replace("/app/build");
        }
    })
    .fail(function(response) {
        checkCreateErrors(JSON.parse(response.responseText));
    });
}
function checkCreateErrors(val){
    var errors  =   $('#errors');
    var array = $.map(val, function(value, index) {
        return '<li>'+ [value] +'</li>';
    });
    errors.html(array)
}
function checkErrors(val){
	var errors 	=	$('#errors');
	errors.html(val);
}