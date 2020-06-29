class Bbr < Formula
  desc "BOSH Backup and Restore CLI"
  homepage "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore"
  version "1.7.2"
  
  if OS.mac?
    url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v#{version}/bbr-#{version}-darwin-amd64"
    sha256 "fb53d4c033ad6442b1aeda52c4ff10a14e5701068b0b19d3021213ca23687128"
  elsif OS.linux?
    url "https://github.com/cloudfoundry-incubator/bosh-backup-and-restore/releases/download/v#{version}/bbr-#{version}-linux-amd64"
    sha256 "a0c460d238ed4815049a2459d98c5ae2b79d16ae8558b1f7d07262de2b8c9faa"
  end
 
  depends_on :arch => :x86_64

  def install
    binary_name = "bbr" 
    if OS.mac?
      bin.install "bbr-#{version}-darwin-amd64" => binary_name
    elsif OS.linux?
      bin.install "bbr-#{version}-linux-amd64" => binary_name
    end
  end

  test do
    system "#{bin}/bbr", "version"
  end
end
