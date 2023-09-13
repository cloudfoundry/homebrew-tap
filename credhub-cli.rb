class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.20"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.20/credhub-darwin-2.9.20.tgz"
    sha256 "597c7ef9da8ebb9507ba34c750442b4b17ca4275f81c5bb03aaede396fe5d4fb"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.20/credhub-linux-2.9.20.tgz"
    sha256 "a2a6ce2eb7fed728decd35625f9ed945391f9cacb9c9d30b8b30d9cb56083d86"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
