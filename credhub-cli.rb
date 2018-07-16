class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "1.7.7"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/1.7.7/credhub-darwin-1.7.7.tgz"
  sha256 "102e03f672287deeb13f75da6b2a186412ef69f8cd3a9f0a3f2c371f1a830182"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
