
$(function () {
    $("#photo_link button").on("click",function(){
        $("#photo_link").prepend(`<div>

            <input type="text" name="photo_links[]" />
            <br>
            
        
        </div>`)
    })
})
