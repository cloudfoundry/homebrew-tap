class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v8.2.13"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "5de5d277a43083b41474ee7e2320390e719c96929b1ed025488031c404a6bd10"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "8b5f544cafd8a19dcfca1e36aff2550ae14e76bd0e51f8768cb3606b3d2ea1f4"
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
