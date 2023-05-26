class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry/credhub-cli"
  version "2.9.16"

  if OS.mac?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.16/credhub-darwin-2.9.16.tgz"
    sha256 "1117da40156842f9044013bf28614b88b2f6b5e05ca306d00a23acddb2042015"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/credhub-cli/releases/download/2.9.16/credhub-linux-2.9.16.tgz"
    sha256 "ef37b139ee6e588cc32bc550fbe3be36d1430085347fab2b1629c1f4af5cc04f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
