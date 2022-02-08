class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.9.3"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.3/credhub-darwin-2.9.3.tgz"
    sha256 "4d1ea845e7de9a382e92c86052b01725325acacb8cf2057f00acdc8b9c9686ee"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.3/credhub-linux-2.9.3.tgz"
    sha256 "0acb87ea5d94384af5dd350dc491eafea1ad3c9faf36da08a8985a95a262adbc"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
