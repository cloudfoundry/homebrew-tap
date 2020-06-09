require 'formula'

class CfCliAT6 < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.16.1&source=homebrew'
  version '6.16.1'
  sha256 'ba58dda9d4732369ac026524384c9c4d2cabe118f82889b91e2b8a2fc5faa302'

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
