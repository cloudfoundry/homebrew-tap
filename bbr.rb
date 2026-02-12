#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.75/bbr-1.9.75-darwin-arm64"
      sha256 "d45640589c57779f1ba7f3616c4f5ef2a5335fb4f4468b61dd748cc39f3d574b"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.75/bbr-1.9.75-darwin-amd64"
      sha256 "e2cad90d5c5c9ce9d4623dae754edb4923a5bd7b29348d1d00b8ad17f9cb3062"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.75/bbr-1.9.75-linux-amd64"
    sha256 "8665e1c02227cb5265236edc0bb4ced0c431d96ae11e992666e53c51bac1e5a8"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.75-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.75-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.75-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
