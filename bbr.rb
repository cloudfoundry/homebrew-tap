#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.72/bbr-1.9.72-darwin-arm64"
      sha256 "4749456bf0abc00781833555abffb522c85b1ec0389b2f0f2b1deb6089aabda3"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.72/bbr-1.9.72-darwin-amd64"
      sha256 "4749456bf0abc00781833555abffb522c85b1ec0389b2f0f2b1deb6089aabda3"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.72/bbr-1.9.72-linux-amd64"
    sha256 "0d495bd1caae70e7bc28aee83f233c0fdd59c50877b120372f9276c59efcb9e4"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.72-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.72-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.72-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
