#
# This code has been generated automatically. Any changes will be overwritten.
#
class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry/bosh-backup-and-restore"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.83/bbr-1.9.83-darwin-arm64"
      sha256 "53865b1ba2ddfd1adffb905f61f49a8ba96524458dd881bdd2ec280ae8dad240"
    else
      url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.83/bbr-1.9.83-darwin-amd64"
      sha256 "824e1ac4071f3209fd2f67de4ee0fcc3650ae4a3f1548c85e181bc14895552ed"
    end
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-backup-and-restore/releases/download/v1.9.83/bbr-1.9.83-linux-amd64"
    sha256 "365394ae2bc67761ac9754f1031d348180350cec4996fc5982e4d986aced4a62"
  end

  def install
    binary_name = "bbr"

    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bbr-1.9.83-darwin-arm64" => binary_name
      else
        bin.install "bbr-1.9.83-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bbr-1.9.83-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
