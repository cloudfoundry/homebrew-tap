require 'formula'

class CfCli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.23.1&source=homebrew'
  version '6.23.1'
  sha256 'aee12111e7403f97270c59bd2f05551f6b23a30729843ce92a5422d0f319ab60'

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"
  conflicts_with "caskroom/cask/cloudfoundry-cli", :because => "the caskroom tap is not the official distribution"

  def install
    bin.install 'cf'
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf"
  end
end
