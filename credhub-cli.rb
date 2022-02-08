class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.9.2"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.2/credhub-darwin-2.9.2.tgz"
    sha256 "c50d335712fc234756b569873a30bfdaacc87897d2bde5460c4844ae0c0adf73"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.2/credhub-linux-2.9.2.tgz"
    sha256 "8d3975cc045b708cdc6a4b16a0ebf5df17e587e6e1b7b1ba08475aee8748f2d9"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
