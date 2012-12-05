require 'formula'

class Isl < Formula
  homepage 'http://www.kotnet.org/~skimo/isl/'
  url 'http://www.kotnet.org/~skimo/isl/isl-0.11.tar.bz2'
  mirror 'ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.11.tar.bz2'
  sha1 '6824420a9056f42c75d50b7c5d8e3bd8f5b34bbb'

  head 'http://repo.or.cz/w/isl.git'

  depends_on 'gmp'

  def install
    args = [
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
    ]

    system "./configure", *args
    system "make"
    system "make check"
    system "make install"
  end
end
