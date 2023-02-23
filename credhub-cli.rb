class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.11"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.11/credhub-darwin-2.9.11.tgz"
    sha256 "ad72bd9c6e3ea4bd0ca23f9156ec8c17e64938081c7ea2daf043df29d4e3cf74"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.11/credhub-linux-2.9.11.tgz"
    sha256 "80f2482bf11618e7ed6ff2bf1c1d962935460a879b3db2e0ff45faf906ea2356"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
