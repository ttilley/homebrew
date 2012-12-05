require 'formula'

class Isl < Formula
  homepage 'http://www.kotnet.org/~skimo/isl/'
  url 'http://www.kotnet.org/~skimo/isl/isl-0.11.tar.bz2'
  mirror 'ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.11.tar.bz2'
  sha1 '6824420a9056f42c75d50b7c5d8e3bd8f5b34bbb'

  head 'git://repo.or.cz/isl.git'

  depends_on 'gmp'
  # depends_on 'piplib' if build.include?('with-piplib')

  # option 'with-piplib', 'compile against piplib'
  # option 'with-clang', 'use clang DiagnosticOptions/SourceLocation'

  def install
    args = [
      "--disable-dependency-tracking",
      "--prefix=#{prefix}",
      "--enable-portable-binary",
      "--with-gmp-prefix=#{Formula.factory('gmp').opt_prefix}"
    ]

    # args += [
    #   "--with-piplib=system",
    #   "--with-piplib-prefix=#{Formula.factory('piplib').opt_prefix}"
    # ] if build.include?('with-piplib')

    # args += [
    #   "--with-clang=system",
    #   "--with-clang-prefix=#{Formula.factory('llvm').opt_prefix}"
    # ] if build.include?('with-clang')

    system "./configure", *args
    system "make"
    system "make check"
    system "make install"
  end
end
