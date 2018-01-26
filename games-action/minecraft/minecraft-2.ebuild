# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games java-utils-2

DESCRIPTION="An open-world game whose gameplay revolves around breaking and placing blocks"
HOMEPAGE="http://www.minecraft.net"
SRC_URI="
  https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar -> ${PN}.jar
  https://github.com/Tabinol/tabinol-overlay/raw/master/${CATEGORY}/${PN}/files/minecraft.png -> ${PN}.png"
LICENSE="Minecraft"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND=">=virtual/jre-1.8.0
  >=x11-apps/xrandr-1.4.3
  virtual/ttf-fonts"

DEPEND=""

S="${WORKDIR}"

pkg_setup() {
	games_pkg_setup
}

src_unpack() {
	true
}

src_install() {
	java-pkg_dojar "${DISTDIR}/${PN}.jar"
	java-pkg_dolauncher "${PN}" -into "${GAMES_PREFIX}" --main net.minecraft.bootstrap.Bootstrap

	doicon "${DISTDIR}/${PN}.png"
	make_desktop_entry "${PN}" "Minecraft"

	prepgamesdirs
}

pkg_postinst() {
	ewarn "if you are doing an update, consider to remove minecraft-gentoo call"
	ewarn "in Minecraft launcher configuration which is no longer installed."
	ewarn "Every Minecraft versions should work."
	echo

	games_pkg_postinst
}

