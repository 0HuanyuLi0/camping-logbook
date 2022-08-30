
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



})
