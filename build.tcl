#!/usr/bin/tclsh

set arch "x86_64"
set base "tDOM-0.9.0"
set fileurl "http://tdom.org/downloads/tdom-0.9.0-src.tgz"

set var [list wget $fileurl -O tdom-0.9.0-src.tgz]
exec >@stdout 2>@stderr {*}$var

if {[file exists build]} {
    file delete -force build
}

set var [list tar xzvf tdom-0.9.0-src.tgz]
exec >@stdout 2>@stderr {*}$var

file rename -force tdom-0.9.0 tDOM-0.9.0
set var [list tar czvf tDOM-0.9.0.tgz tDOM-0.9.0]
exec >@stdout 2>@stderr {*}$var

file delete -force tDOM-0.9.0

file mkdir build/BUILD build/RPMS build/SOURCES build/SPECS build/SRPMS
file copy -force $base.tgz build/SOURCES
file copy -force tdom.patch build/SOURCES
file copy -force tdom-tnc.patch build/SOURCES
file copy -force tdom-gumbo.patch build/SOURCES

set buildit [list rpmbuild --target $arch --define "_topdir [pwd]/build" -bb tdom.spec]
exec >@stdout 2>@stderr {*}$buildit

# Remove our source code
file delete tdom-0.9.0-src.tgz
file delete $base.tgz

