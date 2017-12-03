# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils games java-pkg-2

DESCRIPTION="A game about placing blocks while running from skeletons. Or something like that"
HOMEPAGE="http://www.minecraft.net"
SRC_URI="https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar -> ${PN}.jar"
LICENSE="Minecraft"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

DEPEND="app-arch/zip
	>=virtual/jdk-1.8"

RDEPEND="dev-java/gson:2.2.2
	dev-java/java-config:2
	>=dev-java/jopt-simple-4.5:0
	>=dev-java/bcprov-1.47:0
	>=dev-java/commons-io-2.4:1
	dev-java/guava:20
	dev-java/jutils:0
	>=x11-apps/xrandr-1.4.3"

S="${WORKDIR}"

pkg_setup() {
	java-pkg-2_pkg_setup
	games_pkg_setup
}

src_unpack() {
	zip -d "${DISTDIR}/${A}" -O "${PN}.jar" --temp-path "${T}" com/\* joptsimple/\* || die
}

src_prepare() {
	sed "s:@GENTOO_PORTAGE_EPREFIX@:${EPREFIX}:g" "${FILESDIR}/${PN}-gentoo" > "${PN}-gentoo" || die
}

src_install() {
	# These dependencies are used by the launcher. The others are used
	# by the game itself and are sourced using the wrapper below.
	java-pkg_register-dependency gson-2.2.2
	java-pkg_register-dependency jopt-simple

	java-pkg_dojar "${PN}.jar"
	java-pkg_dolauncher "${PN}" -into "${GAMES_PREFIX}" --main net.minecraft.bootstrap.Bootstrap

	doicon "${FILESDIR}/${PN}.png"
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

