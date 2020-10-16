class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.9.0"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.0/credhub-darwin-2.9.0.tgz"
    sha256 "0fe74e42dea746f899a9b0e9e3c0b866c1f4825dfc83ae32d10c28b602aec3df"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.0/credhub-linux-2.9.0.tgz"
    sha256 "f260e926099f9eb9474ab2239851e391bfd0fd1354a52891f3c834cea1630e8a"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
