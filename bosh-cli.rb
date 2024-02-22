class BoshCli < Formula
  desc "BOSH CLI"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "7.5.3"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-arm64"
      sha256 "e66a12f25497dea499cf769dd2a804370bb15a2a107db93ed6a06c978c4b26af"
    else
      url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
      sha256 "76a9930d24dbad551a0408c7a55cbc263b08e34f5a2948b9da1c1b9bd8207083"
    end
  elsif OS.linux?
    url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-linux-amd64"
    sha256 "0934cc5403761f029b0449d82b2bcb9cebe6b8b7680db4b4af8b008fa2666c4f"
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
