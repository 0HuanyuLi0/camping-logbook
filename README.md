# README

## Camping Logger Website

The website has published on [Herokuapp](https://camping-logger.herokuapp.com/).

<a href="https://camping-logger.herokuapp.com/"><img src="https://res.cloudinary.com/huanyuli/image/upload/v1662079843/camping_g4ptjp.jpg" alt="campinghome"></a>




### Webiste Description
The [Camping Logger](https://camping-logger.herokuapp.com/) is used to search and create camping sites or any attractions that you like. 
I am trying to build a 'Camping Fans Community'. In this website, you can:
- Search camping site by site name or location.
- Add new camping site to the database.
- Can save your favorite sites in your own 'List'
- In your own 'List' section, you can create your private stories, notes, or photos.
- In Camping Site 'show' page, you can see the camping site details including:
    - Name
    - Location
    - Coordinates
    - Price
    - Camping site officail website link
    - Powered site ? or Pets Allowed ?
    - General description
    - Site location in Google map
    - Photos (Public photos only)
    - Reviews

    You can also:
    - Save this site to your own lists
    - Create review
    - Create your 'Private Story' in this site
    - Upload your 'Private' or 'Public' photos in this site

- In ‘Camping Fans Forum’ section, you can:
    - Share your own list
    - Post your public stories and photos
    - Give the 'Feedback' to the author
*I am still working on this, but it is immportant! This section can make this website more 'Interactive' and more 'Community'*

- In 'User Profile' section, you can:
    - Manage your details
    - Upload your avatar
    - Manage your all photos
    - Manage your all stories
    - Manage your all created camping sites
    - Manage your all reviews
    - Manage your all lists 
*I am still working on this*

### Techniques Used
- Ruby v2.7.2
- Rails v5.2.8
- Git v2.37
- Heroku v7.62
- PostgreSQL 14
- Gems:
    - bcrypt
    - pry-rails
    - jquery-rails
    - cloudinary
    - dotenv-rails
- Google fonts: Icons

### Codes
- Cloudinary Upload Widgets
    - .js
    ```
    var myWidget = cloudinary.createUploadWidget({
        cloudName: 'huanyuli', 
        uploadPreset: 'y3prair4', folder: 'CampingSites'}, (error, result) => { 
          if (!error && result && result.event === "success") { 
            console.log('Done! Here is the image info: ', result.info);
            $('#files').append(
                `Photo: <input type="text" name="cloud[]" value="${result.info.url}" readonly/><br>`
            )
            // Get the upload results, and pass the params to backend
            }
          }
      )
    
      $("#upload").on("click",function(){
        myWidget.open();
      });
    ```











