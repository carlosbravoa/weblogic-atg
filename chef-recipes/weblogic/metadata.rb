name             'weblogic'
maintainer       'AI'
maintainer_email 'ai@derby.ac.uk'
license          'Apache 2.0'
description      'Installs/Configures fusion-middleware family of products. This recipe is modified to work with fixed java 8u92 and wls 12.1.3'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.3'

#depends 'java'
depends 'wml_java_8u92'
depends 'oracle-inventory'
depends 'chef-sugar'
depends 'compat_resource'
