
$(document).ready(function(){
          
       var boder_style1="3px solid #34f458";
       var border_style2="3px solid red";
       var namePattern=/^[a-zA-Z]*$/;   

       $("#f_name_error").hide();
       $("#l_name_error").hide();
       $("#u_name_error").hide();
       $("#email_error").hide();
       $("#mobile_no_error").hide();
       
       
       var f_name_err=false;
       var l_name_err=false;
       var u_name_err=false;
       var password_err=false;
       var email_err=false;
       var mobile_no_err=false;
     

      
       $("#f_name").focusout(function(){

        check_firstname();
       });

       $("#l_name").focusout(function(){

        check_lastname();
       });  

        $("#u_name").focusout(function(){

        check_username();
       });

        $("#password").focusout(function(){

        check_password();
       });

       $("#email_id").focusout(function(){

        check_email();
       });

        $("#mobile_no").focusout(function(){

        check_mobile_no();
       }); 



      function check_firstname(){
         
         var f_name=$("#f_name").val();

            if(namePattern.test(f_name)  && f_name.length >=3){
                validationTrue($("#f_name"),$("#f_name_error"));
            }
          else{
        	  f_name_err=true;   
               validationFalse($("#f_name"),$("#f_name_error"));
               if(!namePattern.test(f_name))
                 $("#f_name_error").html("Invalid Name ! Only Characters are allowed");
               else
                $("#f_name_error").html("Invalid Name");
            }
        }
           
        function check_lastname(){
         
         var l_name=$("#l_name").val();

            if(namePattern.test(l_name) && l_name.length >=3){
                validationTrue($("#l_name"),$("#l_name_error"));
                

            }
          else{
        	  l_name_err=true;   
               validationFalse($("#l_name"),$("#l_name_error"));

              if(!namePattern.test(l_name))
                 $("#l_name_error").html("Invalid Name ! Only Characters are allowed");
               else
                $("#l_name_error").html("Invalid Name");
            }
        }
        

         function check_username(){
          
           var u_pattern=/^[a-zA-Z0-9]+$/;
           var u_name=$("#u_name").val();
 
             if(u_pattern.test(u_name) && (u_name.length >3 && u_name.length<16) ){
 
                 validationTrue($("#u_name"),$("#u_name_error"));
                  

             }
              
             else{
            	 l_name_err=true;
              validationFalse($("#u_name"),$("#u_name_error"));
 
               if(!u_pattern.test(u_name))
                   $("#u_name_error").html("Special Characters are not allowed");
               
               else if(u_name.length <3 || u_name.length > 16)
                     $("#u_name_error").html("Username must be between 3 to 16 ")
 
             }

         } 

         function check_password(){
           var password=$("#password").val();

           if (password.length >6) {
               validationTrue($("#password"),$("#password_error"));
               

           }
           
           else{
        	   u_name_err=true;
                validationFalse($("#password"),$("#password_error"));
                $("#password_error").html("Your password must be atleast 6 characters long.");
             }
         }
 
          function check_email(){
          
           var email_pattern=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
           var email_val=$("#email_id").val(); 
              
            if(email_pattern.test(email_val)){
              validationTrue($("#email_id"),$("email_error"));
              
            }
            else{
            	email_err=true;
            	validationFalse($("#email_id"),$("#email_error"));
            	$("#email_error").html("Please Check Your  Email is Invalid");	
            	
              
              
            }
         }

         function check_mobile_no(){
           var mobile_no=$("#mobile_no").val();
           var mobile_no_pattern=/^[0-9]*$/;

           if (mobile_no.length==10 && mobile_no_pattern.test(mobile_no)) {
               validationTrue($("#mobile_no"),$("#mobile_no_error"));
               
           }
           
           else{
        	   mobile_no_err=true;
                validationFalse($("#mobile_no"),$("#mobile_no_error"));
                $("#mobile_no_error").html("Please Check Your Mobile no is Invalid");
             }
         }

        

    
        $("#sign_up_button").click(function(){
        	f_name_err=false;
        	l_name_err=false;
        	u_name_err=false;
            password_err=false;
            email_err=false;
            mobile_no_err=false;
            
          check_firstname();
          check_lastname();
          check_username();
          check_password();
          check_email();
          check_mobile_no();
           
          if(f_name_err===false && l_name_err===false && u_name_err===false && 
        		  password_err==false && email_err===false && mobile_no_err==false){
        	  
        	  return true;
           }

          else{
        	  
            return false;
          }

  });
        
        
        
        function validationTrue(id,error_id){
            
            $(error_id).hide();
            $(id).css("border-bottom",boder_style1);
          }

          function validationFalse(id,error_id){
           
            $(id).css("border-bottom",border_style2);
            $(error_id).show();
            $(error_id).css("color","red");
         }
          
          
/* FORGOT PASSWORD VALIDATION*/        
        
        $("#reset_password_error").hide();
        $("#reset_password_verify_error").hide();
        var reset_password_err=false;
        var reset_password_verify_err=false;
        
        $("#reset_password").keyup(function(){

            check_reset_password();
           });
        
        $("#reset_password_verify").keyup(function(){
            check_reset_password_verify();
           });
         
        
        var reset_password;
        function check_reset_password(){
            reset_password=$("#reset_password").val();

            if (reset_password.length >6) {
                validationTrue($("#reset_password"),$("#reset_password_error"));
                
             }
            else{
         	   reset_password_err=true;
         	  validationFalse($("#reset_password"),$("#reset_password_error"));
                 $("#reset_password_error").html("Your password must be atleast 6 characters long.");
              }
          }
        
        function check_reset_password_verify(){
            var reset_password_verify=$("#reset_password_verify").val();

            if (reset_password===reset_password_verify && reset_password_verify !='') {
                validationTrue($("#reset_password_verify"),$("#reset_password_verify_error"));
                
             }
            else{
         	   reset_password_verify_err=true;
         	    if(reset_password!==reset_password_verify)
         		  $("#reset_password_verify_error").html("Password not Match ");
         	     validationFalse($("#reset_password_verify"),$("#reset_password_verify_error"));
         	 }
          }
        
        
        $("#reset_pass_button").click(function(){
        	reset_password_err=false;
            reset_password_verify_err=false;
            check_reset_password();
            check_reset_password_verify();
            
            if(reset_password_err===false && reset_password_verify_err===false){
            	console.log("form send");
            	return true;
            	
            }
            
            else {
            	console.log("form not send");
            	return false;
            }
        });

/*EDIT PROFILE VALIDATOR*/
        
      var profile_img_err=false;
    	   
        $("#imageUpload").change(function(){
        	check_profile_img();
        });
        
        function check_profile_img(){
        		
        	var file = $('#imageUpload').prop('files')[0];
        	
        	var ext = $("#imageUpload").val().split('.').pop().toLowerCase();
        	var maxFileSize=10;
            name = file.name;
            size = Math.round(file.size/1024/1024);
            type = file.type;
            
            if($.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
            	profile_img_err=true;
            	$("#imageUpload").val('');
                alert('You must select an image file only');
                
            }
            
            if(size>maxFileSize){
            	profile_img_err=true;
            	$("#imageUpload").val('');
            	alert("Image file is too large "+size+"MB");
            	
            	
            }
        }
        
 $("#edit_profile_button").click(function(){
        	
        	f_name_err=false;
        	l_name_err=false;
        	u_name_err=false;
        	profile_img_err=false;
            email_err=false;
            mobile_no_err=false;
            
          check_firstname();
          check_lastname();
          check_username();
          check_profile_img();
          check_email();
          check_mobile_no();
           
          if(f_name_err===false && l_name_err===false && u_name_err===false && 
        		  email_err===false && mobile_no_err==false && profile_img_err===false){
        	  
        	  return true;
           }

          else{
        	  
            return false;
          }

        });

  
  /* PROJECT VALIDATION*/      
        
        
        function check_project_video(){
    		
        	var file = $('#videoFile').prop('files')[0];
        	
        	var ext = $("#videoFile").val().split('.').pop().toLowerCase();
        	var maxFileSize=10;
            name = file.name;
            size = Math.round(file.size/1024/1024);
            type = file.type;
            
            if($.inArray(ext, ['mp4','mpg','webm']) == -1) {
            	$("#videoFile").val('');
                alert('You must select an video file only');
                
            }
            
            if(size>maxFileSize){
            	projec_video_err=true;
            	alert("video file is too large "+size+"MB");
            	
            	
            }
        }
        
        
        
        
        $("#imgFiles").change(function(){
        	check_project_images();
        });
        
  function check_project_images(){
    		
        	var files = $("#imgFiles").prop('files');
        	var ext=[];
        	var size=[];
        	$.each(files,function(index,value){
        		
        		ext[index]=value.name.split('.').pop().toLowerCase();
        	    size[index] = Math.round(value.size/1024/1024);
        	});
        	
        	var maxFileSize=1;
        	
        	$.each(ext,function(index,value){
        		
        		if($.inArray(value, ['gif','png','jpg','jpeg']) == -1) {
                	
        			
                	$("#imgFiles").val('');
                    alert('You must select an Image file only at : '+(index+1)*1);
                    return false;
                   
                 }
                
                if(size[index] > maxFileSize){
                	
                	$("#imgFiles").val('');
                	alert("Image  file is too large "+size[index]+"MB"+" at   "+index+1);
                	return false; 
                 }
           });
        	
         }
        
      
/* AJAX FOR COMMENTING AND LIKES  */  
  
  
function doComment(project_id,comment_text){
	  
	  if(comment_text==""){
		   return false;
		}
	  
       $.ajax({
	         type:"POST",	
	         url:'/user/project/comment',
	         data:{project_id:project_id,comment_text:comment_text},
	         success:function(comment){
		 
		     var total_comments=$('#total_comments_'+project_id).text().split(" ")[1];
		     total_comments=parseInt(total_comments);
		     $('#total_comments_'+project_id).html("comments "+(total_comments+1));
		     $("#comment_text_"+project_id).val('');
		      var delete_comment='<button type="button" class="btn btn-link" onclick='+"deleteComment($(this),comment_id_"
				  +comment.id+","+comment.id+","+project_id+")"+'>delete</button>';
		  
		    var username_link='<a href="/profile/${usernameval}">${usernameval}</a>';
		    /* var user_img_link='<a href="/profile/${usernameval}"> <img class="comment_user_img" src="/Users/'+comment.user.profile_picture+'"/></a>'; */
		    var user_img_link='<a href="/profile/${usernameval}">' 
		                     +'<img class="comment_user_img" src="/Users/${login_u_img}"/></a>'; 
		 
		   $("#com_text_"+project_id)
		   .before('<div class="comment_img" id='+"comment_id_"+comment.id+' >'
				 +user_img_link+'  <div class="comment_text">'+username_link+' <span class="mb-4">'
		         +comment.comment_text+'&nbsp &nbsp </span> </div>'+delete_comment+'</div>');
           }
	   });
     }

 
  function deleteComment(d_source,d_comment,comment_id,project_id){
	     
	     if(confirm("Do you really want to delete  ?")){
		    
	    	 $.ajax({
	    		 
		         url:"/user/project/comment/delete/"+comment_id,
		         success:function(status){
		    	 var total_comments=$('#total_comments_'+project_id).text().split(" ")[1];
			     total_comments=parseInt(total_comments);
			 
		         $('#total_comments_'+project_id).html("comments "+(total_comments-1));
		         $(d_source).html(status).css('color','red');
		         $(d_comment).hide(1000);
	           }
	        });
	    }
	     
	  else
	  return false;
   }

  
     function doLikeAndDeleteLike(like,project_id){
	   
	      $.ajax({
		        url:"/user/project/like/" +project_id,
			    success:function(status){
			    	 	
			    var likes=$('#total_like_'+project_id).text().split(" ")[1];
			    likes=parseInt(likes);
			    	
			     if(status==='liked'){
			    	 $(like).html('<i class="fa fa-thumbs-up" aria-hidden="true"></i>');
			    	 $(like).css("color","#007bff");
			    	 $('#total_like_'+project_id).text("likes "+(likes+1));
			      }
			     
			     else{
			     	 $(like).html('<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>')
			     	 .css("color","black");
			    	  $('#total_like_'+project_id).html("likes "+(likes-1));
			         }
			      }
	          }); 
         }  
   
    
  
/*END OF THE AJAX FOR COMMENTING AND LIKES*/  
  
});






 function doComment(project_id,comment_text){
	  
	  if(comment_text==""){
		   return false;
		}
	  
     $.ajax({
	         type:"POST",	
	         url:'/user/project/comment',
	         data:{projectId:project_id,commentText:comment_text},
	         success:function(comment){
		 
		     var total_comments=$('#total_comments_'+project_id).text().split(" ")[1];
		     total_comments=parseInt(total_comments);
		     $('#total_comments_'+project_id).html("comments "+(total_comments+1));
		     $("#comment_text_"+project_id).val('');
		      var delete_comment='<button type="button" class="btn btn-link" onclick='+"deleteComment($(this),comment_id_"
				  +comment.id+","+comment.id+","+project_id+")"+'>delete</button>';
		     
		     var username=$("#login_username").val();
		     var profile_pic="/Users/";
		     profile_pic+=$("#login_profile_pic").val();
		     console.log("profile pic "+profile_pic);
		     var username_link='<a href='+"/profile/"+username+'"'+'>'+username+'</a>';
		    
		     var user_img_link='<a href='+"/profile/"+username+'"'+'>' 
		                     +'<img class="comment_user_img" src='+profile_pic+'/></a>'; 
		 
		   $("#com_text_"+project_id)
		   .before('<div class="comment_img" id='+"comment_id_"+comment.id+' >'
				 +user_img_link+'  <div class="comment_text">'+username_link+' <span class="mb-4">'
		         +comment.commentText+'&nbsp &nbsp </span> </div>'+delete_comment+'</div>');
         }
	   });
   }


 function deleteComment(d_source,d_comment,comment_id,project_id){
	     
	     if(confirm("Do you really want to delete  ?")){
		    
	    	 $.ajax({
	    		 
		         url:"/user/project/comment/delete/"+comment_id,
		         success:function(status){
		    	 var total_comments=$('#total_comments_'+project_id).text().split(" ")[1];
			     total_comments=parseInt(total_comments);
			 
		         $('#total_comments_'+project_id).html("comments "+(total_comments-1));
		         $(d_source).html(status).css('color','red');
		         $(d_comment).hide(1000);
	           }
	        });
	    }
	     
	  else
	  return false;
   }


     function doLikeAndDeleteLike(like,project_id){
	   
	       $.ajax({
		        url:"/user/project/like/" +project_id,
			    success:function(status){
			    	 	
			    var likes=$('#total_like_'+project_id).text().split(" ")[1];
			    likes=parseInt(likes);
			    	
			     if(status==='liked'){
			    	 $(like).html('<i class="fa fa-thumbs-up" aria-hidden="true"></i>');
			    	 $(like).css("color","#007bff");
			    	 $('#total_like_'+project_id).text("likes "+(likes+1));
			      }
			     
			     else{
			     	 $(like).html('<i class="fa fa-thumbs-o-up" aria-hidden="true"></i>')
			     	 .css("color","black");
			    	  $('#total_like_'+project_id).html("likes "+(likes-1));
			         }
			      }
	          }); 
       }  
 
     function share(projectId){
    	 var copyText ="share/project/"+projectId;
    	  copyText.select();
    	  document.execCommand("copy");
    	  
    	  alert("Copied  text: " + copyText.value);
    	}
    	 
     


