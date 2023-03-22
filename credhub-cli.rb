class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.13"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.13/credhub-darwin-2.9.13.tgz"
    sha256 "7c373b6793843278e3952d373629ea0503c5b60ce398fd26b9a2c8fa8955f63d"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.13/credhub-linux-2.9.13.tgz"
    sha256 "c4d3465daec4de4ea0fb37df7d6e7b3238ae0bb7938c27e79edbb7d063572e55"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
