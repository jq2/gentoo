# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils qmake-utils xdg-utils

DESCRIPTION="Small, lightweight Qt text editor"
HOMEPAGE="https://tea.ourproject.org/"
SRC_URI="https://tea.ourproject.org/dloads/${P}.tar.bz2"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 x86 ~x86-fbsd"
IUSE="aspell djvu hunspell pdf +qml"

RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtprintsupport:5
	dev-qt/qtwidgets:5
	sys-libs/zlib
	aspell? ( app-text/aspell )
	djvu? ( app-text/djvu )
	hunspell? ( app-text/hunspell:= )
	pdf? ( app-text/poppler[qt5] )
	qml? ( dev-qt/qtdeclarative:5 )
"
DEPEND="${RDEPEND}
	hunspell? ( virtual/pkgconfig )
"

DOCS=( AUTHORS ChangeLog NEWS NEWS-RU TODO )

src_configure() {
	eqmake5 src.pro \
		PREFIX="/usr" \
		$(use aspell || echo CONFIG+=noaspell) \
		$(use djvu && echo CONFIG+=usedjvu) \
		$(use hunspell || echo CONFIG+=nohunspell) \
		$(use pdf && echo CONFIG+=usepoppler) \
		$(use qml || echo CONFIG+=noqml)
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	einstalldocs

	docinto html
	dodoc manuals/*.html

	insinto /usr/share/qt5/translations
	doins translations/${PN}_*.qm
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
