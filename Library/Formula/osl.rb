require 'formula'

class Osl < Formula
  homepage 'http://www.lri.fr/~bastoul/development/openscop/'
  url 'http://www.lri.fr/~bastoul/development/openscop/docs/osl-0.8.4.tar.gz'
  sha1 'aef3ad1b2957202f1fb74122606d03a1d477c6bd'
  head 'git://repo.or.cz/openscop.git'

  depends_on 'gmp'

  def install
    args = [
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
      "--enable-portable-binary",
      "--with-gmp-prefix=#{Formula.factory('gmp').opt_prefix}"
    ]

    system "./configure", *args
    system "make"
    system "make check"
    system "make install"
  end
end
