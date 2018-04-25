class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.5"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.7.5/credhub-darwin-1.7.5.tgz"
  sha256 "6bedb1d68cfa9be3fedbfe756c4a6640ec383a61af3e56fb5cf74bc0b9c954b3"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
