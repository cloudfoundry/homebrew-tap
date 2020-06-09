require 'formula'

class CfCliAT6 < Formula
  homepage 'https://github.com/cloudfoundry/cli'
  head 'https://cli.run.pivotal.io/edge?arch=macosx64&source=homebrew'
  url 'https://cli.run.pivotal.io/stable?release=macosx64-binary&version=6.16.1&source=homebrew'
  version '6.16.1'
  sha1 '940a5500557e77be08cc1f9f9040b0775be21551'

  depends_on :arch => :x86_64

  conflicts_with "pivotal/tap/cloudfoundry-cli", :because => "the Pivotal tap ships an older cli distribution"

  def install
    bin.install 'cf'
  end

  test do
    system "#{bin}/cf"
  end
end
