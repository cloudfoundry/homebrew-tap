class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.1.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.1.0/credhub-darwin-2.1.0.tgz"
  sha256 "8759a4f364b0a353ab9db19e8adc986fc3109d398ab29e5584c31127e63171ee"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
