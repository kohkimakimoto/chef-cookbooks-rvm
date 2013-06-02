default[:rvm][:dependencies] = [
  "gcc-c++",
  "patch",
  "readline",
  "readline-devel",
  "zlib",
  "zlib-devel",
  "libffi-devel",
  "openssl-devel",
  "make",
  "bzip2",
  "autoconf",
  "automake",
  "bison",
  "libtool",
  "gdbm-devel",
  "tcl-devel",
  "tk-devel",
  "libxslt-devel",
  "libxml2-devel",
  "libyaml-devel",
  "git",
  "curl"
]
default[:rvm][:installer_url] = "https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer"
default[:rvm][:users] = [
#  {:user => "kohkimakimoto", :rubies => ["2.0.0"], :default => "2.0.0"} # Single user install.
#  {:user => "root", :rubies => ["2.0.0"], :default => "2.0.0"} # System wide install.
]


