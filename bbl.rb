class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v8.1.1"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "3094e18c61951c89dd59d49a77e1d0be82189421b01db2aea43590c4e80fd8b5"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "a5ab7a39fff6fa966433cfa1ef084057654e00b6a579e7901d3cd33221db61a7"
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
