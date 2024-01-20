#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.59/bbr-1.9.59-darwin-arm64"
      sha256 "42beee755b2ac32fd32d10164cf0a10e904ca92e4e797e5be967e1bcd3c023d4"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.59/bbr-1.9.59-darwin-amd64"
      sha256 "42beee755b2ac32fd32d10164cf0a10e904ca92e4e797e5be967e1bcd3c023d4"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.59/bbr-1.9.59-linux-amd64"
    sha256 "621e0b18a33519dce2121781b3fd3dafac6900ce2ea39112e9a07a5535155433"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.59-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.59-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.59-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
