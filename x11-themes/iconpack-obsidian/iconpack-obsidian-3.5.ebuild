# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Obsidian Icon Theme"
HOMEPAGE="https://github.com/madmaxms/iconpack-obsidian"
SRC_URI="https://github.com/madmaxms/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"

# Require adwaita until moka is packaged
RDEPEND="
	x11-themes/adwaita-icon-theme
"
DEPEND=""

src_install() {
	insinto /usr/share/themes
	doins -r Obsidian*
}
