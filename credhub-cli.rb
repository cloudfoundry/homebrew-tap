class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.5.2"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.5.2/credhub-darwin-1.5.2.tgz"
  sha256 "b919d9bcaa1e8ffedcbf440a3366d1c579b7c5e5a900f2468f78da06c88187f0"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
