class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.14"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.14/credhub-darwin-2.9.14.tgz"
    sha256 "cd7818e3e3427e2b4eca541cafc0663a212f4e10e8a8edb667138c5d48b42088"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.14/credhub-linux-2.9.14.tgz"
    sha256 "79cf9100fd4e0c9024752b097911406bc73d387c985c72330598ba445eb92bfb"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
