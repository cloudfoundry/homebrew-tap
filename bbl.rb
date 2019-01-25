class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v7.0.8"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "245e1156ff545a1bd155f55d83b83f6df9c96b84c6a784b65355018145bca515"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "838bb66ed6d33b3846257bb7be6b1b10e16334cd8f1c259ae1c0c6669b2bab41"
  end

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.11.0"
  depends_on "cloudfoundry/tap/bosh-cli" => "2.0.48"

  def install
    binary_name = "bbl"
    if OS.mac?
      bin.install "bbl-#{version}_osx" => binary_name
    elsif OS.linux?
      bin.install "bbl-#{version}_linux_x86-64" => binary_name
    end
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
