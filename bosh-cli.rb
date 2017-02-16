class BoshCli < Formula
  desc "New BOSH CLI (beta)"
  homepage "https://bosh.io/docs/cli-v2.html"
  version "2.0.3"
  url "https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-#{version}-darwin-amd64"
  sha256 "d8a4866e84e655c0f6332212f649f65fe0150c765d9965071522bac52f5854fb"

  depends_on :arch => :x86_64

  option "without-bosh2", "Don't rename binary to 'bosh2'. Useful if the old Ruby CLI is not needed."

  def install
    binary_name = build.without?("bosh2") ? "bosh" : "bosh2"
    bin.install "bosh-cli-#{version}-darwin-amd64" => binary_name
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
      complete -F _#{binary_name} #{binary_name}
    completion
  end

  test do
    system "#{bin}/#{binary_name} --help"
  end
end
