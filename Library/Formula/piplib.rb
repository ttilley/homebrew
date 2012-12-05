require 'formula'

class Piplib < Formula
  homepage 'http://www.piplib.org/'
  url 'http://www.bastoul.net/cloog/pages/download/piplib-1.4.0.tar.gz'
  sha1 '35752b4ac9a7170766eb62c791d1a10582c675f9'
  head 'git://repo.or.cz/piplib.git'

  depends_on 'gmp'
  depends_on 'libtool' => :build
  depends_on 'automake' => :build
  depends_on 'autoconf' => :build

  def install
    args = [
      '--disable-dependency-tracking',
      "--prefix=#{prefix}",
      '--enable-portable-binary',
      "--with-gmp=#{Formula.factory('gmp').opt_prefix}"
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
