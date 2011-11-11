require 'formula'

# This duplicates the system "screen", but fixes the ability
# to use vertical splits.

class Screen < Formula
  url 'http://ftpmirror.gnu.org/screen/screen-4.0.3.tar.gz'
  homepage 'http://www.gnu.org/software/screen'
  md5 '8506fd205028a96c741e4037de6e3c42'
  version '4.00.03'

  head 'git://git.savannah.gnu.org/screen.git', :branch => 'master'

  def patches
    "https://raw.github.com/gist/1358618/3d418a3626f19f0a6bdb0c5d9f0ea37f4d43586a/screen-lion-roar.patch"
  end unless ARGV.build_head?

  def install
    if ARGV.build_head?
      cd 'src'
      system "autoconf"
      system "autoheader"
    end

    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}", "--infodir=#{info}",
                          "--enable-colors256"
    system "make"
    system "make install"
  end
end
