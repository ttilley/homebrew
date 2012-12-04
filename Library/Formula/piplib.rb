require 'formula'

class Piplib < Formula
  homepage 'http://www.piplib.org/'
  url 'http://www.bastoul.net/cloog/pages/download/piplib-1.4.0.tar.gz'
  head 'git://repo.or.cz/piplib.git'
  version '1.4.0'
  sha1 '35752b4ac9a7170766eb62c791d1a10582c675f9'

  depends_on 'gmp'
  depends_on 'libtool'
  depends_on 'automake'
  depends_on 'autoconf'

  def install
    args = [
      '--disable-dependency-tracking',
      "--prefix=#{prefix}",
      # without specifying an arch, piplib will attempt to guess. poorly.
      '--with-gcc-arch=native'
    ]

    # piplib 1.4.0 absolutely will not compile on darwin without this
    system 'glibtoolize -c --force'
    system 'aclocal -I m4'
    system 'automake -a -c --foreign'
    system 'autoconf'

    system "./configure", *args
    system "make"
    # installing without make check is a bad idea (TM)
    system "make check"
    system "make install"
  end
end
