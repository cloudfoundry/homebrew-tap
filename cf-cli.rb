require 'formula'

class CfCli < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.16.0&source=homebrew'
  version '6.16.0'
  sha1 'fc329f4df6c8eedf80857982c2ce8dcef938926b'

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
