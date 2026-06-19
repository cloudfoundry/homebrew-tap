#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.79/bbr-1.9.79-darwin-arm64"
      sha256 "eaefbadb283342297f2e71e9d45fe23a246a6b47f55ccef68bddac4abd2dfe51"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.79/bbr-1.9.79-darwin-amd64"
      sha256 "b9e3cdf62d281ac73b192c41998c8f947de1d794ae133ee3e619b62a6f2b0aac"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.79/bbr-1.9.79-linux-amd64"
    sha256 "4c99e6fa6d0a44be6c6c782f09c9d40b56b9b9e6bfb58af8558100ee7341833e"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.79-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.79-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.79-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
