#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.57/bbr-1.9.57-darwin-arm64"
      sha256 "0364fbcc512477ae81686b6703e4223a12c587a65666cc437e724a932e8b3ee2"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.57/bbr-1.9.57-darwin-amd64"
      sha256 "0364fbcc512477ae81686b6703e4223a12c587a65666cc437e724a932e8b3ee2"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.57/bbr-1.9.57-linux-amd64"
    sha256 "665f894226906df976e74aabc09bea8b1a60a9ad38ffe36a29ba6fbe2c7aad9c"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.57-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.57-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.57-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
