# Maintainer: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Jean-Pier Brochu <jeanpier.brochu@gmail.com>
# Contributor: Samuel Littley <samuel@samuellittley.me>
# Contributor: KillWolfVlad <github.com/KillWolfVlad>
# Contributor: Victor Hugo Souza <vhbsouza@gmail.com>
# Contributor: William Penton <william@nexxuz.co>
# Contributor: Jeff Moody <jeff@fifthecho.com>
# Contributor: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: iBernd81 <aur at gempel dot bayern>

pkgname=gitkraken
pkgrel=1
pkgver=11.8.0
pkgdesc="The intuitive, fast, and beautiful cross-platform Git client."
url="https://www.gitkraken.com/"
provides=('gitkraken')
arch=('x86_64')
license=('custom')
depends=('nss' 'gtk3' 'libsecret' 'libxkbfile')
optdepends=('git-lfs: git-lfs support'
            'org.freedesktop.secrets: Provides ways to store passwords and encryption keys')
makedepends=()
backup=()
install=''
source=(
    "${pkgname}-${pkgver}.tar.gz::https://api.gitkraken.dev/releases/production/linux/x64/${pkgver}/gitkraken-amd64.tar.gz"
    "gitkraken.desktop"
)
sha256sums=('3e74cab2369f0089110d19e7a1beb1510cde2d8bcf3dbbeac61c1b9f34a7abc4'
            '2b5f88e01a09062b0690fc4243307437a51bde2ba21bf4923296f4f26a812cfb')
options=('!strip' '!debug')

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/gitkraken "$pkgdir"/opt/gitkraken

    install -d "$pkgdir"/usr/bin

    install -D -m644 "./gitkraken.desktop" "${pkgdir}/usr/share/applications/gitkraken.desktop"
    install -D -m644 "$pkgdir/opt/gitkraken/gitkraken.png" "$pkgdir/usr/share/pixmaps/gitkraken.png"
}
