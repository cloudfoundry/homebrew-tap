class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.9.7"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "e644ed9500a9a6d94b1a6dfe9ee8bf19410d5441bef4fd067ff11e2850d2fc43"
    else
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "4c22dd7a274e8aea9a51bdf0fa9680aa448017960fbb8f4e5610ae7804ac09f6"
    end
  elsif OS.linux?
    url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "895c70b81d644a43b39233b3d0dc0aa15c8a612f0a1c66f42462b82b70c50cbe"
  end

  option "with-bosh2", "Rename binary to 'bosh2'. Useful if the old Ruby CLI is needed."

  def install
    binary_name = build.with?("bosh2") ? "bosh2" : "bosh"
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "bosh-cli-#{version}-darwin-arm64" => binary_name
      else
        bin.install "bosh-cli-#{version}-darwin-amd64" => binary_name
      end
    elsif OS.linux?
      bin.install "bosh-cli-#{version}-linux-amd64" => binary_name
    end
    (bash_completion/"bosh-cli").write <<-completion
      _#{binary_name}() {
          # All arguments except the first one
          args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
          # Only split on newlines
          local IFS=$'\n'
          # Call completion (note that the first element of COMP_WORDS is
          # the executable itself)
          COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
          return 0
      }
      complete -o default -F _#{binary_name} #{binary_name}
    completion
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
