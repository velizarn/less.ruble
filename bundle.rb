require 'ruble'

bundle do |bundle|

  bundle.display_name = 'Less'
  bundle.author = 'Velizar Nenov<velizarn@webdevgears.com>'
  bundle.repository = 'git://github.com/webdevgears/less.ruble.git'
  bundle.copyright = "(c) Copyright 2014, Distributed under MIT license"
  bundle.description = "Wro4j Runner for Aptana Studio 3x"

  bundle.menu 'Less' do |menu|
    menu.command 'Compile CSS'
    menu.command 'Compile JS'
  end

end