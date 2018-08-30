class Credhub2Cli < Formula
  desc 'CredHub 2.0 CLI'
  homepage 'https://github.com/cloudfoundry-incubator/credhub-cli'
  version '2.0.0'
  url 'https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.0.0/credhub-darwin-2.0.0.tgz'
  sha256 '2951e134775dd240ca488488fb8f4059b340f9cf0ee4a5555225371ff46a9f8f'

  depends_on arch: :x86_64

  option 'without-credhub2', "Don't rename binary to 'credhub2'. Useful if only working against v2.0 of credhub"

  def install
    binary_name = build.without?('credhub2') ? 'credhub' : 'credhub2'
    bin.install 'credhub' => binary_name
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
