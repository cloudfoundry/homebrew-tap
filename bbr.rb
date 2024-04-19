#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.64/bbr-1.9.64-darwin-arm64"
      sha256 "7f499a8fd8ca49c76fdf48e4c33ea110c223ec4b0aa8a2eb5ceed429414fa661"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.64/bbr-1.9.64-darwin-amd64"
      sha256 "7f499a8fd8ca49c76fdf48e4c33ea110c223ec4b0aa8a2eb5ceed429414fa661"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.64/bbr-1.9.64-linux-amd64"
    sha256 "8c31c08b1901cebe82e9092d596327df5e5b1c05c072a83dd25c0c32372c72f1"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.64-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.64-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.64-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
