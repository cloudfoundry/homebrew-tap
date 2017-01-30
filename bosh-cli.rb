class BoshCli < Formula
  desc "New BOSH CLI (beta)"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "0.0.151"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "c294af66374d9ca7810edaeb970a837464c30466a0b82aae8923d4088d047e43"

  depends_on :arch => :x86_64

  def install
    bin.install "bosh-cli-#{version}-darwin-amd64" => "gosh"
    (bash_completion/"bosh-cli").write <<-completion
      _gosh() {
          # All arguments except the first one
          args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
          # Only split on newlines
          local IFS=$'\n'
          # Call completion (note that the first element of COMP_WORDS is
          # the executable itself)
          COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
          return 0
      }
      complete -F _gosh gosh
    completion
  end

  test do
    system "#{bin}/gosh --help"
  end
end
