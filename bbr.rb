#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.74/bbr-1.9.74-darwin-arm64"
      sha256 "61fd29897c6fbe88d59e773809661fef598eea25e7e0ec4689de3b0310fbe808"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.74/bbr-1.9.74-darwin-amd64"
      sha256 "f2530ed06b96b637f74883789d1b352881dbfe76407ac5db1edc5ba27d709d87"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.74/bbr-1.9.74-linux-amd64"
    sha256 "3f7002a1a1e514f0910dc7ebda158ac09ab0c4598f0c8c3f5da70be4627ca564"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.74-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.74-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.74-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
