#!/bin/bash

LANG="en_US.utf-8"

ver=2.6.0
name=genymotion

date=$(date "+%a %b %d %Y")

if [ `getconf LONG_BIT` = "64" ]; then
_ARCH="x64"
else
_ARCH="x86"
fi

pkgdir=/tmp/$name
_datadir=/usr/share

rpmbuild=$HOME/rpmbuild
_sourcedir=$rpmbuild/SOURCES

u="$USER"
echo "User name $u"

install -d $pkgdir/$_datadir/
install -d $pkgdir/$_datadir/applications/
install -d $pkgdir/usr/bin/

wget -c http://files2.$name.com/$name/$name-$ver/$name-$ver-linux_$_ARCH.bin

wait ${!}

yes | bash ./$name-$ver-linux_$_ARCH.bin -d $pkgdir/$_datadir/

wait ${!}

install -d $pkgdir/usr/bin
  ln -sf $_datadir/$name/$name $pkgdir/usr/bin/$name
  ln -sf $_datadir/$name/$name-shell $pkgdir/usr/bin/$name-shell
  ln -sf $_datadir/$name/player $pkgdir/usr/bin/$name-player
  ln -sf $_datadir/$name/gmtool $pkgdir/usr/bin/gmtool

cat > $pkgdir/$_datadir/applications/$name.desktop << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Genymotion
Comment=Virtual environment for Android.
Exec=/usr/bin/genymotion
Icon=/$_datadir/genymotion/icons/icon.png
Terminal=false
Categories=Development;
EOF

cd /tmp

tar Jcf $_sourcedir/$name-$ver.tar.xz $name

wait ${!}

cd -

cat <<EOF > $rpmbuild/SPECS/$name.spec
# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. 
AutoReqProv: no
%define          debug_package %{nil}

Summary: Complete set of tools that provides a virtual environment for Android
Name: genymotion
Version: 2.6.0
Release: 1
License: Propietary
Group: Development/Tools
Source: %{name}-%{version}.tar.xz
URL: http://www.genymotion.com/
Requires: kernel-devel gstreamer-plugins-base libpng12 ffmpeg-compat net-tools protobuf qca qt5-qtscript qt5-qtwebkit


%description
Complete set of tools that provides a virtual environment for Android.

%prep
%setup -n genymotion

%build
# Empty section.

%install


# in builddir
cp -a * %{buildroot}
chmod 4755 %{buildroot}/%{_datadir}/%{name}/%{name}

chrpath --delete %{buildroot}/usr/share/genymotion/gmtool
chrpath --delete %{buildroot}/usr/share/genymotion/libminicrypt.so.1.0.0
chrpath --delete %{buildroot}/usr/share/genymotion/genyshell
chrpath --delete %{buildroot}/usr/share/genymotion/plugins/libvboxmanage.so.1.0.0
chrpath --delete %{buildroot}/usr/share/genymotion/genymotion
chrpath --delete %{buildroot}/usr/share/genymotion/device-upgrade
chrpath --delete %{buildroot}/usr/share/genymotion/player

ln -sf /usr/share/genymotion/libminicrypt.so.1.0.0 %{buildroot}/usr/share/genymotion/libminicrypt.so.1

%clean
rm -rf %{buildroot}


%files
%{_bindir}/*
%{_datadir}/applications/%{name}.desktop
%{_datadir}/%{name}/

%changelog
* $date $u <anonymous_friend> 2.6.0-1
- First Build

EOF

wait ${!}

rpmbuild -ba $rpmbuild/SPECS/$name.spec


rm -rf $pkgdir/


