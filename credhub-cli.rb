class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.7.0/credhub-darwin-1.7.0.tgz"
  sha256 "cebc37ba166193ae9d92e67bf19ad5565699f89b1ab8b311b64f27f931d0b09f"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
