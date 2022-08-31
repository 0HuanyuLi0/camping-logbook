
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
        $("#show_"+target.currentTarget.id).show()
    })

 
    var myWidget = cloudinary.createUploadWidget({
        cloudName: 'huanyuli', 
        uploadPreset: 'y3prair4', folder: 'CampingSites'}, (error, result) => { 
          if (!error && result && result.event === "success") { 
            console.log('Done! Here is the image info: ', result.info);
            $('#ff').append(
                `<input type="hidden" name="cloud[]" value="${result.info.url}" />`
            )
            }
          }
      )
      
    document.getElementById("upload").addEventListener("click", function(){
          myWidget.open();
        }, false);

})

