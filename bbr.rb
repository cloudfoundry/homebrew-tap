#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.70/bbr-1.9.70-darwin-arm64"
      sha256 "d7825a2954e27450b4cee5a437744c4c8d407878d366ef625cd069e6a4432163"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.70/bbr-1.9.70-darwin-amd64"
      sha256 "d7825a2954e27450b4cee5a437744c4c8d407878d366ef625cd069e6a4432163"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.70/bbr-1.9.70-linux-amd64"
    sha256 "636294e621ab5104f411acd7c3208f4e27ceb2d939baad23ccf2f0d23647a443"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.70-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.70-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.70-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
