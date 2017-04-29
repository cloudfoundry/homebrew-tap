class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "0.7.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/0.7.0/credhub-darwin-0.7.0.tgz"
  sha256 "f6b25231e414a038dffb368142664c0fc22f1c37fbeaeee7227a7b1da4be9d46"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
