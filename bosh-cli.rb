class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.9.5"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "48366863b5c81fd2a2e69c14acf4a13c3bd99986ff68dbd8c5d2455691e0bb18"
    else
      url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "a0a157bbc18cf75657374b250f2c5631925635044cdd1d5b34938e43a4a8b269"
    end
  elsif OS.linux?
    url "https://storage.googleapis.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "a34e6470810b950aad24482817d8ee587fe7ab37c7df0be4f8d9512fb002140b"
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
