class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.4"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.4/credhub-darwin-2.9.4.tgz"
    sha256 "200d688d73dd2adf624f9529836055dc7ba1a1c9bdccd0c422c843454b7fe7d5"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.4/credhub-linux-2.9.4.tgz"
    sha256 "dd20858958fcb5f9546bd51d533d2f34b1e67f7427e2be75a8f57009cd4e2611"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
