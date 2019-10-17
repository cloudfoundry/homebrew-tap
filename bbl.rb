class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage "https://github.com/cloudfoundry/bosh-bootloader"
  version "v8.3.1"

  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 "dd84a9c10641a200ca49279a01ffcc6aea2fa216e0de3d39b9d3fe642775b2ea"
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 "f60fb83e78dee654e104fa5f101efa10e30ef9bd5102e65805e2545a7f619904"
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
