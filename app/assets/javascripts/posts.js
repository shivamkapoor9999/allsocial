
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




function getData()
{
  
  
  $.ajax({
    type: 'GET',
    url: 'https://newsapi.org/v1/articles',
    data: {
      'apiKey': 'b69851d5e91b496aab3a65cad66e84e8',
      'source': "the-times-of-india",
      "sortBy": "latest"
    },
    success: function(success_data){
      
      displayData(success_data);
    },
    error: function(error_data){
      console.log(error_data);
      $("info h1").remove();
      console.log("You Entered Invalid City Name");
    }
  });
}

function displayData(success_data)
{
  //var mydata=success_data;
  // var obj = JSON.parse(success_data);
   $("#trending-news p").remove();
   console.log(success_data.articles);
   var arr=success_data.articles;
   for(let i=0;i<arr.length;i++)
   {
      str = arr[i].title.replace("- Times of India", "");

      var newElement= $('<p>',{
        'html':str
      });
      $("#trending-news").append(newElement);
   }

  // console.log(success_data.main.temp);
  // console.log(success_data.weather[0].main);
}




function main()
{
  addAutocomplete();
  getData();
  function repeat()
  {
    getData();
    // clearInterval(myvar);
  }
  var myvar=setInterval(repeat,100000);
}



 window.addEventListener('load', main);
