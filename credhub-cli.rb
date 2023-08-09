class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.19"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.19/credhub-darwin-2.9.19.tgz"
    sha256 "f9ff3525bde0193df1ba47b809020a6b597c62c61ba7bcbb94f0300b908d460a"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.19/credhub-linux-2.9.19.tgz"
    sha256 "dcb942badda5db92ed25fa20eefe110a39f8af31ae6cd978aa5b1f0241ae05a6"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
