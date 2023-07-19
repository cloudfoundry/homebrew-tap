class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.18"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.18/credhub-darwin-2.9.18.tgz"
    sha256 "57311793e59d57015ee39f48b58433023b23c3c9748b1206d1fd0867f9c92fd9"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.18/credhub-linux-2.9.18.tgz"
    sha256 "42af08361a56b1c237e1769b9a599bed48bd155e7c6d9188277b6ae9cd57fd40"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
