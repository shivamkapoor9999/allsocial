
function addAutocomplete(){
$( "#search_user" ).autocomplete({
      source: "user/user_API",
      minLength: 2,
      select: function( event, ui ) {
        console.log( "Selected: " + ui.item.value + " aka " + ui.item.id );
        window.location.href = "/users/user_profile/" + ui.item.id;
      }
    });
    }

 window.addEventListener('load', addAutocomplete);
