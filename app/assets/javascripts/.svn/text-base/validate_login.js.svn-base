/*

        @File Name                            :authentication_global.js

	@Company Name                         :Mindfire Solutions Pvt. Ltd.

	@Creator Name                         :Indranil Mukherjee

	@Date Created                         :2012-07-20

        @Date Modified                        :2012-07-20

        @Last Modification Details            :Validation adding for user login

        @Purpose                              :Validation adding for user login

*/
$(document).ready(function(){
    $('.button').click(function(){
        $('#login_loader').show();
        $.ajax({
                url:" /users/sign_in",
                type:"POST",
                data:{"user":{"email": $('#user_email').val(),"password": $('#user_password').val()}},
                success:function(data){
                    $('#login_loader').hide();
                    window.location.reload(true);
                },
                error:function(data){
                     $('#login_loader').hide();
                     $('.notice').html("Invalid email or password");
                }
        })
       return false;
        
    })
})