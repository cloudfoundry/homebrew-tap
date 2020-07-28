require 'formula'

class CfCliAT7 < Formula
  homepage 'https://code.cloudfoundry.org/cli'
  version '7.0.2'

  if OS.mac?
    url 'https://packages.cloudfoundry.org/homebrew/cf7-7.0.2.tgz'
    sha256 '9a1ac2335619ecd5febb165eaa927c144cb3b8ad12de8d8b0e23a0648f6a551a'
  elsif OS.linux?
    url 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=7.0.2&source=homebrew'
    sha256 'd569844ca0cd564476749cde2479fd538823a8600337d04d3b1f1f4dbdb0f762'
  end

  depends_on :arch => :x86_64

  def install
    bin.install 'cf7'
    bin.install_symlink 'cf7' => 'cf'
    (bash_completion/"cf7-cli").write <<-completion
# bash completion for Cloud Foundry CLI

_cf-cli() {
    # All arguments except the first one
    args=("${COMP_WORDS[@]:1:$COMP_CWORD}")
    # Only split on newlines
    local IFS=$'\n'
    # Call completion (note that the first element of COMP_WORDS is
    # the executable itself)
    COMPREPLY=($(GO_FLAGS_COMPLETION=1 ${COMP_WORDS[0]} "${args[@]}"))
    return 0
}
complete -F _cf-cli cf7
complete -F _cf-cli cf
    completion
    doc.install 'LICENSE'
    doc.install 'NOTICE'
  end

  test do
    system "#{bin}/cf7"
  end
end
