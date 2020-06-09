require 'formula'

class CfCliAT6 < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.17.0&source=homebrew'
  version '6.17.0'
  sha256 '1b6d2f3c76469945dbc91b453689144b2e9ddbc69c41cdf716c34d4f29ed7dfe'

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
