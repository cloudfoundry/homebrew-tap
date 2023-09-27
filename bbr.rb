#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.51/bbr-1.9.51-darwin-arm64"
      sha256 "d0510bb828065c97b96fe4a7ae4f2193fb74a01aa95173735c015a4cfc0af757"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.51/bbr-1.9.51-darwin-amd64"
      sha256 "d0510bb828065c97b96fe4a7ae4f2193fb74a01aa95173735c015a4cfc0af757"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.51/bbr-1.9.51-linux-amd64"
    sha256 "90415fb88b7717a96fddd9f12e8195314129c746c4b61394e72e9744b1bf6ed0"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.51-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.51-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.51-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
