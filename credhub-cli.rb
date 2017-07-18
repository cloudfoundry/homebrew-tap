class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.2.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.2.0/credhub-darwin-1.2.0.tgz"
  sha256 "5b647a95aa2a97cb0ac4654d1edacbf7e0a929b4484742ae6e3653910e0ea6d7"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
