# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Script to move windows from one monitor to the next in Xfce"
HOMEPAGE="https://github.com/jc00ke/move-to-next-monitor"
SRC_URI="https://github.com/jc00ke/${PN}/archive/master.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/${PN}-master

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"

RDEPEND="
  x11-misc/xdotool
  x11-misc/wmctrl
  x11-apps/xdpyinfo
"
DEPEND=""

src_install() {
	dobin move-to-next-monitor
}

pkg_postinst() {
	ewarn "You have to configure a shortcut (ex: Super + o) to use this script:"
  ewarn "1. settings manager -> keyboard -> application shortcuts"
  ewarn "2. Click Add"
  ewarn "3. Click Open and direct it to your script"
  ewarn "4. Assign a keyboard shortcut to it and wallah!"
  ewarn "Source: https://unix.stackexchange.com/questions/48456/xfce-send-window-to-other-monitor-on-keystroke"
	echo
}
