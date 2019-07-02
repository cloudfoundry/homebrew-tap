class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.5.2"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.2/credhub-darwin-2.5.2.tgz"
    sha256 "29168645603eab6c921d2792b75a648ce94344b39c813f617b272f85c634e294"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.2/credhub-linux-2.5.2.tgz"
    sha256 "8a3e20229afd273b7ebea185ded049fa91fa1c86aa547fd3df4631ac08ef316f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
