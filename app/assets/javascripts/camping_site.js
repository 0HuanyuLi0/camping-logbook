
$(function () {

    $("#photo_link button").on("click",function(){
        $("#photo_link").prepend(`
            <div>
                <label>
                    Photo Link: <br>
                    <input type="text" name="photo_links[]" />
                    <br><br>
                </label>
            </div>`)
    })

    $(".show_form").on("click",function(target){
        $("#show_"+target.currentTarget.id).toggle()
    })

 
    var myWidget = cloudinary.createUploadWidget({
        cloudName: 'huanyuli', 
        uploadPreset: 'y3prair4', folder: 'CampingSites'}, (error, result) => { 
          if (!error && result && result.event === "success") { 
            console.log('Done! Here is the image info: ', result.info);
            $('#files').append(
                `Photo: <input type="text" name="cloud[]" value="${result.info.url}" readonly/><br>`
            )
            }
          }
      )
    
      $("#upload").on("click",function(){
        myWidget.open();
      });
      
    // document.getElementById("upload").addEventListener("click", function(){
    //       myWidget.open();
    //     }, false);

   
})

