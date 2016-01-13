require 'formula'

class CfCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.15.0&source=homebrew'
  version '6.15.0'
  sha1 'fba9d38ea53c794e58fb4273658c07d13b771722'

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
