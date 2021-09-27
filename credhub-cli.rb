class CredhubCli < Formula
  desc "CredHub CLI"
  homepage "https://github.com/cloudfoundry-incubator/credhub-cli"
  version "2.9.1"

  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.1/credhub-darwin-2.9.1.tgz"
    sha256 "9a995d3d7760439f822c46df65e0f3316d00ab12a40ecb99896fc2586d9a36bd"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.9.1/credhub-linux-2.9.1.tgz"
    sha256 "df8aa256d4563d741bda71e4e0baff077addce8438dba4f9157504b387b93d9f"
  end

  depends_on :arch => :x86_64

  def install
    bin.install "credhub"
  end

  test do
    system "#{bin}/credhub --help"
  end
end
