# RetinaTag

Interested in making your web-sites retina compatible? Rails asset pipeline
makes this a pain with retina `image_tag`s, especially when precompiling assets.
RetinaTag resolves this by extending `image_tag` to create a `hidpi_src`
attribute with the retina image path if it exists.

## Installation

Add this line to your application's Gemfile:

    gem 'retina_tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install retina_tag


## Usage

Add `retina_tag.js` to your application.js file after including jQuery:

    //require retina_tag

Add double pixel resolution images in your assets directory with the @2x modifier

    logo.png
    logo@2x.png

Be sure to also specify the base dimensions in your `image_tag` calls:

    <%=image_tag('logo.png',:height=>50)%>

Awesome right?

### Forcing Refresh after loading dynamic content
Retina tag listens to the global event on document called `retina_tag:refresh`. Firing this event will force retina_tag to rescan the dom for images and update their image src if necessary. Useful if loading content dynamically. **Note:** retina_tag automatically supports turbolinks.

### Override Hidpi src attribute
In some cases it becomes necessary to override the hidpi_src attribute and skip asset pipeline. A good example of this might be to load a users profile picture which is stored elsewhere.

    <%=image_tag(user.photo.url(:medium), "hidpi_src" => user.photo.url(:medium_2x), :height=>75, :width => 75%>

### Lazy Loading Images
If you set `:lazy => true` on an image_tag, the src attribute is moved to a lodpi_src attribute. You will need to manually instruct the image to load. To do this use `RetinaTag.refreshImage(img)` where img is the image element.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

##License
This project is licensed under the MIT License.
