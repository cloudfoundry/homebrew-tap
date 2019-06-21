class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.5.1"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.1/credhub-darwin-2.5.1.tgz"
    sha256 "e0a6923f9a45045583637f1d0b04f3ea4e7bb522b5880887afb0109b8eb8e54a"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.5.1/credhub-linux-2.5.1.tgz"
    sha256 "6df5d9d2be37a86c2da703c04b38a089e35dc28fe6fce08db2fe9dec9f8c59eb"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
