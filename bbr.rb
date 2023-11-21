#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.56/bbr-1.9.56-darwin-arm64"
      sha256 "628154e1674163de9fcbc9595a7474f4e15c582e2b4873cfc7e2be8998fbc2ad"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.56/bbr-1.9.56-darwin-amd64"
      sha256 "628154e1674163de9fcbc9595a7474f4e15c582e2b4873cfc7e2be8998fbc2ad"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.56/bbr-1.9.56-linux-amd64"
    sha256 "37c34ce57f8d681e300dbaf4db46990c0e778e161bbd272ef7b3735f2c5ff524"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.56-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.56-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.56-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
