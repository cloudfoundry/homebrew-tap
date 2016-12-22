require 'formula'

class CfCli < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.22.1&source=homebrew'
  version '6.22.1'
  sha256 '2da08e15223147d87caf51bc7fff6eb224c3a194d57052e69f3bc2ba05209541'

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"
  conflicts_with "caskroom/cask/cloudfoundry-cli", :because => "the caskroom tap is not the official distribution"

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
