class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.17"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.17/credhub-darwin-2.9.17.tgz"
    sha256 "b7237997089b8f1c17bb040ad13a8df7cdccf6ba2b0960240246684a70603ef8"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.17/credhub-linux-2.9.17.tgz"
    sha256 "a62c5d4dd7f997fad27543ee2f72e40f4c5114448da42ab839702d4deca97662"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
