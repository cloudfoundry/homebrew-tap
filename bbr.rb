#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.69/bbr-1.9.69-darwin-arm64"
      sha256 "99bc115121835137d41033543de250c1ee4aed6db7c00fc3a81f48b47cec9341"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.69/bbr-1.9.69-darwin-amd64"
      sha256 "99bc115121835137d41033543de250c1ee4aed6db7c00fc3a81f48b47cec9341"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.69/bbr-1.9.69-linux-amd64"
    sha256 "be0b0281cf3f5601a8d3cff910e140d3455c196dde4632e69fbec1928f011c78"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.69-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.69-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.69-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
