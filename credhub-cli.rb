class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.2.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.2.0/credhub-darwin-1.2.0.tgz"
  sha256 "f0ebdd3810adb709ebd9a95326f8f4a2308a75ef5b7079222576613ae73e36b2"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
