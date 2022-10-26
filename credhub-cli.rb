class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.7"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.7/credhub-darwin-2.9.7.tgz"
    sha256 "5c500a1ed2456680ddcbbd5ccad5d4eb2fae75d6a27a374e845d04465ddf1c43"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.7/credhub-linux-2.9.7.tgz"
    sha256 "9f644e4116844b2ea73048e266d96a1537363756ee225e102e1b0109a2547ccf"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
