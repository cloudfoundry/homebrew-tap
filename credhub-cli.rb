class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.9"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.9/credhub-darwin-2.9.9.tgz"
    sha256 "8786366f2870586e70d3e6bd7793777da54cbb9579e87342edfb61e46637b6e5"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.9/credhub-linux-2.9.9.tgz"
    sha256 "d4375dea0f5cca85ca66a72396b5d0b8fded63bef80b5eb96171f692c8f8ffd1"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
