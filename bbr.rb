#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.66/bbr-1.9.66-darwin-arm64"
      sha256 "bb2047fb4273c04d986d5c7c945db6455b7a8bab04973249407d4c20dcfa16b4"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.66/bbr-1.9.66-darwin-amd64"
      sha256 "bb2047fb4273c04d986d5c7c945db6455b7a8bab04973249407d4c20dcfa16b4"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.66/bbr-1.9.66-linux-amd64"
    sha256 "71121f0a1134ac193754e29800b54d4896d03931fe928c2691afc26b0451ddc0"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.66-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.66-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.66-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
