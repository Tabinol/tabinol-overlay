# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1 gnome2-utils l10n

DESCRIPTION="Tray bar app to temporarily inhibit screensaver and sleep mode"
HOMEPAGE="https://pypi.python.org/pypi/caffeine-ng"
SRC_URI="https://pypi.python.org/packages/dc/b0/9a7429987b5f64c7a29f16b9cf13d1ab1a97545b4186daeb7ef32aed3ed3/caffeine-ng-3.4.0.tar.gz#md5=6dca670ff21eec61fbdfe2ff508c7a02 -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="
dev-python/pygobject[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
  dev-python/pydbus[${PYTHON_USEDEP}]
  dev-python/docopt[${PYTHON_USEDEP}]
  dev-python/ewmh
  x11-libs/libnotify
  dev-python/setproctitle[${PYTHON_USEDEP}]
  dev-python/setuptools[${PYTHON_USEDEP}]
  dev-python/wheel[${PYTHON_USEDEP}]
"
DEPEND=""

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_install_all() {
	distutils-r1_python_install_all

	# Remove disabled linguas
	rm_loc() {
		if [[ -e "${ED}/usr/share/locale/${1}" ]]; then
			rm -r "${ED}/usr/share/locale/${1}" || die
		fi
	}
	l10n_for_each_disabled_locale_do rm_loc
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}