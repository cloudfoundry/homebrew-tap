class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.3.0"
  url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.3.0/credhub-darwin-2.3.0.tgz"
  sha256 "5f979ceb8677e4e8bd85f5ab83ddbc07c817a4b31a30cefdd722fd0d06a6f9a8"

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
