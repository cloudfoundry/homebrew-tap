#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.53/bbr-1.9.53-darwin-arm64"
      sha256 "6c8d3f021921264dd654914c3f4c86ab15dcf2703754e5de01477caa2cfb863f"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.53/bbr-1.9.53-darwin-amd64"
      sha256 "6c8d3f021921264dd654914c3f4c86ab15dcf2703754e5de01477caa2cfb863f"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.53/bbr-1.9.53-linux-amd64"
    sha256 "aa10b46e0557f04d43b0329d3d94de1d8b5eb52b1d278b4c9206e2785390b54f"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.53-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.53-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.53-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
