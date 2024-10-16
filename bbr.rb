#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.71/bbr-1.9.71-darwin-arm64"
      sha256 "474c523143a57c7a2c332e32466dc64e3ecb39ace3c29ca315ccc8ef77d8f7a0"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.71/bbr-1.9.71-darwin-amd64"
      sha256 "474c523143a57c7a2c332e32466dc64e3ecb39ace3c29ca315ccc8ef77d8f7a0"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.71/bbr-1.9.71-linux-amd64"
    sha256 "caa0964eaf1ef24a0e13754e0d5a765cf3b5b8452aab09fcdd0d70a868425464"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.71-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.71-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.71-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
