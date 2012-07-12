# RetinaTag

Interested in making your web-sites retina compatible? Rails asset pipeline makes this a pain with retina image_tags, especially when precompiling assets. RetinaTag resolves this by extending image_tag to create a hidpi_src attribute with the retina image path if it exists.

## Installation

Add this line to your application's Gemfile:

    gem 'retina_tag'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install retina_tag


## Usage

Add retina_tag.js to your application.js file after including jquery

    //require retina_tag

Add double pixel resolution images in your assets directory with the @2x modifier
    logo.png
    logo@2x.png

Be sure to also specify the base dimensions in your image_tag calls
    <%=image_tag('logo.png',:height=>50)%>

Awesome right?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
