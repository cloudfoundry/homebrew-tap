#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.62/bbr-1.9.62-darwin-arm64"
      sha256 "ea2fa87e786af7645f5a514d7d93a9c756aa9b9fe34da24c6a0ac0890f0ea209"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.62/bbr-1.9.62-darwin-amd64"
      sha256 "ea2fa87e786af7645f5a514d7d93a9c756aa9b9fe34da24c6a0ac0890f0ea209"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.62/bbr-1.9.62-linux-amd64"
    sha256 "37da1a4244bc0ae3bc0135cff66c582b8447ec9ef6bd1273fdad4ffce9768079"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.62-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.62-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.62-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
