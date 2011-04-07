maintainer       "Stephane Jourdan"
maintainer_email "sjourdan@greenalto.com"
license          "Apache 2.0"
description      "Installs/Configures s3cmd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.9"
recipe           "s3cmd", "Installs and configures s3cmd"

%w{ubuntu debian}.each do |os|
  supports os
end

