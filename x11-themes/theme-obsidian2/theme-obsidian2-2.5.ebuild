# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Gnome theme, based upon Adwaita-Maia dark skin"
HOMEPAGE="https://github.com/madmaxms/theme-obsidian-2"
SRC_URI="https://github.com/madmaxms/theme-obsidian-2/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
IUSE=""
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"

# Require adwaita until moka is packaged
RDEPEND="
	>=x11-libs/gtk+-3.22
	x11-themes/gtk-engines-adwaita
"
DEPEND=""

src_install() {
	insinto /usr/share/themes
	doins -r Obsidian-2
}
