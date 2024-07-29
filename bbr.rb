#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.67/bbr-1.9.67-darwin-arm64"
      sha256 "3a27ddb24befa4fb5bbdf07f0cc7b6407734f4b61f624c28552fb316eab524eb"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.67/bbr-1.9.67-darwin-amd64"
      sha256 "3a27ddb24befa4fb5bbdf07f0cc7b6407734f4b61f624c28552fb316eab524eb"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.67/bbr-1.9.67-linux-amd64"
    sha256 "dd0c3cb508f71a1c19d3c274ab8c66f2114fff66b6ec3b3137f40be7110fefd4"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.67-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.67-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.67-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
