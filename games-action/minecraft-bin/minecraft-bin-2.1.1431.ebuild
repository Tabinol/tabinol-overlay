# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

MY_PN=${PN/-bin/}
inherit desktop

DESCRIPTION="An open-world game whose gameplay revolves around breaking and placing blocks"
HOMEPAGE="http://www.minecraft.net"
SRC_URI="
  https://github.com/Tabinol/gentoo-minecraft/archive/${PV}.tar.gz -> ${P}-sh.tar.gz
  https://launcher.mojang.com/download/Minecraft.tar.gz -> ${P}.tar.gz"
	
LICENSE="Minecraft"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

S="${WORKDIR}/gentoo-minecraft-${PV}"

RDEPEND=">=virtual/jre-1.8.0
  >=x11-apps/xrandr-1.4.3
  virtual/ttf-fonts"

DEPEND=""

src_unpack() {
	unpack ${P}-sh.tar.gz
	unpack ${P}.tar.gz
}

src_install() {
	pushd ../minecraft-launcher-${PV}
	insinto /opt/${MY_PN}
	doins -r .
	fperms +x /opt/${MY_PN}/chrome-sandbox
	fperms +x /opt/${MY_PN}/launcher
	fperms +x /opt/${MY_PN}/libcef.so
	fperms +x /opt/${MY_PN}/minecraft-launcher.sh
	popd
  dobin "${MY_PN}"
	doicon "${MY_PN}.png"
	make_desktop_entry "${MY_PN}" "Minecraft" "minecraft"
}

pkg_postinst() {
	ewarn "if you are doing an update, consider to remove minecraft-gentoo call"
	ewarn "in Minecraft launcher configuration which is no longer installed."
	ewarn "Every Minecraft versions should work."
	echo
}
