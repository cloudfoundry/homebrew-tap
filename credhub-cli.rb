class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.4.1"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.4.1/credhub-darwin-1.4.1.tgz"
  sha256 "7da92f5fec350ff42d1d111a7cfc3d4c254cc086add48a470b6ed255c262b963"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
