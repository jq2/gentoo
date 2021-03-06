# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1 git-r3

DESCRIPTION="Interactive viewer for Graphviz dot files"
HOMEPAGE="https://github.com/jrfonseca/xdot.py"
EGIT_REPO_URI="https://github.com/jrfonseca/xdot.py.git"

LICENSE="LGPL-2+"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-python/pycairo[${PYTHON_USEDEP}]
	>=dev-python/pygtk-2.10:2[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	media-gfx/graphviz[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"
