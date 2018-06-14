class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v6.7.8"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "e99d27305af6634c764178c6bece13f5b84b50d27a24ebf2b9c75d29ee21fc5b"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "2b3627a62ecd967e1d6166694be1c5044f9e3af8a1183c3bf978a2a5247c88df"
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
