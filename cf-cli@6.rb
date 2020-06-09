require 'formula'

class CfCliAT6 < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.14.1&source=homebrew'
  version '6.14.1'
  sha1 '914b60aedc4515f3770c46e4bbbf322227dad417'

  depends_on :arch => :x86_64

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
