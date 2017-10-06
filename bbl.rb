class Bbl < Formula
  desc "Command line utility for standing up a BOSH director on an IAAS of your choice."
  homepage 'https://github.com/cloudfoundry/bosh-bootloader'
  version 'v4.10.3'
  if OS.mac?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_osx"
    sha256 'd26d512738d09d1e42b1faa04cda40d9773e5f08b23b6c78f493d94931d0cd6f'
  elsif OS.linux?
    url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    sha256 'd3de414360810c9d616fbe1127dd3590a2e0c7a81df5571f59a66cc04b12441f'
  end

  depends_on :arch => :x86_64
  depends_on "terraform" => "0.10.0"
  depends_on "cloudfoundry/tap/bosh-cli" => "2.0.29"

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
